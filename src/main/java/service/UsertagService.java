package service;

import java.util.List;

import model.Usertag;

public interface UsertagService {
	
	public boolean addUsertag(Usertag usertag);
	
	public void deleteUsertag(Usertag usertag);
	
	public List<Usertag> getUsertagByUserid(int userid);
	
	public Usertag getUsertagByTagid(int tagid);

}
