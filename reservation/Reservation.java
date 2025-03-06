package com.reservation;

public class Reservation {
	private int reservationId;
    private int noOfDays;
    private String cancellationDetails;
    private String pickupDate;
    private String returnDate;
    
    public Reservation(int reservationId, int noOfDays, String cancellationDetails, String pickupDate, String returnDate) {
        this.reservationId = reservationId;
        this.noOfDays = noOfDays;
        this.cancellationDetails = cancellationDetails;
        this.pickupDate = pickupDate;
        this.returnDate = returnDate;
    }
    
    public int getReservationId() {
    	return reservationId; 
    }
    public int getNoOfDays() { 
    	return noOfDays; 
    }
    public String getCancellationDetails() { 
    	return cancellationDetails;
    }
    public String getPickupDate() {
    	return pickupDate; 
    }
    public String getReturnDate() {
    	return returnDate; 
    }
}
