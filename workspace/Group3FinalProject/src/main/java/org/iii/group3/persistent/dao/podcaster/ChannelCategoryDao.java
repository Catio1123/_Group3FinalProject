package org.iii.group3.persistent.dao.podcaster;

import java.util.Optional;

import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ChannelCategoryDao extends JpaRepository<ChannelCategory, Integer>, JpaSpecificationExecutor<ChannelCategory>{

	public ChannelCategory findByEnName(String enName);
}
