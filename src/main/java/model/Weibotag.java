package model;

public class Weibotag {
	private int tagid;
	private int weiboid;
	private String tag;
		
	public Weibotag(){
		
	}
	
	public Weibotag(int weiboid, String tag){
		this.weiboid = weiboid;
		this.tag = tag;
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
	
	public String getTag(){
		return tag;
	}
	
	public void setTag(String tag){
		this.tag = tag;
	}
	
}
