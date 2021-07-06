package org.iii.group3.persistence.dao;


import org.iii.group3.persistence.model.podcaster.Episode;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EpisodeDao extends JpaRepository<Episode, Long>{

	public Page<Episode> findByChannelIdOrderByPubdateDesc(Long cid, Pageable pageable);
}
