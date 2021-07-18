package org.iii.group3.persistent.dao.podcaster;

import org.iii.group3.persistent.model.podcaster.PodcasterFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFileDao extends JpaRepository<PodcasterFile, Long>{

	public PodcasterFile findByFilenameAndPurpose(String filename, String purpose);
	
	public PodcasterFile findByFilename(String filename);
	
	public PodcasterFile findByUrl(String url);
}
