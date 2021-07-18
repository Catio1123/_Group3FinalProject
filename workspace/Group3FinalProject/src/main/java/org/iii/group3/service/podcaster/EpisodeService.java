package org.iii.group3.service.podcaster;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.iii.group3.persistent.dao.podcaster.ChannelDao;
import org.iii.group3.persistent.dao.podcaster.EpisodeDao;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;
import org.iii.group3.persistent.model.podcaster.Episode;
import org.iii.group3.restquery.PodcastCriteriaParser;
import org.iii.group3.restquery.PodcastSpecification;
import org.iii.group3.restquery.SpecSearchCriteria;
import org.iii.group3.transferdata.dto.podcaster.EpisodeInfoDto;
import org.iii.group3.transferdata.dto.podcaster.EpisodeTableDto;
import org.iii.group3.transferdata.dto.podcaster.PodcastEpDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryPodcastererNameDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
@Transactional
public class EpisodeService {
	
	private final EpisodeDao epDao;
	
	private final ModelMapper modelMapper;
	
	private final MessageSource messageSource;
	
	private final ChannelDao channelDao;
	


	@Autowired
	public EpisodeService(EpisodeDao epDao, ModelMapper modelMapper, MessageSource messageSource,
			ChannelDao channelDao) {
		this.epDao = epDao;
		this.modelMapper = modelMapper;
		this.messageSource = messageSource;
		this.channelDao = channelDao;
	}

	
	public List<PodcastEpDto> getPodcastEp(Long cid){
		List<Episode> eps = epDao.findByChannelId(cid);
		return eps.stream().map(ep -> modelMapper.map(ep, PodcastEpDto.class))
			.collect(Collectors.toList());
		
	}
	
	
	public Episode addNewEpisode(EpisodeInfoDto epDto, Long cid) {
		
		Episode ep = episodeInfoDtoToEntity(epDto, cid);
		
		return epDao.save(ep);
	}
	
	public Page<EpisodeTableDto> getEpPage(Long cid, Pageable pageable){
		
		Page<Episode> epPage = epDao.findByChannelIdOrderByPubdateDesc(cid, pageable);
		
		List<EpisodeTableDto> elements = epPage.getContent().stream()
				.map(ep -> modelMapper.map(ep, EpisodeTableDto.class))
				.collect(Collectors.toList());
		Page<EpisodeTableDto> dtoPage = new PageImpl<EpisodeTableDto>(elements, 
																	pageable, 
																	epPage.getTotalElements());
		return dtoPage;
	}
	
	public EpisodeInfoDto getEpisodeInfo(Long eid) {
		
		Optional<Episode> optionalEp = epDao.findById(eid);
		
		if(optionalEp.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
		}
		
		Episode ep = optionalEp.get();
		
		return entityToEpisodeInfoDto(ep);
	}
	
	
	public Episode updatEpisode(EpisodeInfoDto epDto, Long eid) {
		
		Optional<Episode> optionalEpisode = epDao.findById(eid);
		if(optionalEpisode.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
		}
		
		Episode episode = optionalEpisode.get();
		
		modelMapper.map(epDto, episode);
		
		return epDao.save(episode);
	}
	
	public void deleteEpisode(Long eid) {
		epDao.deleteById(eid);
	}
	
	
	private EpisodeInfoDto entityToEpisodeInfoDto(Episode ep) {
		EpisodeInfoDto epInfoDto = modelMapper.map(ep, EpisodeInfoDto.class);
		
		return epInfoDto;
	}
	
	
	private Episode episodeInfoDtoToEntity(EpisodeInfoDto epDto, Long cid) {
		
		Optional<Channel> optionalChannel = channelDao.findById(cid);
		if(optionalChannel.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
		}
		
		Channel channel = optionalChannel.get();
		
		Episode ep = modelMapper.map(epDto, Episode.class);
		ep.setChannel(channel);
		ep.setPubdate(new Timestamp(System.currentTimeMillis()));
		
		return ep;
		
		
	}
	
}
