package dao;

import java.util.List;

import model.Weibotag;

public interface WeibotagDao {
	
	public Integer save(Weibotag weibotag);

	public void delete(Weibotag weibotag);
	
	public Weibotag getWeibotagByTagid(int tagid);
	
	public List<Weibotag> getWeibotagByWeiboid(int weiboid);
	
	public List<Integer> getWeiboidByTag(String tag);

}
