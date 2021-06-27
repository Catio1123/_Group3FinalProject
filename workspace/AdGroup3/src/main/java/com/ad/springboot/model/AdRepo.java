package com.ad.springboot.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AdRepo extends JpaRepository<Ad, Integer>{
	
	public Ad findByCompany(String company);
	

}
