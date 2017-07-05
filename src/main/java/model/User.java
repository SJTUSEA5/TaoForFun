package model;

import java.sql.Date;

public class User {
	private int userid;
	private String username;
	private String password;
	private String email;
	private String headsculptureAddr;
	private String gender;
	private String name;
	private int age;
	private Date birthday;
	private String phone;
	private String role;
	private String city;
	private String introduction;
	
	public User(){
		
	}
	
	public User(String username, String password, String email, String headsculptureAddr, String gender,String name,int age, Date birthday, 
					String phone, String role, String introduction){
		this.username = username;
		this.password = password;
		this.email = email;
		this.headsculptureAddr = headsculptureAddr;
		this.gender = gender;
		this.name = name;
		this.age = age;
		this.birthday = birthday;
		this.phone = phone;
		this.role = role;
		this.introduction = introduction;
	}
	
	public User(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	public User(String username, String email, String password, String role){
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
	}
	
	public int getUserid(){
		return this.userid;
	}
	
	public void setUserid(int userid){
		this.userid = userid;
	}
	
	public int getAge(){
		return this.age;
	}
	
	public void setAge(int age){
		this.age = age;
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setName(String name){
		this.name = name;
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
	
	public String getGender(){
		return this.gender;
	}
	
	public void setGender(String gender){
		this.gender = gender;
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
	
	public String getCity(){
		return this.city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getIntroduction(){
		return this.introduction;
	}
	
	public void setIntroduction(String introduction){
		this.introduction = introduction;
	}
	
}
