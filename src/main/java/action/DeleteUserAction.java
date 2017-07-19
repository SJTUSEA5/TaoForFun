package action;

import model.User;
import service.UserService;

public class DeleteUserAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private int userid;

	private UserService userService;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public String execute() throws Exception {
		System.out.println(userid);
		User user = userService.getUserByUserid(userid);
		System.out.println(user);
		userService.deleteUser(user);

		return SUCCESS;
	}

}
