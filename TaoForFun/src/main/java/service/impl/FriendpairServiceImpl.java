package service.impl;

import java.util.List;

import model.Friendpair;
import dao.FriendpairDao;
import service.FriendpairService;

public class FriendpairServiceImpl implements FriendpairService{

	private FriendpairDao friendpairDao;
	
	public boolean addFriendpair(Friendpair friendpair){
		Integer ref=(Integer) friendpairDao.save(friendpair);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}
	
	public void deleteFriendpair(Friendpair friendpair){
		friendpairDao.delete(friendpair);
	}
	
	public List<Friendpair> getPairByUsername(String username){
		return friendpairDao.getPairByUsername(username);
	}
	
	public List<Friendpair> getPairByUsernames(String username1, String username2){
		return friendpairDao.getPairByUsernames(username1, username2);
	}
}
