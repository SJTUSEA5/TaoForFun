package action;

import java.util.List;

import model.User;
import model.Usertag;

import service.UsertagService;

public class ShowUsertagAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private UsertagService usertagService;
	
	public void setUsertagService(UsertagService usertagService){
		this.usertagService = usertagService;
	}
	
	@Override
	public String execute() throws Exception{
		int userid = ((User) session.get("user")).getUserid();
		List<Usertag> usertags = usertagService.getUsertagByUserid(userid);
		request().setAttribute("usertags", usertags);
		return SUCCESS;
	}
	
}
