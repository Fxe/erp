package dps.uminho.erp.components.googlemaps;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GoogleMapsAPI {

	public interface GeocodeOutputType {
		public static final String JSON = "json";
		public static final String XML = "xml";
	}
	
	public static boolean VERBOSE = false;
	
	private static final String __GEOCODE_URL = "http://maps.googleapis.com/maps/api/geocode/";
	private static final String __GEOCODE_STATUS_OK = "OK";
	//private static final String __GEOCODE_URL = "http://maps.google.com/maps/api/geocode/";
	
	public static String getGeocodeUrl(String output, String address, boolean sensor)
			throws MalformedURLException, ProtocolException, IOException {
		
		StringBuilder urlBuilder = new StringBuilder( __GEOCODE_URL);
		urlBuilder.append(output).append('?').append("address=").append(address);
		urlBuilder.append('&').append("sensor=").append(sensor);
		
		if (VERBOSE) System.out.println( urlBuilder.toString());
		
		URL urlres = new URL( urlBuilder.toString());
		HttpURLConnection httpcon = (HttpURLConnection) urlres.openConnection();
		httpcon.setRequestMethod("GET");
		httpcon.setRequestProperty("Accept", "text/xml");
		httpcon.connect();
		BufferedReader in = new BufferedReader(new InputStreamReader(httpcon.getInputStream()));
		String inputLine;
		
		StringBuilder res = new StringBuilder();
		while ( (inputLine = in.readLine()) != null) {
			res.append(inputLine).append('\n');
        }
		
		return res.toString();
	}
	
	public static double[][] getGeocodingCoordenates(String address) {
		
		double[][] coords = null;
		
		try {
			String jsonString = GoogleMapsAPI.getGeocodeUrl(GoogleMapsAPI.GeocodeOutputType.JSON, address, false);
			JSONObject result = new JSONObject(jsonString);
			if ( result.get("status").equals(__GEOCODE_STATUS_OK)) {
				JSONArray results = result.getJSONArray("results");
				coords = new double[results.length()][];
				for (int i = 0; i < results.length(); i++) {
					//System.out.println(results.get(i));
					JSONObject location = (JSONObject) results.get(i);
					JSONObject location_geometry = (JSONObject) location.get("geometry");
					JSONObject location_coords = (JSONObject) location_geometry.get("location");
					//System.out.println(location_coords);
					System.out.println( location_coords.getDouble("lat"));
					System.out.println( location_coords.getDouble("lng"));
				}
			} else {
				System.err.println( result.get("status"));
			}
			
		} catch (JSONException jEx) {
			System.err.println("JSON - " + jEx.getMessage());
		} catch (MalformedURLException mURLex) {
			System.err.println("MalformedURL - " + mURLex.getMessage());
		} catch (ProtocolException pEx) {
			System.err.println("Protocol - " + pEx.getMessage());
		} catch (IOException ioex) {
			System.err.println("IO - " + ioex.getMessage());
		}
		
		return coords;
	}
	
	public static void main(String[] args) {
		GoogleMapsAPI.VERBOSE = true;
		try {
			System.out.println(GoogleMapsAPI.getGeocodeUrl(GoogleMapsAPI.GeocodeOutputType.JSON, 
					"1600+Amphitheatre+Parkway,+Mountain+View,+CA", false));
			GoogleMapsAPI.getGeocodingCoordenates("1600+Amphitheatre+Parkway,+Mountain+View,+CA");
			GoogleMapsAPI.getGeocodingCoordenates("3434");
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}
}
