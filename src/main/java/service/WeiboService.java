package service;

import java.util.List;

import model.Weibo;

public interface WeiboService {
	
	public boolean addWeibo(Weibo weibo);
	
	public void deleteWeibo(Weibo weibo);
	
	public List<Weibo> getWeiboByUsername(String username);
	
	public Weibo getWeiboByWeiboid(int weiboid);
	
	public List<Weibo> getAllWeibo();

}
