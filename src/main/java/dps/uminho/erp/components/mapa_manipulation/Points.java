package dps.uminho.erp.components.mapa_manipulation;

public class Points 
{
		private double longitude;
		private double latitude;
		private String name;
		
		public Points(double latitude,double longitude, String name)
		{
			this.longitude = longitude;
			this.latitude = latitude;
			this.name =  name;
		}


		public double getLongitude() {return longitude;}
		public double getLatitude()  {return latitude; }
		public String getName()	     {return name;}

		public void setLongitude (double longitude) {this.longitude = longitude;}
		public void setLatitude  (double latitude)  {this.latitude = latitude;  }
		public void setName      (String name)		{this.name = name;}
		
		public String getString(){
			String p = new String();
			
			// "\"latitude\",\"longitude\"
			
			p += "\""+this.latitude + "\""+","+"\""+ this.longitude +"\"";
					
			return p;
		}
}
