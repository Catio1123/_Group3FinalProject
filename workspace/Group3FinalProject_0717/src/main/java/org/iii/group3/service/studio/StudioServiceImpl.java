package org.iii.group3.service.studio;



import java.util.List;

import org.iii.group3.persistent.dao.studio.StudioDaoImpl;
import org.iii.group3.persistent.model.studio.Studio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


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
