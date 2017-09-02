package service.impl;

import java.util.List;

import dao.WeibotagDao;
import model.Weibotag;
import service.WeibotagService;

public class WeibotagServiceImpl implements WeibotagService{
	
	private WeibotagDao weibotagDao;
	
	public void setWeibotagDao(WeibotagDao weibotagDao){
		this.weibotagDao = weibotagDao;
	}
	
	public boolean addWeibotag(Weibotag weibotag){
		Integer ref=(Integer) weibotagDao.save(weibotag);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}
	
	public void deleteWeibotag(Weibotag weibotag){
		weibotagDao.delete(weibotag);
	}
	
	public List<Weibotag> getWeibotagByWeiboid(int weiboid){
		return weibotagDao.getWeibotagByWeiboid(weiboid);
	}
	
	public Weibotag getWeibotagByTagid(int tagid){
		return weibotagDao.getWeibotagByTagid(tagid);
	}

	public List<Integer> getWeiboidByTag(String tag){
		return weibotagDao.getWeiboidByTag(tag);
	}
	
}