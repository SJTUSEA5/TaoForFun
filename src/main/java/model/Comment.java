package model;

import java.sql.Timestamp;

public class Comment {
	private int commentid;
	private int weiboid;
	private String adder;
	private String content;
	private Timestamp time;
	
	public Comment(){
		
	}
	
	public Comment(int weiboid, String adder, String content, Timestamp time){
		this.weiboid = weiboid;
		this.adder = adder;
		this.content = content;
		this.time = time;
	}
	
	public int getCommentid(){
		return commentid;
	}
	
	public void setCommentid(int commentid){
		this.commentid = commentid;
	}
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public String getAdder(){
		return adder;
	}
	
	public void setAdder(String adder){
		this.adder = adder;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public Timestamp getTime(){
		return time;
	}
	
	public void setTime(Timestamp time){
		this.time = time;
	}
	
}