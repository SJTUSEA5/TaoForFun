package action;

import model.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Tag;
import model.Usertag;
import service.UsertagService;
import service.UserService;
import service.TagService;

public class LoginAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String loginname;
	private String password;

	private UsertagService usertagService;
	private UserService userService;
	private TagService tagService;

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsertagService(UsertagService usertagService) {
		this.usertagService = usertagService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public void setTagService(TagService tagService){
		this.tagService = tagService;
	}
	
	public String checkLogin(){
		if(session.get("user") == null)
			return "success";
		else
			return "input";
	}
	
	
	@Override
	public String execute() throws Exception {
		session.put("re", "");
		System.out.println(userService);
		if (userService.checkUser(loginname, password)){
			
			List<Tag> alltags = tagService.getAllTags();
			Map<Integer, Tag> tags = new HashMap<Integer, Tag>();
			for(Tag t : alltags){
				tags.put(Integer.valueOf(t.getTagid()), t);
			}
			session.put("tags", tags);
			
			if(userService.getUserByUsername(loginname) == null){
				User user = userService.getUserByEmail(loginname);
				List<Usertag> usertags = usertagService.getUsertagByUserid(user.getUserid());
				session.put("usertags", usertags);
				session.put("user", user);
				return "success";
			}
			else{
				User user = userService.getUserByUsername(loginname);
				List<Usertag> usertags = usertagService.getUsertagByUserid(user.getUserid());
				session.put("usertags", usertags);
				session.put("user", user);
				return "success";				
			}
		}
		else{
			session.put("re","incorrect username or password.");
			return "input";
		}
	}
	
}