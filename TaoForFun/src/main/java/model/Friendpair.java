package model;

public class Friendpair {
	
	private int pairid;
	private String username1;
	private String username2;
	
	public Friendpair(){
		
	}
	
	public Friendpair(String username1, String username2){
		this.username1 = username1;
		this.username2 = username2;
	}
	
	public int getPairid(){
		return this.pairid;
	}
	
	public void setPairid(int pairid){
		this.pairid = pairid;
	}
	
	public String getUsername1(){
		return this.username1;
	}
	
	public void setUsername1(String username1){
		this.username1 = username1;
	}
	
	public String getUsername2(){
		return this.username2;
	}
	
	public void setUsername2(String username2){
		this.username2 = username2;
	}
	
}
