package dao.impl;

import java.util.List;

import dao.WeibotagDao;
import model.Weibotag;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class WeibotagDaoImpl extends HibernateDaoSupport implements WeibotagDao{
	
	public Integer save(Weibotag weibotag){
		return (Integer) getHibernateTemplate().save(weibotag);
	}

	public void delete(Weibotag weibotag){
		getHibernateTemplate().delete(weibotag);
	}
	
	public List<Weibotag> getWeibotagByTagid(int tagid){
		@SuppressWarnings("unchecked")
		List<Weibotag> weibotags = (List<Weibotag>) getHibernateTemplate().find(
				"from Weibotag as wt where wt.tagid=?", tagid);
		return weibotags;
	}
	
	public List<Weibotag> getWeibotagByWeiboid(int weiboid){
		@SuppressWarnings("unchecked")
		List<Weibotag> weibotags = (List<Weibotag>)getHibernateTemplate()
				.find("from Weibotag wt where wt.weiboid=?", weiboid);
		return weibotags;
	}
	
	public List<Integer> getWeiboidByTagid(int tagid){
		String hql = "from Weibotag as wt where w.tagid = :tagid";
		Query query = getSession().createQuery(hql);
		query.setParameter("tagid", tagid);
		query.setMaxResults(5);
		@SuppressWarnings("unchecked")
		List<Integer> weiboids = query.list();
		return weiboids;
	}
	
	public List<Weibotag> getAllWeibotags(){
		@SuppressWarnings("unchecked")
		List<Weibotag> weibotags = (List<Weibotag>)getHibernateTemplate()
				.find("from Weibotag");
		return weibotags;
	}
}