package action;

import java.sql.Date;

import model.User;
import service.UserService;

public class UpdateBasicInfoAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String username;
	private String email;
	private String name;
	private int age;
	private String gender;
	private Date birthday;
	private String headsculptureAddr;
	private String phone;
	private String city;
	private String introduction;

	private UserService userService;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public String getHeadsculptureAddr() {
		return headsculptureAddr;
	}

	public void setHeadsculptureAddr(String headsculptureAddr) {
		this.headsculptureAddr = headsculptureAddr;
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

		User user = userService.getUserByUsername(username);
		user.setGender(gender);
		user.setEmail(email);
		user.setBirthday(birthday);
		user.setHeadsculptureAddr(headsculptureAddr);
		user.setPhone(phone);
		user.setAge(age);
		user.setName(name);
		user.setIntroduction(introduction);
		user.setCity(city);
		userService.updateUser(user);

		return SUCCESS;
	}

}