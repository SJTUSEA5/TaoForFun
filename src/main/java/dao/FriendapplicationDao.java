package dao;

import java.util.List;

import model.Friendapplication;

public interface FriendapplicationDao {
	
	public Integer save(Friendapplication friendapplication);
	
	public void delete(Friendapplication friendapplication);
	
	public List<Friendapplication> getApplicationByUsername(String username);
	
	public Friendapplication getApplicationByUsernames(String username1, String username2);
	
}