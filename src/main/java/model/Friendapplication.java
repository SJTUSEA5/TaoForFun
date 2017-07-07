package model;

public class Friendapplication {
	
	private int applicationid;
	private String username1;
	private String username2;
	
	public Friendapplication(){
		
	}
	
	public Friendapplication(String username1, String username2){
		this.username1 = username1;
		this.username2 = username2;
	}
	
	public int getApplicationid(){
		return applicationid;
	}
	
	public void setApplicationid(int applicationid){
		this.applicationid = applicationid;
	}
	
	public String getUsername1(){
		return username1;
	}
	
	public void setUsername1(String username1){
		this.username1 = username1;
	}
	
	public String getUsername2(){
		return username2;
	}
	
	public void setUsername2(String username2){
		this.username2 = username2;
	}
	
}