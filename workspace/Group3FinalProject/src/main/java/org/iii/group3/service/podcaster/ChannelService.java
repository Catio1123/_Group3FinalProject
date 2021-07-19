package org.iii.group3.service.podcaster;


import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.iii.group3.persistent.dao.podcaster.ChannelCategoryDao;
import org.iii.group3.persistent.dao.podcaster.ChannelDao;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;
import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.iii.group3.restquery.SpecSearchCriteria;
import org.iii.group3.restquery.PodcastCriteriaParser;
import org.iii.group3.restquery.PodcastSpecification;
import org.iii.group3.restquery.PodcastSpecification.Builder;
import org.iii.group3.transferdata.dto.podcaster.ChannelCardDto;
import org.iii.group3.transferdata.dto.podcaster.ChannelInfoDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryCategoryCnNameDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryChannelDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryPodcastererNameDto;
import org.iii.group3.utils.podcaster.MapUtil;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

@Service
@Transactional
public class ChannelService {

	@Autowired
	private ChannelDao channelDao;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private ChannelCategoryDao categoryDao;
	
	@Autowired
	private ChannelCategoryService categoryService;
	
	@Autowired
	private MemberJpaService memberJpaService;
	
	
	
	public ChannelCardDto getChannelCardDto(Long cid) {
		
		Channel channel = getChannel(cid);
		return entityToChannelCardDto(channel);
	}
	
	public Channel getChannel(Long cid) {
		
		Optional<Channel> channel = channelDao.findById(cid);
		if(channel.isPresent()) {
			return channel.get();
		}else {
			return null;
		}
	}
	
	public Channel addNewChannel(ChannelInfoDto channelDto, String act) {
		Channel channel = channelInfoDtoToEntity(channelDto, act);
		return channelDao.save(channel);
	}
	
	public Page<ChannelCardDto> getPodcasterCardPage(String act, Pageable pageable){
		
		Page<Channel> chanPage = channelDao.findByMemberAct(act, pageable);
		return  toChannelCardDtoPage(chanPage, pageable);
	}
	
	public Page<ChannelCardDto> getAudienceCardPage(Pageable pageable, RestQueryDto... queryDtos ){
		
		Builder<Channel> builder = PodcastSpecification.from(Channel.class);
		
		
		for(RestQueryDto queryDto : queryDtos) {
			
			
			if(queryDto instanceof RestQueryCategoryCnNameDto) {
				
				List<SpecSearchCriteria> categoryCriterias = categoryService.getCategoryIdCriterias("categoryid", (RestQueryCategoryCnNameDto)queryDto);
				builder = builder.with(categoryCriterias);
				
			}else if(queryDto instanceof RestQueryPodcastererNameDto) {
				List<SpecSearchCriteria> memberCrierias = memberJpaService.getMemberActCriterias("memberAct", (RestQueryPodcastererNameDto)queryDto);
				builder = builder.with(memberCrierias);
				
			}else if(queryDto instanceof RestQueryChannelDto) {
				
				List<SpecSearchCriteria> channelCaterias = PodcastCriteriaParser.parse(queryDto);
				builder = builder.with(channelCaterias);
			}
		}
		
		Specification<Channel> spec = builder.build();
		
		Page<Channel> result = null;
		
		if(spec == null) {
			result = channelDao.findAll(pageable);
		}else {
			
			result = channelDao.findAll(spec, pageable);
		}
		
		
		return toChannelCardDtoPage(result, pageable);
	}
	
	public ChannelInfoDto getChannelInfo(Long cid) {
		
		Optional<Channel> optionalCchannel = channelDao.findById(cid);
		
		
		if(optionalCchannel.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
		}
		
		Channel channel = optionalCchannel.get();
		
		ChannelInfoDto channelDto = entityToChannelInfoDto(channel);
		
		return channelDto;
	}
	
	public Channel updateChannel(ChannelInfoDto channelDto, Long cid) {
		
		Optional<Channel> optionalChannel = channelDao.findById(cid);
		if(optionalChannel.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
		}
		
		Channel channel = optionalChannel.get();
		
		modelMapper.map(channelDto, channel);

		ChannelCategory updateCategory = categoryDao.findByEnName(channelDto.getCategory());
		
		channel.setCategory(updateCategory);
		
		return channelDao.save(channel);
		
	}
	
	public void deleteChannel(Long cid) {
		channelDao.deleteById(cid);
	}
	
	
	private ChannelInfoDto entityToChannelInfoDto(Channel channel) {
		
		String enName = channel.getCategory().getEnName();
		
		ChannelInfoDto channelDto = modelMapper.map(channel, ChannelInfoDto.class);
		channelDto.setCategory(enName);
		
		return channelDto;
	}
	
	
	private ChannelCardDto entityToChannelCardDto(Channel channel) {
		
		String categoryCnName = channel.getCategory().getCnName();
		
		String podcasterName = channel.getMember().getName();
		
		ChannelCardDto dto = modelMapper.map(channel, ChannelCardDto.class);
		
		dto.setCategory(categoryCnName);
		dto.setPodcaster(podcasterName);

		return dto;
		
	}
	private Page<ChannelCardDto> toChannelCardDtoPage(Page<Channel> channelPage, Pageable pageable) {
		
		List<ChannelCardDto> elements = channelPage.getContent().stream()
				 .map(channel -> entityToChannelCardDto(channel))
				 .collect(Collectors.toList());
		Page<ChannelCardDto> dtoPage = new PageImpl<>(elements, 
												pageable, 
												channelPage.getTotalElements());
		return dtoPage;
		
	}
	
	private Channel channelInfoDtoToEntity(ChannelInfoDto channelDto, String act) {
		Channel channel = modelMapper.map(channelDto, Channel.class);
		ChannelCategory category = categoryDao.findByEnName(channelDto.getCategory());
		channel.setCategory(category);

		Member member = memberJpaService.findByAcctno(act);
		channel.setMember(member);
		
		channel.setPubdate(new Timestamp(System.currentTimeMillis()));
		return channel;
		
	}
	
}
