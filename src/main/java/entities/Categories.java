package entities;

import java.sql.*;

public class Categories {

	int cid;
	String name;
	String description;
	
	
	public Categories(int cid, String name, String description) {
		super();
		this.cid = cid;
		this.name = name;
		this.description = description;
	}


	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Categories(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
