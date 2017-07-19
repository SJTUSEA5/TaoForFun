package dao;

import java.sql.Timestamp;
import java.util.List;

import model.Weibo;

public interface WeiboDao {
	
	public Integer save(Weibo weibo);

	public void delete(Weibo weibo);
	
	public List<Weibo> getWeiboByUsername(String username);
	
	public Weibo getWeiboByWeiboid(int weiboid);
	
	public List<Weibo> getAllWeibo();

	public List<Weibo> getWeiboByFriendlist(List<String> friendnames, Timestamp limitTime);
	
}
