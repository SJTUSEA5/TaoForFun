package dao;

import java.util.List;

import model.Weibo;

public interface WeiboDao {
	
	public Integer save(Weibo weibo);

	public void delete(Weibo weibo);
	
	public List<Weibo> getWeiboByUsername(String username);
	
	public Weibo getWeiboByWeiboid(int weiboid);
	
	public List<Weibo> getAllWeibo();
	
}
