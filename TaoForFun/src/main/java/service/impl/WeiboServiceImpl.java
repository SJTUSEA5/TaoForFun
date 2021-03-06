package service.impl;

import java.sql.Timestamp;
import java.util.List;

import model.Weibo;
import service.WeiboService;
import dao.WeiboDao;

public class WeiboServiceImpl implements WeiboService{
	
	private WeiboDao weiboDao;
	
	public void setWeiboDao(WeiboDao weiboDao){
		this.weiboDao = weiboDao;
	}
	
	public boolean addWeibo(Weibo weibo){
		Integer ref=(Integer) weiboDao.save(weibo);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}
	
	public void deleteWeibo(Weibo weibo){
		weiboDao.delete(weibo);
	}
	
	public List<Weibo> getWeiboByUsername(String username){
		return weiboDao.getWeiboByUsername(username);
	}
	
	public List<Weibo> getAllWeibo(){
		return weiboDao.getAllWeibo();
	}

	public Weibo getWeiboByWeiboid(int weiboid) {
		return weiboDao.getWeiboByWeiboid(weiboid);
	}

	@Override
	public List<Weibo> getWeiboByFriendlist(List<String> friendnames, Timestamp limitTime) {
		return weiboDao.getWeiboByFriendlist(friendnames, limitTime);
	}
	
	public List<Weibo> getWeiboByWord(String word){
		return weiboDao.getWeiboByWord(word);
	}

	@Override
	public void updateWeibo(Weibo weibo) {
		weiboDao.update(weibo);
	}

}
