package user;

public class UserDTO {
	private String id;
	private String name;
	private String password;
	private int ssn;
	private String email;
	
	public UserDTO(String id, String name, String password, int ssn, String email) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.ssn = ssn;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSsn() {
		return ssn;
	}

	public void setSsn(int ssn) {
		this.ssn = ssn;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", name=" + name + ", password=" + password +  ", ssn=" + ssn + ", email=" + email
				+ "]";
	}
	
	
	

}