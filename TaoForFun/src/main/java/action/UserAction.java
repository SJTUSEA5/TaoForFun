package action;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import model.User;
import service.AppService;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String username;
	private String password;
	private String email;
	private String role;
	private HttpSession userSession;
	private AppService appService;
	private String state;
	
	public void setAppService(AppService appService) {
		this.appService = appService;
	}
	
	public void listUsers(){
		List<User> users = appService.getAllUsers();
		request().setAttribute("users", users);
	}
	
	public void login(){
		username = request().getParameter("username");
		password = request().getParameter("password");
		validate();
		User user = appService.Userlogin(username, password);
		if(user == null)state = "fail";
		else {
			userSession = request().getSession();
			userSession.setAttribute("id",user.getId());
			request().setAttribute("session", userSession);
			userSession.setAttribute("user", user);
			listUsers();
		}
	}
	
	public void addUser(){
		username = request().getParameter("username");
		password = request().getParameter("password");
		email = request().getParameter("email");
		role = "Guest";
		User user = new User(username, password, email, role);
		appService.addUser(user);
		request().setAttribute("user", user);
		login();
	}
	
	public void updateUser(){
		int uid = Integer.valueOf(request().getParameter("id")).intValue();
		User user = appService.getUserById(uid);
		if(!request().getParameter("username").equals(user.getUsername()))
			user.setUsername(request().getParameter("username"));
		if(!request().getParameter("password").equals(user.getPassword()))
			user.setPassword(request().getParameter("password"));
		if(!request().getParameter("email").equals(user.getEmail()))
			user.setEmail(request().getParameter("email"));
		if(!request().getParameter("role").equals(user.getRole()))
			user.setRole(request().getParameter("role"));
		appService.updateUser(user);
		listUsers();
	}
	
	public void deleteUser(){
		int Uid = Integer.valueOf(request().getParameter("id")).intValue();
		User user = appService.getUserById(Uid);
		if(user != null)appService.deleteUser(user);
		listUsers();
	}
	
	@Override
	public String execute() throws Exception {
		state = SUCCESS;
		String opt = null;
		opt = request().getParameter("opt");
		if(opt == null)listUsers();
		else if(opt.equals("login"))login();
		else if(opt.equals("add"))addUser();
		else if(opt.equals("update"))updateUser();
		else if(opt.equals("delete"))deleteUser();

		return state;
	}
}
