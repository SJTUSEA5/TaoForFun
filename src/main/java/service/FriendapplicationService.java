package service;

import java.util.List;

import model.Friendapplication;

public interface FriendapplicationService {

	public boolean addFriendapplication(Friendapplication friendapplication);
	
	public void deleteFriendapplication(Friendapplication friendapplication);
	
	public List<Friendapplication> getApplicationByUsername(String username);
	
	public Friendapplication getApplicationByUsernames(String username1, String username2);
	
}
