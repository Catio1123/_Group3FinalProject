package org.iii.group3.persistent.dao.podcaster;

import java.util.Optional;

import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChannelCategoryDao extends JpaRepository<ChannelCategory, Integer>{

	public ChannelCategory findByEnName(String enName);
}
