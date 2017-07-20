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
	private int emailstatus;
	private String validatecode;
	private Date emailregistertime;
	
	
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
		this.emailstatus = status;
		this.validatecode = validatecode;
		this.emailregistertime = registertime;
		
	}
	
	public User(String username, String password, String role){
		this.username = username;
		this.password = password;
		this.role = role;
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
	
	public Date getEmailregistertime(){
		return emailregistertime;
	}
	
	public void setEmailregistertime(Date emailregistertime){
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
	public Date getLastActivateTime(){
		Calendar cl = Calendar.getInstance();
		cl.setTime(emailregistertime);
		cl.add(Calendar.DATE, 2);
		return cl.getTime();
	}
	
}
