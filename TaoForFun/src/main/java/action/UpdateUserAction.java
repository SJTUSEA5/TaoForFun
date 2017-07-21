package action;

import java.sql.Date;

import model.User;
import service.UserService;

public class UpdateUserAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private int userid;
	private String username;
//	private String newpassword;
//	private String confirmnew;
	private String role;
	private String email;
	private String gender;
	private int age;
	private Date birthday;
	private String phone;
	private String city;
	private String introduction;

	private UserService userService;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
//	public String getNewpassword() {
//		return newpassword;
//	}
//
//	public void setNewpassword(String newpassword) {
//		this.newpassword = newpassword;
//	}
//	
//	public String getConfirmnew() {
//		return confirmnew;
//	}
//
//	public void setConfirmnew(String confirmnew) {
//		this.confirmnew = confirmnew;
//	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public String execute() throws Exception {

		User user = userService.getUserByUserid(userid);
		if(username != null)user.setUsername(username);
		if(role != null)user.setRole(role);
		if(email != null)user.setEmail(email);
		
		if(gender != null)user.setGender(gender);
		if(age >= 0)user.setAge(age);
		if(birthday != null)user.setBirthday(birthday);
		if(phone != null)user.setPhone(phone);
		if(city != null)user.setCity(city);
		System.out.println(introduction);
		
		if(introduction != null)user.setIntroduction(introduction);
		
		userService.updateUser(user);
		session.put("user", user);
		return SUCCESS;
	}

	

}