package model;

//import model.Tag;
//import java.util.Set;
//import java.util.HashSet;

public class Weibotag {
	private int tagid;
	private int weiboid;
//	private Set<Tag> tags = new HashSet<Tag>();
		
	public Weibotag(){
		
	}
	
	public Weibotag(int tagid, int weiboid){
		this.tagid = tagid;
		this.weiboid = weiboid;
	}
	
	public int getTagid(){
		return tagid;
	}
	
	public void setTagid(int tagid){
		this.tagid = tagid;
	}
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
//	public Set<Tag> getTags() {
//		return tags;
//	}
//	
//	public void setTags(Set<Tag> tags) {
//		this.tags = tags;
//	}	
}