package org.iii.group3.service.ad;

import java.util.Optional;

import org.iii.group3.persistent.dao.ad.CompanyRepo;
import org.iii.group3.persistent.model.ad.Company;
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
