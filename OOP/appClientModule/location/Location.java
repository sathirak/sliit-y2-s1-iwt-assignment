package com.location;

public class Location {
    private int location_id;
    private String district;
    private String location_contact_no;
    private String address;
    private String street_no;
    private String city;
    private String street;

    public Location(int location_id, String district, String location_contact_no, String address, 
                   String street_no, String city, String street) {
        this.location_id = location_id;
        this.district = district;
        this.location_contact_no = location_contact_no;
        this.address = address;
        this.street_no = street_no;
        this.city = city;
        this.street = street;
    }

	public int getLocation_id() {
		return location_id;
	}

	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getLocation_contact_no() {
		return location_contact_no;
	}

	public void setLocation_contact_no(String location_contact_no) {
		this.location_contact_no = location_contact_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStreet_no() {
		return street_no;
	}

	public void setStreet_no(String street_no) {
		this.street_no = street_no;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

}