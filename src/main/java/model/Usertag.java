package model;

public class Usertag {
	
	private int tagid;
	private int userid;
	private String tag;
		
	public Usertag(){
		
	}
	
	public Usertag(int userid, String tag){
		this.userid = userid;
		this.tag = tag;
	}
	
	public int getTagid(){
		return tagid;
	}
	
	public void setTagid(int tagid){
		this.tagid = tagid;
	}
	
	public int getUserid(){
		return userid;
	}
	
	public void setUserid(int userid){
		this.userid = userid;
	}
	
	public String getTag(){
		return tag;
	}
	
	public void setTag(String tag){
		this.tag = tag;
	}
}
