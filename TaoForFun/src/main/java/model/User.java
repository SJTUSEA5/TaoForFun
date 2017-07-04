package model;

import java.sql.Date;

public class User {
	private int userid;
	private String username;
	private String password;
	private String email;
	private String headsculptureAddr;
	private String sex;
	private Date birthday;
	private String phone;
	private String role;
	
	public User(){
		
	}
	
	public User(String username, String password, String email, String headsculptureAddr, String sex, Date birthday, String phone, String role){
		this.username = username;
		this.password = password;
		this.email = email;
		this.headsculptureAddr = headsculptureAddr;
		this.sex = sex;
		this.birthday = birthday;
		this.phone = phone;
		this.role = role;
	}
	
	public int getUserid(){
		return this.userid;
	}
	
	public void setUserid(int userid){
		this.userid = userid;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getHeadsculptureAddr(){
		return this.headsculptureAddr;
	}
	
	public void setHeadsculptureAddr(String headsculptureAddr){
		this.headsculptureAddr = headsculptureAddr;
	}
	
	public String getSex(){
		return this.sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	public Date getBirthday(){
		return this.birthday;
	}
	
	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}
	
	public String getPhone(){
		return this.phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getRole(){
		return this.role;
	}
	
	public void setRole(String role){
		this.role = role;
	}
	
}
