package dao;

import java.util.List;

import model.Usertag;

public interface UsertagDao {
	
	public Integer save(Usertag usertag);

	public void delete(Usertag usertag);
	
	public Usertag getUsertagByTagid(int tagid);
	
	public List<Usertag> getUsertagByUserid(int userid);

}
