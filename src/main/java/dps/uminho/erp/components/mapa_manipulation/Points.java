package dps.uminho.erp.components.mapa_manipulation;

public class Points 
{
		private double longitude;
		private double latitude;
		
		
		public Points(double latitude,double longitude)
		{
			this.setLatitude(latitude);
			this.setLongitude(longitude);
		}


		public double getLongitude() {return longitude;}
		public double getLatitude()  {return latitude; }

		public void setLongitude(double longitude) {this.longitude = longitude;}
		public void setLatitude(double latitude)   {this.latitude = latitude;  }
		
		
		public String getString(){
			String p = new String();
			
			// "\"latitude\",\"longitude\"
			
			p += "\""+this.latitude + "\""+","+"\""+ this.longitude +"\"";
					
			return p;
		}
}
