package action;

import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.util.Date;

import tool.MD5Util;
import tool.SendEmail;
import model.User;
import service.UserService;

public class UpdatePasswordAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private String newpassword;
	private String newconfirm;
	private int userid;
	
	private UserService userService;
	
	public String getNewconfirm() {
		return newconfirm;
	}

	public void setNewconfirm(String newconfirm) {
		this.newconfirm = newconfirm;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		User user = userService.getUserByUserid(userid);
		if(newpassword.equals(newconfirm)) {
			user.setPassword(newpassword);
			session.put("re","please relog in.");
			userService.updateUser(user);
			return SUCCESS;
		}else {
			session.put("message", "please confirm your new password again.");
			return INPUT;
		}
	}
}