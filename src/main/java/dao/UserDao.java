package dao;

import java.util.List;

import model.User;

public interface UserDao {

	public Integer save(User user);

	public void delete(User user);

	public void update(User user);

	public User getUserByUserid(int id);
	
	public User getUserByUsername(String username);
	
	public User getUserByEmail(String email);

	public List<User> getAllUsers();
	
	public List<User> getUserByUsernameAndPassword(String username, String password);
	
	public List<User> getUserByEmailAndPassword(String email, String password);
	
}
