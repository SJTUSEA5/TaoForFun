package dao;

import java.util.List;

import model.Usertag;

public interface UsertagDao {
	
	public Integer save(Usertag usertag);

	public void delete(Usertag usertag);
	
	public List<Usertag> getUsertagByTagid(int tagid);
	
	public List<Usertag> getUsertagByUserid(int userid);

	public List<Usertag> getAllUsertags();

}