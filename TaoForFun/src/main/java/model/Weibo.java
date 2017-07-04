package model;

import model.Comment;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Weibo {
	private int weiboid;
	private String adder;
	private String content;
	private Date time;
	
	
	public Weibo(){
		
	}
	
	public Weibo(String adder, String content, Date time){
		this.adder = adder;
		this.content = content;
		this.time = time;
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
	
	private Set<Comment> comments = new HashSet<Comment>();

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
}
