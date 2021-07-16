package org.iii.group3.persistent.dao.podcaster;

import org.iii.group3.persistent.model.podcaster.Channel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ChannelDao extends JpaRepository<Channel, Long>, JpaSpecificationExecutor<Channel>{

	public Page<Channel> findByMemeberAct(String act, Pageable pageable);
	
}
