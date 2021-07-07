package org.iii.group3.persistent.dao.podcaster;

import org.iii.group3.persistent.model.podcaster.UserFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFileDao extends JpaRepository<UserFile, Long>{

	public UserFile findByFilenameAndPurpose(String filename, String purpose);
	
	public UserFile findByFilename(String filename);
	
	public UserFile findByUrl(String url);
}
