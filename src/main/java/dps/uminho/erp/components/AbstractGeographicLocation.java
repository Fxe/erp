package dps.uminho.erp.components;

public abstract class AbstractGeographicLocation implements IGeographicLocation {
	private final int id;
	private int localization_id;
	private int operatorType_id;
	private String name;
	private String address;
	private String postcode;
	private boolean active;
	
	private double latitude;
	private double longitude;
	
	public AbstractGeographicLocation(int id, int localization_id, int operatorType_id, 
			String name, String address, String postcode) {
		
		this.id = id;
		this.initFields(localization_id, operatorType_id, name, address, postcode, true);
	}
	
	public AbstractGeographicLocation(int id, int localization_id, int operatorType_id, 
			String name, String address, String postcode, boolean active) {
		
		this.id = id;
		this.initFields(localization_id, operatorType_id, name, address, postcode, active);
	}
	
	private void initFields(int localization_id, int operatorType_id, 
			String name, String morada, String codigoPostal, boolean active) {
		
		this.latitude = 0.0d;
		this.longitude = 0.0d;
		this.localization_id = localization_id;
		this.operatorType_id = operatorType_id;
		this.name = name;
		this.address = morada;
		this.postcode = codigoPostal;
		this.active = active;
	}
	
	public int getLocalization_id() {
		return localization_id;
	}

	public void setLocalization_id(int localization_id) {
		this.localization_id = localization_id;
	}

	public int getOperatorType_id() {
		return operatorType_id;
	}

	public void setOperatorType_id(int operatorType_id) {
		this.operatorType_id = operatorType_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMorada() {
		return address;
	}

	public void setMorada(String morada) {
		this.address = morada;
	}

	public String getCodigoPostal() {
		return postcode;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.postcode = codigoPostal;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getId() {
		return id;
	}
	
	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
}