package reservation;

import java.util.Date;

public class ReservationModel {
    private int reservationId;
    private int userId;
    private int vehicleId;
    private int locationId;
    private Date pickupDate;
    private Date returnDate;
    private double amount;
    private int noOfDates;
    private String pickupLocation;
    private String returnLocation;
    private Date createdAt;

    // New fields
    private String userName;
    private String vehicleName;
    private String locationName;

    public ReservationModel() {}

    public ReservationModel(int reservationId, int userId, int vehicleId, int locationId,
                            Date pickupDate, Date returnDate, double amount, int noOfDates,
                            String pickupLocation, String returnLocation, Date createdAt) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.vehicleId = vehicleId;
        this.locationId = locationId;
        this.pickupDate = pickupDate;
        this.returnDate = returnDate;
        this.amount = amount;
        this.noOfDates = noOfDates;
        this.pickupLocation = pickupLocation;
        this.returnLocation = returnLocation;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getReservationId() { return reservationId; }
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getVehicleId() { return vehicleId; }
    public void setVehicleId(int vehicleId) { this.vehicleId = vehicleId; }

    public int getLocationId() { return locationId; }
    public void setLocationId(int locationId) { this.locationId = locationId; }

    public Date getPickupDate() { return pickupDate; }
    public void setPickupDate(Date pickupDate) { this.pickupDate = pickupDate; }

    public Date getReturnDate() { return returnDate; }
    public void setReturnDate(Date returnDate) { this.returnDate = returnDate; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public int getNoOfDates() { return noOfDates; }
    public void setNoOfDates(int noOfDates) { this.noOfDates = noOfDates; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getReturnLocation() { return returnLocation; }
    public void setReturnLocation(String returnLocation) { this.returnLocation = returnLocation; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    // New Getters and Setters
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getVehicleName() { return vehicleName; }
    public void setVehicleName(String vehicleName) { this.vehicleName = vehicleName; }

    public String getLocationName() { return locationName; }
    public void setLocationName(String locationName) { this.locationName = locationName; }

    @Override
    public String toString() {
        return "ReservationModel{" +
                "reservationId=" + reservationId +
                ", userId=" + userId +
                ", vehicleId=" + vehicleId +
                ", locationId=" + locationId +
                ", pickupDate=" + pickupDate +
                ", returnDate=" + returnDate +
                ", amount=" + amount +
                ", noOfDates=" + noOfDates +
                ", pickupLocation='" + pickupLocation + '\'' +
                ", returnLocation='" + returnLocation + '\'' +
                ", createdAt=" + createdAt +
                ", userName='" + userName + '\'' +
                ", vehicleName='" + vehicleName + '\'' +
                ", locationName='" + locationName + '\'' +
                '}';
    }
}
