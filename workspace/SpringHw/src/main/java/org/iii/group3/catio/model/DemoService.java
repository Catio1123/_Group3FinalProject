package org.iii.group3.catio.model;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Service
@SuppressWarnings("rawtypes")
public class DemoService {

	@Autowired
	private DemoDao demoDao;

	public int insert(Demo insertBean) {
		return demoDao.insert(insertBean);
	}

	public Demo select(Integer id) {
		return demoDao.select(id);
	}

	public List<Demo> selectAll() {
		return demoDao.selectAll();
	}

	public Demo update(Demo updateBean) {
		return demoDao.update(updateBean);
	}

	public boolean delete(Integer id) {
		return demoDao.delete(id);
	}


	public List queryByHql(String hql, List params) {
		return demoDao.queryByHql(hql, params);
	}

	public boolean updateExitTarget(Demo updateBean, Integer id) {
		 Demo target = demoDao.select(id);
		  if(target != null) {
			  updateBean.setId(id);
			  demoDao.update(updateBean);
			  return true;
		  }
		  
		 return false;
	}
	public boolean checkIfExist(Map<String, String> jsonMap) throws JsonMappingException, JsonProcessingException {
		
		String hql = "from Demo where "+ jsonMap.get("colName") + " = ?0";
		List result = queryByHql(hql, Arrays.asList(jsonMap.get("field")));
		
		if(result.size() == 0) {
			return true;
		}
		return false;
	}
	
}
