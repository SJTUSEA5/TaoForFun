package action;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BaseAction extends ActionSupport implements RequestAware,SessionAware,ApplicationAware{

	private static final long serialVersionUID = 1L;

	public HttpServletRequest request() {
		return ServletActionContext.getRequest();
	}

	public HttpSession session() {
		return ServletActionContext.getRequest().getSession();
	}

	public ServletContext application() {
		return ServletActionContext.getServletContext();
	}

	public HttpServletResponse response() {
		return ServletActionContext.getResponse();
	}	
	
	//域对象
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;
	
	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public String execute() throws Exception {
		return null;
	}
}
