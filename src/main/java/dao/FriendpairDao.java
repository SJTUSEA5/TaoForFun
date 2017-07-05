package dao;

import java.util.List;

import model.Friendpair;

public interface FriendpairDao {
	
	public Integer save(Friendpair friendpair);
	
	public void delete(Friendpair friendpair);
	
	public List<Friendpair> getPairByUsername(String username);
	
	public List<Friendpair> getPairByUsernames(String username1, String username2);
	
}
