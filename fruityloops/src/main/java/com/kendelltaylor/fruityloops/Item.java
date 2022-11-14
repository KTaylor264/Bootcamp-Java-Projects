package com.kendelltaylor.fruityloops;

public class Item {
	
	// MEMBER VARIABLES
	private String name;
	private double price;
	
	// CONSTRUCTOR
	public Item(String name, double price) {
		this.name = name;
		this.price = price;
	}

	// SETTERS AND GETTERS
	public String getName()
	{
		return name;
	}
	
	public double getPrice()
	{
		return price;
	}
	
	public void setName(String newName)
	{
		this.name = newName;
	}
	
	public void setPrice(double newPrice)
	{
		this.price = newPrice;
	}
}
