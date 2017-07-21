package model;

import java.beans.Transient;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;
import java.sql.Timestamp;
import java.sql.Date;

public class User {
	private int userid;
	private String username;
	private String password;
	private String email;
	private String role;
	private String headimg;
	private String gender;
	private int age;
	private Date birthday;
	private String phone;
	private String city;
	private String introduction;
	private int emailstatus;
	private String validatecode;
	private Timestamp emailregistertime;
	
	public User(){
		
	}
	
	public User(String username, String password, String role){
		this.username = username;
		this.password = password;
		this.role = role;
	}
	
	public User(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	public int getUserid(){
		return userid;
	}
	
	public void setUserid(int userid){
		this.userid = userid;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getRole(){
		return role;
	}
	
	public void setRole(String role){
		this.role = role;
	}
	
	public String getHeadimg(){
		return headimg;
	}
	
	public void setHeadimg(String headimg){
		this.headimg = headimg;
	}

	public int getEmailstatus(){
		return emailstatus;
	}
	
	public void setEmailstatus(int emailstatus){
		this.emailstatus = emailstatus;
	}
	
	public String getValidatecode(){
		return validatecode;
	}
	
	public void setValidatecode(String validatecode){
		this.validatecode = validatecode;
	}
	
	public Timestamp getEmailregistertime(){
		return emailregistertime;
	}
	
	public void setEmailregistertime(Timestamp emailregistertime){
		this.emailregistertime = emailregistertime;
	}
	
	private Set<Usertag> usertags = new HashSet<Usertag>();
	
	public Set<Usertag> getUsertags() {
		return usertags;
	}
	
	public void setUsertags(Set<Usertag> usertags) {
		this.usertags = usertags;
	}

	@Transient
	public Timestamp getLastActivateTime(){
		Calendar cl = Calendar.getInstance();
		cl.setTime(emailregistertime);
		cl.add(Calendar.DATE, 2);
		Timestamp t = new Timestamp(cl.getTime().getTime()); 
		return t;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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
}
