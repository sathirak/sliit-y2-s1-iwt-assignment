package user;
	
import java.util.Date;
	
public class UserModel {
    private int userId;
    private String firstName;
    private String lastName;
    private String licenseNo;
    private Date licenseExpiryDate;
    private String email;
    private String password;
    private String contactNo;

    public UserModel() {}
	
    public UserModel(int userId, String firstName, String lastName, String licenseNo, Date licenseExpiryDate,
                     String email, String password, String contactNo) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.licenseNo = licenseNo;
        this.licenseExpiryDate = licenseExpiryDate;
        this.email = email;
        this.password = password;
        this.contactNo = contactNo;
    }

    public UserModel(String firstName, String lastName, String licenseNo, Date licenseExpiryDate,
                     String email, String password, String contactNo) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.licenseNo = licenseNo;
        this.licenseExpiryDate = licenseExpiryDate;
        this.email = email;
        this.password = password;
        this.contactNo = contactNo;
    }

    public int getUserId() {
        return userId;
    }
	
    public void setUserId(int userId) {
        this.userId = userId;
    }
	
    public String getFirstName() {
        return firstName;
    }
	
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
	
    public String getLastName() {
        return lastName;
    }
	
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
	
    public String getLicenseNo() {
        return licenseNo;
    }
	
    public void setLicenseNo(String licenseNo) {
        this.licenseNo = licenseNo;
    }
	
    public Date getLicenseExpiryDate() {
        return licenseExpiryDate;
    }
	
    public void setLicenseExpiryDate(Date licenseExpiryDate) {
        this.licenseExpiryDate = licenseExpiryDate;
    }
	
    public String getEmail() {
        return email;
    }
	
    public void setEmail(String email) {
        this.email = email;
    }
	
    public String getPassword() {
        return password;
    }
	
    public void setPassword(String password) {
        this.password = password;
    }
	
    public String getContactNo() {
        return contactNo;
    }
	
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
	
    @Override
    public String toString() {
        return "UserModel{" +
                "userId=" + userId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", licenseNo='" + licenseNo + '\'' +
                ", licenseExpiryDate=" + licenseExpiryDate +
                ", email='" + email + '\'' +
                ", contactNo='" + contactNo + '\'' +
                '}';
    }
}
