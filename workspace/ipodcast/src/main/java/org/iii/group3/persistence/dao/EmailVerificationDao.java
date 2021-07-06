package org.iii.group3.persistence.dao;

import java.util.Optional;

import org.iii.group3.persistence.model.EmailVerification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmailVerificationDao extends JpaRepository<EmailVerification, Long>{

	public EmailVerification findByEmail(String email);
}
