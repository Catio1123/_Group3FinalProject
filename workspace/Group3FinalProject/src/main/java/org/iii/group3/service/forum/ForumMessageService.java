package org.iii.group3.service.forum;

import java.util.List;

import javax.transaction.Transactional;

import org.iii.group3.persistent.dao.forum.ForumMessageDao;
import org.iii.group3.persistent.model.forum.ForumMessageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ForumMessageService {
	
	@Autowired
	private ForumMessageDao dao;
	
	public ForumMessageBean findById(int id) {
		try {
			return dao.findById(id);			
		} catch (Exception e) {
			System.out.println("findById error: "+e.getMessage());
			return null;
		}
	}
	
	public List<ForumMessageBean> findByContentId(int id){
		try {			
			return dao.findByContentId(id);
		} catch (Exception e) {
			System.out.println("findByContentId error: "+e.getMessage());
			return null;
		}
	}
	
	public String insertMessage(ForumMessageBean bean) {
		try {
			dao.insertMessage(bean);
			return "新增成功";
		} catch (Exception e) {
			String error = "刪除 error: " + e.getMessage();
			return error;
		}
	}
	
	public String updateMessage(ForumMessageBean bean) {
		try {
			dao.updateMessage(bean);
			return "更新成功";
		} catch (Exception e) {
			String error = "刪除 error: " + e.getMessage();
			return error;
		}
	}
	
	public String deleteMessage(Integer id) {
		try {
			ForumMessageBean result = dao.findById(id);
			dao.deleteMessage(result);
			return "刪除成功";
		} catch (Exception e) {
			String error = "刪除留言 error: " + e.getMessage();
			return error;
		}
	}
}
