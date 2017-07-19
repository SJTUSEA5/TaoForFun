package service.impl;

import java.util.List;

import dao.UsertagDao;
import model.Usertag;
import service.UsertagService;

public class UsertagServiceImpl implements UsertagService{
	
	private UsertagDao usertagDao;
	
	public void setUsertagDao(UsertagDao usertagDao){
		this.usertagDao = usertagDao;
	}
	
	public boolean addUsertag(Usertag usertag){
		Integer ref=(Integer) usertagDao.save(usertag);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}
	
	public void deleteUsertag(Usertag usertag){
		usertagDao.delete(usertag);
	}
	
	public List<Usertag> getUsertagByUserid(int userid){
		return usertagDao.getUsertagByUserid(userid);
	}
	
	public Usertag getUsertagByTagid(int tagid){
		return usertagDao.getUsertagByTagid(tagid);
	}


}
