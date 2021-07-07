package org.iii.group3.persistent.dao.podcaster;


import org.iii.group3.persistent.model.podcaster.Podcaster;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<Podcaster, Long>{

	public Podcaster findByAccount(String account);
	public Podcaster findByEmail(String email);
}
