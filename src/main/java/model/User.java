package model;

import java.beans.Transient;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private int userid;
	private String username;
	private String password;
	private String email;
	private String role;
	private String headimg;
	private int status;
	private String validatecode;
	private Date registertime;
	
	
	public User(){
		
	}
	
	public User(String username, String password, String email, String role){
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
	}
	
	public User(String username, String password, String email, String role,
						int status, String validatecode, Date registertime)
	{
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
		this.status = status;
		this.validatecode = validatecode;
		this.registertime = registertime;
		
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
	
	public int getStatus(){
		return status;
	}
	
	public void setStatus(int status){
		this.status = status;
	}
	
	public String getValidatecode(){
		return validatecode;
	}
	
	public void setValidatecode(String validatecode){
		this.validatecode = validatecode;
	}
	
	public Date getRegistertime(){
		return registertime;
	}
	
	public void setRegistertime(Date registertime){
		this.registertime = registertime;
	}
	
	private Set<Usertag> usertags = new HashSet<Usertag>();

	public Set<Usertag> getUsertags() {
		return usertags;
	}

	public void setUsertags(Set<Usertag> usertags) {
		this.usertags = usertags;
	}
	
	@Transient
	public Date getLastActivateTime(){
		Calendar cl = Calendar.getInstance();
		cl.setTime(registertime);
		cl.add(Calendar.DATE, 2);
		return cl.getTime();
	}
	
}
