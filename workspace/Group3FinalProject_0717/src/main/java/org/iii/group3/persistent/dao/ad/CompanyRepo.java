package org.iii.group3.persistent.dao.ad;

import org.iii.group3.persistent.model.ad.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepo extends JpaRepository<Company, Integer> {

}
