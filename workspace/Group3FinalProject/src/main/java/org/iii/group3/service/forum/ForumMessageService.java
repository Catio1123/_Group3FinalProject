package org.iii.group3.service.forum;

import java.util.List;

import org.iii.group3.persistent.dao.forum.ForumMessageDao;
import org.iii.group3.persistent.model.forum.ForumMessageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForumMessageService {
	@Autowired
	private ForumMessageDao dao;
	
	public ForumMessageBean findById(int id) {
		try {
			return dao.findById(id);			
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<ForumMessageBean> findAll(){
		try {
			return dao.findAll();
		} catch (Exception e) {
			return null;
		}
	}
	
	public boolean insertMessage(ForumMessageBean bean) {
		try {
			dao.insertMessage(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public boolean updateMessage(ForumMessageBean bean) {
		try {
			dao.updateMessage(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public boolean deleteMessage(ForumMessageBean bean) {
		try {
			dao.deleteMessage(bean);
			return true;
		} catch (Exception e) {
			return false;			
		}
	}
}
