package dps.uminho.erp.io.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import dps.uminho.erp.components.CentroRecepcao;
import dps.uminho.erp.components.Localization;
import dps.uminho.erp.components.OperadorLogistico;
import dps.uminho.erp.components.OperatorType;
import dps.uminho.erp.components.PontoElectrao;
import dps.uminho.erp.components.PontoRecolha;
import dps.uminho.erp.io.ERPDataInterface;

public class ERPMySQLInterface implements ERPDataInterface {

	public static boolean VERBOSE = false;
	
    private boolean connected_ = false;
    private Connection connection_;
    private String databaseName_;
    private String databaseUser_;
    private String databasePass_;
    
    private String mysqlHost_;
    private String mysqlPort_;
    
    public ERPMySQLInterface(String db, String user, String pass) {
        this.databaseName_ = db;
        this.databaseUser_ = user;
        this.databasePass_ = pass;
        this.mysqlHost_ = "localhost";
        this.mysqlPort_ = "3306";
        this.initialize();
	}
    
    public ERPMySQLInterface(String host, int port, String db, String user, String pass) {
        this.databaseName_ = db;
        this.databaseUser_ = user;
        this.databasePass_ = pass;
        this.mysqlHost_ = host;
        this.mysqlPort_ = String.valueOf(port);
        this.initialize();
	}
    
	private void initialize() {
		if ( !this.isInitialized()) {
	        try {
	        	if (VERBOSE) System.out.println("Loading driver...");
	            Class.forName("com.mysql.jdbc.Driver");
	            if (VERBOSE) System.out.println("Driver loaded!");
	        	
	        	this.connection_ = this.getConnection(mysqlHost_, mysqlPort_, databaseName_, databaseUser_, databasePass_);
	            this.connected_ = true;
	        } catch(SQLException sqlEx) {
	        	this.connected_ = false;
	            System.out.println("ERPMySQLInterface::initialize - " + sqlEx.getMessage());
	        } catch(Exception e) {
	        	this.connected_ = false;
	            System.out.println("ERPMySQLInterface::initialize - " + e.getMessage());
	        }
		}
	}
	
	private Connection getConnection(String host, String port, String db, String usr, String pwd) throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://" + host +":" + port + "/" + db + "?user=" + usr + "&password=" + pwd);
	}
	
	@Override
	public boolean isInitialized() {
		return this.connected_;
	}
	
	@Override
	public Localization getLocalizationInformation(int id) {
		Localization localization = null;
		String sql = 
				"SELECT CODLOCAL, CONCELHO, DISTRITO, OBS FROM localizacao WHERE CODLOCAL = ?;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			sqlStatement.setString( 1, Integer.toString(id));
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODLOCAL = ret.getInt(1);
				String CONCELHO = ret.getString(2);
				String DISTRITO = ret.getString(3);
				String OBS = ret.getString(4);
				localization = new Localization( CODLOCAL, CONCELHO, DISTRITO, OBS);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getLocalizationInformation - " + sqlEx.getMessage());
		}
		return localization;
	}
	@Override
	public OperatorType getOperatorTypeInformation(int id) {
		OperatorType operatorType = null;
		String sql = 
				"SELECT CODOP, DESIGNACAO, ABREV, OBS FROM tipooperador WHERE CODOP = ?;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			sqlStatement.setString( 1, Integer.toString(id));
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODOP = ret.getInt(1);
				String DESIGNACAO = ret.getString(2);
				String ABREV = ret.getString(3);
				String OBS = ret.getString(4);
				operatorType = new OperatorType( CODOP, DESIGNACAO, ABREV, OBS);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getOperatorTypeInformation - " + sqlEx.getMessage());
		}
		return operatorType;
	}
	@Override
	public PontoElectrao getPontoElectrao(int id) {
		PontoElectrao pe = null;
		String sql = 
				"SELECT CODPE, CODOP, CODLOCAL, NOME, MORADA, CODPOSTAL, ABERTOPUBLICO, LATITUDE, LONGITUDE FROM pontoelectrao WHERE CODPE = ?;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			sqlStatement.setString( 1, Integer.toString(id));
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODPE = ret.getInt(1);
				int CODOP = ret.getInt(2);
				int CODLOCAL = ret.getInt(3);
				String NOME = ret.getString(4);
				String MORADA = ret.getString(5);
				String CODPOSTAL = ret.getString(6);
				boolean ABERTOPUBLICO = ret.getBoolean(7);
				double LATITUTE = ret.getDouble(8);
				double LONGITUTE = ret.getDouble(9);
				pe = new PontoElectrao(CODPE, CODLOCAL, CODOP, NOME, MORADA, CODPOSTAL, ABERTOPUBLICO);
				pe.setLongitude(LONGITUTE);
				pe.setLatitude(LATITUTE);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getPontoElectrao - " + sqlEx.getMessage());
		}
		return pe;
	}
	@Override
	public PontoRecolha getPontoRecolha(int id) {
		PontoRecolha pr = null;
		String sql = 
				"SELECT CODPR, CODOP, CODLOCAL, NOME, MORADA, CODPOSTAL, LATITUDE, LONGITUDE FROM pontorecolha WHERE CODPR = ?;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			sqlStatement.setString( 1, Integer.toString(id));
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODPR = ret.getInt(1);
				int CODOP = ret.getInt(2);
				int CODLOCAL = ret.getInt(3);
				String NOME = ret.getString(4);
				String MORADA = ret.getString(5);
				String CODPOSTAL = ret.getString(6);
				double LATITUTE = ret.getDouble(7);
				double LONGITUTE = ret.getDouble(8);
				pr = new PontoRecolha(CODPR, CODLOCAL, CODOP, NOME, MORADA, CODPOSTAL);
				pr.setLongitude(LONGITUTE);
				pr.setLatitude(LATITUTE);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getPontoRecolha - " + sqlEx.getMessage());
		}
		return pr;
	}
	@Override
	public CentroRecepcao getCentroRecepcao(int id) {
		CentroRecepcao cr = null;
		String sql = 
				"SELECT CODCR, CODOP, CODLOCAL, NOME, MORADA, CODPOSTAL, LATITUDE, LONGITUDE FROM centrorecepcao WHERE CODCR = ?;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			sqlStatement.setString( 1, Integer.toString(id));
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODCR = ret.getInt(1);
				int CODOP = ret.getInt(2);
				int CODLOCAL = ret.getInt(3);
				String NOME = ret.getString(4);
				String MORADA = ret.getString(5);
				String CODPOSTAL = ret.getString(6);
				double LATITUTE = ret.getDouble(7);
				double LONGITUTE = ret.getDouble(8);
				cr = new CentroRecepcao(CODCR, CODLOCAL, CODOP, NOME, MORADA, CODPOSTAL);
				cr.setLongitude(LONGITUTE);
				cr.setLatitude(LATITUTE);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getCentroRecepcao - " + sqlEx.getMessage());
		}
		return cr;
	}
	@Override
	public OperadorLogistico getOperadorLogistico(int id) {
		OperadorLogistico ol = null;
		String sql = 
				"SELECT CODOL, CODOP, CODLOCAL, NOME, MORADA, CODPOSTAL, LATITUDE, LONGITUDE FROM operadorlogistico WHERE CODOL = ?;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			sqlStatement.setString( 1, Integer.toString(id));
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODOL = ret.getInt(1);
				int CODOP = ret.getInt(2);
				int CODLOCAL = ret.getInt(3);
				String NOME = ret.getString(4);
				String MORADA = ret.getString(5);
				String CODPOSTAL = ret.getString(6);
				double LATITUTE = ret.getDouble(7);
				double LONGITUTE = ret.getDouble(8);
				ol = new OperadorLogistico(CODOL, CODLOCAL, CODOP, NOME, MORADA, CODPOSTAL);
				ol.setLongitude(LONGITUTE);
				ol.setLatitude(LATITUTE);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getOperadorLogistico - " + sqlEx.getMessage());
		}
		return ol;
	}

	@Override
	public void updateLocalizationInformation(Localization localization) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOperatorTypeInformation(OperatorType opType) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePontoElectrao(PontoElectrao pe) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePontoRecolha(PontoRecolha pr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveLocalizationInformation(Localization localization) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveOperatorTypeInformation(OperatorType opType) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void savePontoElectrao(PontoElectrao pe) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void savePontoRecolha(PontoRecolha pr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLocalizationInformation(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOperatorTypeInformation(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePontoElectrao(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePontoRecolha(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Set<Integer> getAllLocalizationIds() {
		Set<Integer> localizationIdSet = new HashSet<Integer> ();
		String sql = 
				"SELECT CODLOCAL FROM localizacao;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODLOCAL = ret.getInt(1);
				localizationIdSet.add(CODLOCAL);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getLocalizationInformation - " + sqlEx.getMessage());
		}
		return localizationIdSet;
	}

	@Override
	public Set<Integer> getAllOperatorTypeIds() {
		Set<Integer> operatorIdSet = new HashSet<Integer> ();
		String sql = 
				"SELECT CODOP FROM tipooperador;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODOP = ret.getInt(1);
				operatorIdSet.add(CODOP);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getAllOperatorTypeIds - " + sqlEx.getMessage());
		}
		return operatorIdSet;
	}

	@Override
	public Set<Integer> getAllPontoElectraoIds() {
		Set<Integer> pontoElectraoIdSet = new HashSet<Integer> ();
		String sql = 
				"SELECT CODPE FROM pontoelectrao;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODPE = ret.getInt(1);
				pontoElectraoIdSet.add(CODPE);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getAllPontoElectraoIds - " + sqlEx.getMessage());
		}
		return pontoElectraoIdSet;
	}

	@Override
	public Set<Integer> getAllPontoRecolhaIds() {
		Set<Integer> pontoRecolhaIdSet = new HashSet<Integer> ();
		String sql = 
				"SELECT CODPR FROM pontorecolha;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODPR = ret.getInt(1);
				pontoRecolhaIdSet.add(CODPR);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getAllPontoRecolhaIds - " + sqlEx.getMessage());
		}
		return pontoRecolhaIdSet;
	}

	@Override
	public Set<Integer> getAllCentroRecepcaoIds() {
		Set<Integer> centroRecepcaoIdSet = new HashSet<Integer> ();
		String sql = 
				"SELECT CODCR FROM centrorecepcao;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODCR = ret.getInt(1);
				centroRecepcaoIdSet.add(CODCR);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getAllCentroRecepcaoIds - " + sqlEx.getMessage());
		}
		return centroRecepcaoIdSet;
	}

	@Override
	public Set<Integer> getAllOperadorLogisticoIds() {
		Set<Integer> operadorLogisticoIdSet = new HashSet<Integer> ();
		String sql = 
				"SELECT CODOL FROM operadorlogistico;";
		try  {
			PreparedStatement sqlStatement = this.connection_.prepareStatement(sql);
			ResultSet ret = sqlStatement.executeQuery();
			while ( ret.next()){
				int CODOL = ret.getInt(1);
				operadorLogisticoIdSet.add(CODOL);
			}
		} catch (SQLException sqlEx) {
			System.err.println( "ERPMySQLInterface::getAllOperadorLogisticoIds - " + sqlEx.getMessage());
		}
		return operadorLogisticoIdSet;
	}


}
