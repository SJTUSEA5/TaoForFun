package dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.FriendapplicationDao;
import model.Friendapplication;

public class FriendapplicationDaoImpl extends HibernateDaoSupport implements FriendapplicationDao{
	
	public Integer save(Friendapplication friendapplication){
		return (Integer) getHibernateTemplate().save(friendapplication);		
	}
	
	public void delete(Friendapplication friendapplication){
		getHibernateTemplate().delete(friendapplication);				
	}
	
	public List<Friendapplication> getApplicationByUsername(String username){
		@SuppressWarnings("unchecked")
		List<Friendapplication> applications = (List<Friendapplication>) getHibernateTemplate().find(
				"from Friendapplication as fa where fa.username2=? ", username);
		return applications;
	}
	
	public Friendapplication getApplicationByUsernames(String username1, String username2){
		@SuppressWarnings("unchecked")
		List<Friendapplication> applications = (List<Friendapplication>) getHibernateTemplate().find(
				"from Friendapplication as fa where fa.username1=? and fa.username2=? ", username1 ,username2);
		Friendapplication application = applications.get(0);
		return application;
	}
	
}
