package com.vehicle;

public class Vehicle {

	private int vehicle_id;
	private String category;
	private String brand;
	private String model;
	private String plate_no;
	private String color;
	private String fuel_option;
	private String gear;
	private int seat_count;
	private float daily_rate;

	public Vehicle(int vehicle_id, String category, String brand, String model, String plate_no, String color,
			String fuel_option, String gear, int seat_count, float daily_rate) {
		this.vehicle_id = vehicle_id;
		this.category = category;
		this.brand = brand;
		this.model = model;
		this.plate_no = plate_no;
		this.color = color;
		this.fuel_option = fuel_option;
		this.gear = gear;
		this.seat_count = seat_count;
		this.daily_rate = daily_rate;

	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public String getType() {
		return category;
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

	public String getGear() {
		return gear;
	}

	public int getSeat_count() {
		return seat_count;
	}

	public float getDaily_rate() {
		return daily_rate;
	}
}
