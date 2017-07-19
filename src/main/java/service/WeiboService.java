package service;

import java.sql.Timestamp;
import java.util.List;

import model.Weibo;

public interface WeiboService {
	
	public boolean addWeibo(Weibo weibo);
	
	public void deleteWeibo(Weibo weibo);
	
	public List<Weibo> getWeiboByUsername(String username);
	
	public Weibo getWeiboByWeiboid(int weiboid);
	
	public List<Weibo> getAllWeibo();

	public List<Weibo> getWeiboByFriendlist(List<String> friendnames, Timestamp limitTime);

}
