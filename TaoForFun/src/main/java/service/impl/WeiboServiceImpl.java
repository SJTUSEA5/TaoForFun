package service.impl;

import java.util.List;

import model.Weibo;
import service.WeiboService;
import dao.WeiboDao;

public class WeiboServiceImpl implements WeiboService{
	
	private WeiboDao weiboDao;
	
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

}
