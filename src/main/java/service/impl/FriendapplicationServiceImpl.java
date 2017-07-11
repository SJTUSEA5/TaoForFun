package service.impl;

import java.util.List;

import model.Friendapplication;
import dao.FriendapplicationDao;
import service.FriendapplicationService;

public class FriendapplicationServiceImpl implements FriendapplicationService{
	
	private FriendapplicationDao friendapplicationDao;
	
	public void setFriendapplicationDao(FriendapplicationDao friendapplicationDao){
		this.friendapplicationDao = friendapplicationDao;
	}
	
	public boolean addFriendapplication(Friendapplication friendapplication){
		Integer ref=(Integer) friendapplicationDao.save(friendapplication);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}
	
	public void deleteFriendapplication(Friendapplication friendapplication){
		friendapplicationDao.delete(friendapplication);
	}
	
	public List<Friendapplication> getApplicationByUsername(String username){
		return friendapplicationDao.getApplicationByUsername(username);
	}

	public Friendapplication getApplicationByUsernames(String username1, String username2){
		return friendapplicationDao.getApplicationByUsernames(username1, username2);
	}
	
}
