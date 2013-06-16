package dps.uminho.erp.components.mapa_manipulation;

import java.util.ArrayList;

public class Points_Manipulation 
{
	
	private ArrayList <Points> routes;
	private ArrayList <Points> group_points;
	private String tag_routes;
	private String tag_group_points;
	
	
	public Points_Manipulation()
	{
		this.routes = new ArrayList <Points>();
		this.group_points = new ArrayList <Points>();
		this.tag_routes = "routes";
		this.tag_group_points = "points";
	}


	public ArrayList <Points> getRoutes() 				{return routes;}
	public ArrayList <Points> getGroup_points() 		{return group_points;}
	public String getTagRoutes()						{return tag_routes;}
	public String getTagGroupPoints()					{return tag_group_points;}
	
	
	public void setRoutes(ArrayList <Points> routes) 				{this.routes = routes;}
	public void setGroup_points(ArrayList <Points> group_points) 	{this.group_points = group_points;}
	public void setTagRoutes(String tag)							{this.tag_routes = tag;}
	public void setTagGroupPoints(String tag)						{this.tag_group_points = tag;}
	
	
	
	/*
	 *  String will have the following format:
	 *  
	 *  {\"array\":+[\"Point p1 latitude",Points p1 longitude"+...]}
	 * 
	 * 
	 */
	
	public String toStringGroupPoints(){
		int size =  this.group_points.size();
		String points = "{\""+this.tag_group_points+"\""+":[";
		
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
	
	public String toStringRoutes()
	{
		int size =  this.group_points.size();
		String points = "{\""+this.routes+"\""+":[";
		
		
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
