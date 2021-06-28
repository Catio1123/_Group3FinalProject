package com.ad.springboot.model.ad;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdRepo extends JpaRepository<Ad, Integer>{
	
	public Ad findByCompany(String company);
	

}
