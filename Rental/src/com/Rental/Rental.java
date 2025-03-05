package com.Rental;

public class Rental {
	
	private int rentalId;
	private String paymentMethod;
	private double downPayment;
	private double toatalPayment;
	private double refund;
	private String paidDate;
	
	public Rental(int rentalId, String paymentMethod, double downPayment, double toatalPayment,
			double refund, String paidDate) {
		
		this.rentalId = rentalId;
		this.paymentMethod = paymentMethod;
		this.downPayment = downPayment;
		this.toatalPayment = toatalPayment;
		this.refund = refund;
		this.paidDate = paidDate;
		
	}

	public int getRentalId() {
		return rentalId;
	}

	public void setRentalId(int rentalId) {
		this.rentalId = rentalId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public double getDownPayment() {
		return downPayment;
	}

	public void setDownPayment(double downPayment) {
		this.downPayment = downPayment;
	}

	public double getToatalPayment() {
		return toatalPayment;
	}

	public void setToatalPayment(double toatalPayment) {
		this.toatalPayment = toatalPayment;
	}

	public double getRefund() {
		return refund;
	}

	public void setRefund(double refund) {
		this.refund = refund;
	}

	public String getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}

}
