package org.iii.group3.persistence.dao;

import org.iii.group3.persistence.model.UserFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFileDao extends JpaRepository<UserFile, Long>{

	public UserFile findByFilenameAndPurpose(String filename, String purpose);
	
	public UserFile findByFilename(String filename);
	
	public UserFile findByUrl(String url);
}
