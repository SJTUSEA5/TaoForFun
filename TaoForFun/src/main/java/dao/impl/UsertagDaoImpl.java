package dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.UsertagDao;
import model.Usertag;

public class UsertagDaoImpl extends HibernateDaoSupport implements UsertagDao{

	public Integer save(Usertag usertag){
		return (Integer) getHibernateTemplate().save(usertag);
	}

	public void delete(Usertag usertag){
		getHibernateTemplate().delete(usertag);
	}
	
	public List<Usertag> getUsertagByTagid(int tagid){
		@SuppressWarnings("unchecked")
		List<Usertag> usertags = (List<Usertag>) getHibernateTemplate().find(
				"from Usertag as ut where ut.tagid=?", tagid);
		return usertags;
	}
	
	public List<Usertag> getUsertagByUserid(int userid){
		@SuppressWarnings("unchecked")
		List<Usertag> usertags = (List<Usertag>)getHibernateTemplate()
				.find("from Usertag ut where ut.userid=?", userid);
		return usertags;
	}
	
	public List<Usertag> getAllUsertags(){
		@SuppressWarnings("unchecked")
		List<Usertag> usertags = (List<Usertag>)getHibernateTemplate()
				.find("from Usertag");
		return usertags;
	}
	
}