package service.impl;

import java.util.List;

import model.User;
import service.UserService;
import dao.UserDao;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;

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

	public boolean checkUser(User user){
		List<User> users1 = userDao.getUserByUsernameAndPassword(user.getUsername(), user.getPassword());
		if(users1.size()>0){
			user.setUsername(users1.get(0).getUsername());
			user.setPassword(users1.get(0).getPassword());
			user.setEmail(users1.get(0).getEmail());
			user.setHeadsculptureAddr(users1.get(0).getHeadsculptureAddr());
			user.setGender(users1.get(0).getGender());
			user.setName(users1.get(0).getName());
			user.setAge(users1.get(0).getAge());
			user.setBirthday(users1.get(0).getBirthday());
			user.setPhone(users1.get(0).getPhone());
			user.setRole(users1.get(0).getRole());
			user.setCity(users1.get(0).getCity());
			user.setIntroduction(users1.get(0).getIntroduction());
			return true;
		}		
		else{
			List<User> users2 = userDao.getUserByEmailAndPassword(user.getUsername(), user.getPassword());
			if(users2.size()>0){
				user.setUsername(users1.get(0).getUsername());
				user.setPassword(users1.get(0).getPassword());
				user.setEmail(users1.get(0).getEmail());
				user.setHeadsculptureAddr(users1.get(0).getHeadsculptureAddr());
				user.setGender(users1.get(0).getGender());
				user.setName(users1.get(0).getName());
				user.setAge(users1.get(0).getAge());
				user.setBirthday(users1.get(0).getBirthday());
				user.setPhone(users1.get(0).getPhone());
				user.setRole(users1.get(0).getRole());
				user.setCity(users1.get(0).getCity());
				user.setIntroduction(users1.get(0).getIntroduction());
				return true;
			}
			else{ 
				return false;
			}
		}	
	}
	
}
