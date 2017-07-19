package model;

import model.Comment;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Weibo {
	private int weiboid;
	private String adder;
	private String content;
	private Timestamp time;
	
	
	public Weibo(){
		
	}
	
	public Weibo(String adder, String content, Timestamp time){
		this.adder = adder;
		this.content = content;
		this.time = time;
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
	
	private Set<Comment> comments = new HashSet<Comment>();

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	private Set<Weibotag> weibotags = new HashSet<Weibotag>();

	public Set<Weibotag> getWeibotags() {
		return weibotags;
	}

	public void setWeibotags(Set<Weibotag> weibotags) {
		this.weibotags = weibotags;
	}
	
}
