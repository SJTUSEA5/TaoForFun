package action;

import tool.MD5Util;
import tool.SendEmail;

import java.util.Date;

import model.User;
import service.UserService;

public class RegisterAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String username;
	private String email;
	private String password;
	private String confirmpassword;
	

	private UserService userService;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String registerUser() {
		System.out.println(username);
		session.put("message", "");
		session.put("msg", "");
		if(password.equals(confirmpassword)){
			User user1 = userService.getUserByUsername(username); 
        	User user2 = userService.getUserByEmail(email);
        	if (user1 == null && user2 == null){  
        		User newUser = new User(username,  password, email, "guest");
        		newUser.setStatus(0);
        		newUser.setRegistertime(new Date());
        		newUser.setValidatecode(MD5Util.encode2hex(email));
        		userService.addUser(newUser);
        		StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");  
                sb.append("<a href=\"http://localhost:8080/TaoForFun/validateRegisterPro?email=");  
                sb.append(email);   
                sb.append("&validatecode=");   
                sb.append(newUser.getValidatecode());  
                sb.append("\">http://localhost:8080/TaoForFun/user/validateRegisterPro?email=");   
                sb.append(email);  
                sb.append("&validatecode=");  
                sb.append(newUser.getValidatecode());  
                sb.append("</a>"); 
                
                SendEmail.send(email, sb.toString());
                System.out.println("发送邮件");
                
                session.put("message", "注册完成，请尽快激活您的邮箱");
                return "success";
        	}
        	else{
        		session.put("msg", "the username or email has been used");
        		return "input";
        	}
		}
		else{
			session.put("msg", "not the same password");
			return "input";
		}
	}

}