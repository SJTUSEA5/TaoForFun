package service;

import java.util.List;

import model.Weibotag;

public interface WeibotagService {

	public boolean addWeibotag(Weibotag weibotag);
	
	public void deleteWeibotag(Weibotag weibotag);
	
	public List<Weibotag> getWeibotagByWeiboid(int weiboid);
	
	public List<Weibotag> getWeibotagByTagid(int tagid);
	
	public List<Integer> getWeiboidByTagid(int tagid);
	
	public List<Weibotag> getAllWeibotags();
	
}