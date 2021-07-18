package org.iii.group3.service.forum;

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
	
	public ForumContentBean select(int id) {
		return dao.select(id);
	}
	
	public List<ForumContentBean> selectAll(){
		return dao.selectAll();
	}
	
	public List<ForumContentBean> findBySearch(String name){
		return dao.findBySearch(name);
	}
	
	public boolean insert(ForumContentBean bean) {
		return dao.insert(bean);
	}
	
	public ForumContentBean update(ForumContentBean bean) {
		return dao.update(bean);
	}
	
	public boolean delete(int id) {
		return dao.delete(id);
	}
}
