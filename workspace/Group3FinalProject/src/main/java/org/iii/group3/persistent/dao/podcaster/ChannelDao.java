package org.iii.group3.persistent.dao.podcaster;

import org.iii.group3.persistent.model.podcaster.Channel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChannelDao extends JpaRepository<Channel, Long>{

	public Page<Channel> findByUserId(Long uid, Pageable pageable);
}
