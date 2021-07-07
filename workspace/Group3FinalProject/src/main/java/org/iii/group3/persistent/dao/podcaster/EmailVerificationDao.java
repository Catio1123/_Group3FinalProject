package org.iii.group3.persistent.dao.podcaster;

import java.util.Optional;

import org.iii.group3.persistent.model.podcaster.EmailVerification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmailVerificationDao extends JpaRepository<EmailVerification, Long>{

	public EmailVerification findByEmail(String email);
}
