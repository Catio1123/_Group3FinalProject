package com.infotran.springboot.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.StudioDaoImpl;
import com.infotran.springboot.model.Studio;

@Service
@Transactional
public class StudioServiceImpl {

	@Autowired
	StudioDaoImpl studioDao;

	public void save(Studio studio) {
		studioDao.save(studio);
	}
	
	public List<Studio> findAll(){
		return studioDao.findAll();
	}
	
	public Studio findById(Integer id){
		return studioDao.findById(id);
	}
	public void update(Studio studio) {
		studioDao.update(studio);
	}
	public void delete(Integer id) {
		studioDao.delete(id);
	}
	
	
	public boolean updateExitTarget(Studio updateBean, Integer id) {
		Studio target = studioDao.findById(id);
		if (target != null) {
			updateBean.setId(id);
			studioDao.update(updateBean);
			return true;
		}

		return false;
	}

}
