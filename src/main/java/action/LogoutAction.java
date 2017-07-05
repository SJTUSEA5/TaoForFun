package action;

public class LogoutAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	public String checkLogout(){
		if(session.get("user") == null)
			return "input";
		else
			return "success";
	}
	
	@Override
	public String execute() throws Exception {
		session.clear();
		if(session.get("user") == null)
			return "success";
		else
			return "input";
	}
	
}