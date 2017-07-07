package service.impl;

import java.util.List;

import model.User;
import service.UserService;
import dao.UserDao;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	

	public boolean addUser(User user) {
		Integer ref=(Integer) userDao.save(user);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}

	public void deleteUser(User user) {
		userDao.delete(user);
	}

	public void updateUser(User user) {
		userDao.update(user);
	}

	public User getUserByUserid(int userid) {
		return userDao.getUserByUserid(userid);
	}
	
	public User getUserByUsername(String username){
		return userDao.getUserByUsername(username);
	}
	
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	public boolean checkUser(String loginname, String password){
		List<User> users1 = userDao.getUserByUsernameAndPassword(loginname, password);
		if(users1.size()>0){
			return true;
		}		
		else{
			List<User> users2 = userDao.getUserByEmailAndPassword(loginname, password);
			if(users2.size()>0){
				return true;
			}
			else{ 
				return false;
			}
		}	
	}
	
}
