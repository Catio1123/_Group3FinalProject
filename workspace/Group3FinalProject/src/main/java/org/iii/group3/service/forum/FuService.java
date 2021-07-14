package org.iii.group3.service.forum;

import java.util.List;

import org.iii.group3.persistent.dao.forum.FuDao;
import org.iii.group3.persistent.model.forum.ForumUserBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FuService {
	
	@Autowired
	private FuDao fuDao;
	
	// 新增會員資料
	public boolean insertForumUser(ForumUserBean bean) {
		try {
			fuDao.insertForumUser(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	// 找單一會員
	public ForumUserBean findForumUserById(int id){
		try {
			return fuDao.findForumUserById(id);
		} catch (Exception e) {
			return null;
		}
	}
	
	// 找全部會員
	public List<ForumUserBean> findAll(){
		try {
			List<ForumUserBean> result = fuDao.findAll();
			return result;
		} catch (Exception e) {
			return null;
		}
	}
	
	// 更新會員
	public ForumUserBean updateForumUser(ForumUserBean bean) {
		try {			
			ForumUserBean result = fuDao.updateForumUser(bean);
			return result;
		} catch (Exception e) {
			return null;
		}
	}
	
	// 刪除會員
	public boolean deleteForumUser(int id) {
		try {
			ForumUserBean bean = fuDao.findForumUserById(id);
			fuDao.deleteForumUser(bean);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
