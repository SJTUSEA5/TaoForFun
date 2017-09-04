package action;

import model.User;

import service.UserService;

public class MessageBoxAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private int receiveid;
	private UserService userService;
	
	public int getReceiveid() {
		return receiveid;
	}
	
	public void setReceiveid(int receiveid) {
		this.receiveid = receiveid;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception {
		
		User user = userService.getUserByUserid(receiveid);
		request().setAttribute("receive", user);
		return SUCCESS;
	}
}
