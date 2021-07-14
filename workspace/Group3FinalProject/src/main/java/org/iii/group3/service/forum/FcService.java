package org.iii.group3.service.forum;

import java.io.Serializable;
import java.util.List;

import org.iii.group3.persistent.dao.forum.FcDao;
import org.iii.group3.persistent.model.forum.ForumContentBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@EnableTransactionManagement
public class FcService {

	@Autowired
	private FcDao dao;
	
	public ForumContentBean selectContentById(int id) {
		return dao.selectContentById(id);
	}
	
	public List<ForumContentBean> selectAll(){
		List<ForumContentBean> result = dao.selectAll();
		if(result.isEmpty()) {
			return null;
		}
		return result;
	}
	
	public List<ForumContentBean> findBySearch(String name){
		return dao.findBySearch(name);
	}
	
	public Serializable insert(ForumContentBean bean) {	
		try {
			Serializable result = dao.insert(bean);
			return result;
		} catch (Exception e) {
			return null;
		}
	}
	
	public ForumContentBean update(ForumContentBean bean) {
		try {
			ForumContentBean forumUpdateResult = dao.update(bean);
			return forumUpdateResult;
		} catch (Exception e) {
			return null;
		}
	}
	
	public boolean delete(int id) {
		ForumContentBean findIdResult = dao.selectContentById(id);
		try {
			dao.delete(findIdResult);
			return true;			
		} catch (Exception e) {
			return false;			
		}
	}
}
