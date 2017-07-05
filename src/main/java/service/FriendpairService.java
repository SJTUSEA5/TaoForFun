package service;

import java.util.List;

import model.Friendpair;

public interface FriendpairService {
	
	public boolean addFriendpair(Friendpair friendpair);
	
	public void deleteFriendpair(Friendpair friendpair);
	
	public List<Friendpair> getPairByUsername(String username);
	
	public List<Friendpair> getPairByUsernames(String username1, String username2);
	
}
