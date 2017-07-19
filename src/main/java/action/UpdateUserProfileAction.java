package action;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;

public class UpdateUserProfileAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String gender;
	private int age;
	private String city;
	private String birthday;
	private String phone;
	private String introduction;
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getGender(){
		return gender;
	}
	
	public void setGender(String gender){
		this.gender = gender;
	}
	
	public int getAge(){
		return age;
	}
	
	public void setAge(int age){
		this.age = age;
	}
	
	public String getCity(){
		return city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getBirthday(){
		return birthday;
	}
	
	public void setBirthday(String birthday){
		this.birthday = birthday;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getIntroduction(){
		return introduction;
	}
	
	public void setIntroduction(String introduction){
		this.introduction = introduction;
	}
	
	@Override
	public String execute() throws Exception {
		Mongo mongo = new Mongo("localhost", 27017);
		DB taoforfun = mongo.getDB("taoforfun");
		System.out.println("connect to database successfully");
		DBCollection userProfile = taoforfun.getCollection("UserProfile");
		System.out.println("UserProfile选择成功");
		BasicDBObject docFind = new BasicDBObject("username", username);
		DBObject findResult = userProfile.findOne(docFind);
		System.out.println(findResult);
		BasicDBObject doc = new BasicDBObject("username",username).append("gender", gender).append("age", age)
				.append("city", city).append("birthday", birthday).append("phone", phone).append("introduction", introduction);
		userProfile.update(docFind, doc);
		return SUCCESS;
	}
	
	
}
