package com.location;

public class Location {
    private int locId;
    private String country;
    private String state;
    private String city;
    private String phone;
    private String streetNo;
    private String street;
    
    public Location() {}

    public Location(int locId, String country, String state, String city, String phone, String streetNo, String street) {
        this.locId = locId;
        this.country = country;
        this.state = state;
        this.city = city;
        this.phone = phone;
        this.streetNo = streetNo;
        this.street = street;
    }

    public int getLocId() { return locId; }
    public void setLocId(int locId) { this.locId = locId; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getStreetNo() { return streetNo; }
    public void setStreetNo(String streetNo) { this.streetNo = streetNo; }

    public String getStreet() { return street; }
    public void setStreet(String street) { this.street = street; }
}