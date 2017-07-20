package action;

import java.util.Date;

import tool.MD5Util;
import tool.SendEmail;
import model.User;
import service.UserService;

public class UpdateEmailAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private String email;
	
	private UserService userService;
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		int userid = ((User)session.get("user")).getUserid();
		User user = userService.getUserByUserid(userid);
		user.setEmailregistertime(new Date());
		user.setValidatecode(MD5Util.encode2hex(email));
		userService.updateUser(user);
		StringBuffer sb=new StringBuffer("点击下面链接激活邮箱，48小时生效，链接只能使用一次，请尽快激活！</br>");  
        sb.append("<a href=\"http://localhost:8080/TaoForFun/validateUpdateEmailPro?email=");  
        sb.append(email);   
        sb.append("&validatecode=");   
        sb.append(user.getValidatecode());  
        sb.append("&userid=");   
        sb.append(user.getUserid()); 
        sb.append("\">http://localhost:8080/TaoForFun/user/validateUpdateEmailUpdatePro?email=");   
        sb.append(email);  
        sb.append("&validatecode=");  
        sb.append(user.getValidatecode());  
        sb.append("&userid=");  
        sb.append(user.getUserid());  
        sb.append("</a>"); 
        
        SendEmail.send(email, sb.toString());
        System.out.println("发送邮件");
        
        session.put("message", "已发送验证邮件");
		
		return SUCCESS;
	}
	
}
