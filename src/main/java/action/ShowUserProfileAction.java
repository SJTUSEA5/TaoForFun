package action;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

import model.User;
import model.UserProfile;

public class ShowUserProfileAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
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
			return SUCCESS;
		}
		else{
			UserProfile up2 = gson.fromJson(findResult.toString(), UserProfile.class);
			request().setAttribute("userprofile", up2);
			return SUCCESS;
		}
	}
}
