package action;

import model.Weibo;
import service.WeiboService;

import java.util.List;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

import model.UserProfile;

public class ShowUserInfoAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private String username;
	
	private WeiboService weiboService;
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	@Override
	public String execute() throws Exception{
		
		Gson gson = new Gson();
		Mongo mongo = new Mongo("localhost", 27017);
		DB taoforfun = mongo.getDB("taoforfun");
		System.out.println("connect to database successfully");
		DBCollection userProfile = taoforfun.getCollection("UserProfile");
		System.out.println("UserProfile选择成功");
		BasicDBObject docFind = new BasicDBObject("username", username);
		DBObject findResult = userProfile.findOne(docFind);
		if(findResult == null){
			BasicDBObject doc = new BasicDBObject("username",username).append("gender", "").append("age", "").append("city", "")
					.append("birthday", "").append("phone", "").append("introduction", "");
			userProfile.insert(doc);
			UserProfile up1 = gson.fromJson(doc.toString(), UserProfile.class);
			request().setAttribute("userprofile", up1);
		}
		else{
			UserProfile up2 = gson.fromJson(findResult.toString(), UserProfile.class);
			request().setAttribute("userprofile", up2);
		}
		
		List<Weibo> weibos = weiboService.getWeiboByUsername(username);
		request().setAttribute("weibos", weibos);
		
		return SUCCESS;
	}
	
}
