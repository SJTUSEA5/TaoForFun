package model;

import java.sql.Date;

public class Comment {
	private int commentid;
	private int weiboid;
	private String adder;
	private String content;
	private Date time;
	
	public Comment(){
		
	}
	
	public Comment(int weiboid, String adder, String content, Date time){
		this.weiboid = weiboid;
		this.adder = adder;
		this.content = content;
		this.time = time;
	}
	
	public int getCommentid(){
		return this.commentid;
	}
	
	public void setCommentid(int commentid){
		this.commentid = commentid;
	}
	
	public int getWeiboid(){
		return this.weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public String getAdder(){
		return this.adder;
	}
	
	public void setAdder(String adder){
		this.adder = adder;
	}
	
	public String getContent(){
		return this.content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public Date getTime(){
		return this.time;
	}
	
	public void setTime(Date time){
		this.time = time;
	}
	
}
