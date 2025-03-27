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

}