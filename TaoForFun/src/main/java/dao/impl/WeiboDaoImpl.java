package dao.impl;

import java.sql.Timestamp;
import java.util.List;

import model.Weibo;

import org.hibernate.Query;
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
				"from Weibo as w where w.adder=?", username);
		return weibos;
	}
	
	public List<Weibo> getAllWeibo(){
		@SuppressWarnings("unchecked")
		List<Weibo> weibos = (List<Weibo>) getHibernateTemplate()
				.find("from Weibo");
		return weibos;
	}


	public Weibo getWeiboByWeiboid(int weiboid) {
		@SuppressWarnings("unchecked")
		List<Weibo> weibos = (List<Weibo>) getHibernateTemplate()
				.find("from Weibo as w where w.weiboid=?", weiboid);
		Weibo weibo = weibos.size() > 0 ? weibos.get(0) : null;
		return weibo;
	}

	public List<Weibo> getWeiboByFriendlist(List<String> friendnames, java.sql.Timestamp limitTime){
		String hql = "from Weibo as w where w.adder in (:friendlist) and w.time > :limitTime";
		Query query = getSession().createQuery(hql);
		query.setParameterList("friendlist", friendnames);
		query.setParameter("limitTime", limitTime);
		@SuppressWarnings("unchecked")
		List<Weibo> weibos = query.list();
		return weibos;
	}

	public List<Weibo> getWeiboByWord(String word){
		System.out.println(word);
		@SuppressWarnings("unchecked")
		List<Weibo> weibos = (List<Weibo>) getHibernateTemplate()
				.find("from Weibo w where w.content like ?", "%"+word+"%");
		return weibos;
	}

	public void update(Weibo weibo) {
		getHibernateTemplate().merge(weibo);
		
	}
	
}