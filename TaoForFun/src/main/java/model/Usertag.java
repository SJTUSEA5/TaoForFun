package model;

//import model.Tag;
//import java.util.Set;
//import java.util.HashSet;

public class Usertag {
	
	private int tagid;
	private int userid;
//	private Set<Tag> tags = new HashSet<Tag>();
	
	public Usertag(){
		
	}
	
	public Usertag(int tagid, int userid){
		this.tagid = tagid;
		this.userid = userid;
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

//	public Set<Tag> getTags() {
//		return tags;
//	}
//
//	public void setTags(Set<Tag> tags) {
//		this.tags = tags;
//	}
}