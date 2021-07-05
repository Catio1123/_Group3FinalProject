package org.iii.group3.ben.controller.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ForumService {
	
	@Autowired
	private ForumDao forumDao;
	
	public Forum select(int id) {
		return forumDao.select(id);
	}
	
	public List<Forum> selectall(){
		return forumDao.selectall();
	}
	
	public boolean insert(Forum forum) {
		return forumDao.insert(forum);
	}
	
	public boolean update(int id ,String topic,String content,String date) {
		return forumDao.update(id, topic, content, date);
	}
	
	public boolean delete(int id) {
		return forumDao.delete(id);
	}
}
