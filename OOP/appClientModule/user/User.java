package user;

public class User {
	
    private String firstName;
    private String lastName;
    private String userId;
    private String email;
    private String password;
    private String licenseNo;
    private String licenseExpiryDate;
    private String contactNo;
 
	public User(String firstName, String lastName, String userId, String email, String password, String licenseNo,
			String licenseExpiryDate, String contactNo) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.licenseNo = licenseNo;
		this.licenseExpiryDate = licenseExpiryDate;
		this.contactNo = contactNo;
	}

}
