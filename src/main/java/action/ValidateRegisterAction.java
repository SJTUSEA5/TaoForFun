package action;

import java.util.Date;

import model.User;
import service.UserService;

public class ValidateRegisterAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private String email;
	private String validatecode;
	
	private UserService userService;
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String validatecode(){
		return validatecode;
	}
	
	public void setValidatecode(String validatecode){
		this.validatecode = validatecode;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		session.put("message", "");
		User user = userService.getUserByEmail(email);
		if(user!=null){
			if(user.getStatus()==0){
				Date currentTime = new Date();
				currentTime.before(user.getRegistertime());
				if(currentTime.before(user.getLastActivateTime())){
					if(validatecode.equals(user.getValidatecode())){
						user.setStatus(1);
						userService.updateUser(user);
						session.put("message", "您的邮箱已成功激活，现在可以去登录了");
					}
					else{
						session.put("message", "激活码不正确");
					}
				}
				else{
					session.put("message", "激活码已过期");
				}
			}
			else{
				session.put("message", "邮箱已激活，请登录");
			}
		}
		else{
			session.put("message", "该邮箱未注册（邮箱地址不存在）");
		}
		return SUCCESS;
	}
	
}
