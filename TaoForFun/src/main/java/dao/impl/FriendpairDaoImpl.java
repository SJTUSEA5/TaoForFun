package dao.impl;

import java.util.List;

import model.Friendpair;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.FriendpairDao;

public class FriendpairDaoImpl extends HibernateDaoSupport implements FriendpairDao{
	
	public Integer save(Friendpair friendpair){
		return (Integer) getHibernateTemplate().save(friendpair);		
	}
	
	public void delete(Friendpair friendpair){
		getHibernateTemplate().delete(friendpair);				
	}
	
	public List<Friendpair> getPairByUsername(String username){
		@SuppressWarnings("unchecked")
		List<Friendpair> pairs = (List<Friendpair>) getHibernateTemplate().find(
				"from Friendpair as fp where fp.username1=? or fp.username2=?", username, username);
		return pairs;
	}
	
	public List<Friendpair> getPairByUsernames(String username1, String username2){
		@SuppressWarnings("unchecked")
		List<Friendpair> pairs = (List<Friendpair>) getHibernateTemplate().find(
				"from Friendpair as fp where (fp.username1=? and fp.username2=?) or (fp.username1=? and fp.username2=?)",
																		username1, username2, username2, username1);
		return pairs;
	}

}
