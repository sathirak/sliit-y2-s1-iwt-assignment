package vehicle;

public class Vehicle {

	private int vehicle_id;
	private String category;
	private String model;
	private String brand;
	private String gear;
	private String color;
	private int seat_no;
	private String fuel_option;
	private String plate_no;
	private float daily_rate;

	public Vehicle(int vehicle_id, String category, String model, String brand, String gear, String color, int seat_no,
			String fuel_option, String plate_no, float daily_rate) {
		this.vehicle_id = vehicle_id;
		this.category = category;
		this.model = model;
		this.brand = brand;
		this.gear = gear;
		this.color = color;
		this.seat_no = seat_no;
		this.fuel_option = fuel_option;
		this.plate_no = plate_no;
		this.daily_rate = daily_rate;
	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public String getCategory() {
		return category;
	}

	public String getModel() {
		return model;
	}

	public String getBrand() {
		return brand;
	}

	public String getGear() {
		return gear;
	}

	public String getColor() {
		return color;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public String getFuel_option() {
		return fuel_option;
	}

	public String getPlate_no() {
		return plate_no;
	}

	public float getDaily_rate() {
		return daily_rate;
	}

}
