package org.iii.group3.service.studio;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.iii.group3.persistent.dao.studio.StudioDao;
import org.iii.group3.persistent.model.studio.Studio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Service
@SuppressWarnings("rawtypes")
public class StudioService {

	@Autowired
	private StudioDao studioDao;	

	public int insert(Studio insertBean) {
		return studioDao.insert(insertBean);
	}

	public Studio select(Integer id) {
		return studioDao.select(id);
	}

	public List<Studio> selectAll() {
		return studioDao.selectAll();
	}

	public Studio update(Studio updateBean) {
		return studioDao.update(updateBean);
	}

	public boolean delete(Integer id) {
		return studioDao.delete(id);
	}

	public List queryByHql(String hql, List params) {
		return studioDao.queryByHql(hql, params);
	}

	public boolean updateExitTarget(Studio updateBean, Integer id) {
		Studio target = studioDao.select(id);
		if (target != null) {
			updateBean.setId(id);
			studioDao.update(updateBean);
			return true;
		}

		return false;
	}

	public boolean checkIfExist(Map<String, String> jsonMap) throws JsonMappingException, JsonProcessingException {

		String hql = "from Studio where " + jsonMap.get("colName") + " = ?0";
		List result = queryByHql(hql, Arrays.asList(jsonMap.get("field")));

		if (result.size() == 0) {
			return true;
		}
		return false;
	}

}
