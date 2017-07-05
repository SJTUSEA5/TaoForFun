package service;

import java.util.List;

import model.User;

public interface UserService {

	public boolean addUser(User user);

	public void deleteUser(User user);

	public void updateUser(User user);

	public User getUserByUserid(int userid);
	
	public User getUserByUsername(String username);
	
	public User getUserByEmail(String email);

	public List<User> getAllUsers();
	
	public boolean checkUser(User user);
	
}
