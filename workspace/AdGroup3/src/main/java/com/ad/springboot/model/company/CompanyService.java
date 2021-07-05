package com.ad.springboot.model.company;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

	@Autowired
	CompanyRepo companyRepo;
	
	
	public Company select(Integer id) {
		Optional<Company> company = companyRepo.findById(id);
		Company selectComapny = new Company();

		if (company.isPresent()) {
			selectComapny = company.get();
		}
		return selectComapny;
	}
	
}
