package org.iii.group3.wayne.model;

import java.util.Arrays;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Service
@SuppressWarnings("rawtypes")
public class AdService {

	@Autowired
	private AdDao adDao;



	public Ad select(Integer number) {
		return adDao.select(number);
	}

	public List<Ad> selectAll() {
		return adDao.selectAll();
	}

	public void save(Ad adUpdate) {
		adDao.save(adUpdate);
	}

	public void delete(Integer number) {
		adDao.delete(number);
	}
}
