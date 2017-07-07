package dao.impl;

import java.util.List;

import model.Weibo;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.WeiboDao;

public class WeiboDaoImpl extends HibernateDaoSupport implements WeiboDao{
	
	public Integer save(Weibo weibo){
		return (Integer) getHibernateTemplate().save(weibo);
	}

	public void delete(Weibo weibo){
		getHibernateTemplate().delete(weibo);
	}
	
	public List<Weibo> getWeiboByUsername(String username){
		@SuppressWarnings("unchecked")
		List<Weibo> weibos = (List<Weibo>) getHibernateTemplate().find(
				"from Weibo as b where b.username=?", username);
		return weibos;
	}
	
	public List<Weibo> getAllWeibo(){
		@SuppressWarnings("unchecked")
		List<Weibo> weibos = (List<Weibo>) getHibernateTemplate()
				.find("from Weibo");
		return weibos;
	}
}
