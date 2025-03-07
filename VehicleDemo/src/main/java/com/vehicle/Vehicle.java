package com.vehicle;

public class Vehicle {

	private int vehicle_id;
	private String brand;
	private String model;
	private String plate_no;
	private String color;
	private String fuel_option;
	private int seat_count;
	private float daily_rate;
	
	
	public Vehicle(int vehicle_id, String brand, String model, String plate_no, String color, String fuel_option, int seat_count, float daily_rate) {
		this.vehicle_id = vehicle_id;
		this.brand = brand;
		this.model = model;
		this.plate_no = plate_no;
		this.color = color;
		this.fuel_option = fuel_option;
	}


	public int getVehicle_id() {
		return vehicle_id;
	}


	public String getBrand() {
		return brand;
	}


	public String getModel() {
		return model;
	}


	public String getPlate_no() {
		return plate_no;
	}


	public String getColor() {
		return color;
	}


	public String getFuel_option() {
		return fuel_option;
	}


	public int getSeat_count() {
		return seat_count;
	}


	public float getDaily_rate() {
		return daily_rate;
	}

}
