package dps.uminho.erp.components.mapa_manipulation;

import java.util.ArrayList;

public class Points_Manipulation 
{
	
	private ArrayList <Points> routes;
	private ArrayList <Points> group_points;
	
	
	public Points_Manipulation()
	{
		this.setGroup_points(new ArrayList <Points>());
		this.setRoutes(new ArrayList <Points>());
	}


	public ArrayList <Points> getRoutes() {
		return routes;
	}


	public void setRoutes(ArrayList <Points> routes) {
		this.routes = routes;
	}


	public ArrayList <Points> getGroup_points() {
		return group_points;
	}


	public void setGroup_points(ArrayList <Points> group_points) {
		this.group_points = group_points;
	}
	
	
	
	/*
	 *  String will have the following format:
	 *  
	 *  {\"array\":+[\"Point p1 latitude",Points p1 longitude"+...]}
	 * 
	 * 
	 */
	
	public String toStringGroupPoints(){
		int size =  this.group_points.size();
		String points = "{\""+"array"+"\""+":[";
		
		//page.addAttribute("latitude", "{\"array\":[\"50.0000\",\"25.0000\"]}");
		
		for(int i = 0; i < size; i++)
		{
			points += this.group_points.get(i).getString();
			
			if( i < size - 1)
			{
				points += ",";
			}
		}
		
		points += "]}";
	
		return points;
		
	}
	
	public String toStringRoutes(){
		int size =  this.group_points.size();
		String points = "{\""+"array"+"\""+":[";
		
		
		//page.addAttribute("latitude", "{\"array\":[\"50.0000\",\"25.0000\"]}");
		
		for(int i = 0; i < size; i++)
		{
			points += this.routes.get(i).getString();
			
			if( i < size - 1)
			{
				points += ",";
			}
		}
		
		points += "]}";
	
		return points;
		
	}
	
}
