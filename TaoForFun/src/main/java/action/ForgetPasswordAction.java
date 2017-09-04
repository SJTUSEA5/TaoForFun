package action;

import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.util.Date;

import tool.MD5Util;
import tool.SendEmail;
import model.User;
import service.UserService;

public class ForgetPasswordAction extends BaseAction{

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
		User user = userService.getUserByEmail(email);
		if(user == null) {
			session.put("message", "No account uses this email, please check it.");
			return INPUT;
		}else {
			
			StringBuffer sb=new StringBuffer("点击下面链接更改密码，48小时生效，链接只能使用一次，请尽快使用！</br>");  
	        sb.append("<a href=\"http://localhost:8080/TaoForFun/changePasswordPro?email=");  
	        sb.append(email);   
	        sb.append("&validatecode=");   
	        sb.append(user.getValidatecode());  
	        sb.append("&userid=");   
	        sb.append(user.getUserid()); 
	        sb.append("\">http://localhost:8080/TaoForFun/user/changePasswordPro?email=");   
	        sb.append(email);  
	        sb.append("&validatecode=");  
	        sb.append(user.getValidatecode());  
	        sb.append("&userid=");  
	        sb.append(user.getUserid());  
	        sb.append("</a>"); 
	        
	        SendEmail.send(email, sb.toString());
	        System.out.println("发送邮件");
	        
	        session.put("message", "We've sent an email to your email address. Please check it");
	        return SUCCESS;
		}	
	}
	
}