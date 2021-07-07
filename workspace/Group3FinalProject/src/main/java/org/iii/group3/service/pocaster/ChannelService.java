package org.iii.group3.service.pocaster;


import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.iii.group3.persistent.dao.podcaster.ChannelCategoryDao;
import org.iii.group3.persistent.dao.podcaster.ChannelDao;
import org.iii.group3.persistent.dao.podcaster.UserDao;
import org.iii.group3.persistent.model.podcaster.Channel;
import org.iii.group3.persistent.model.podcaster.ChannelCategory;
import org.iii.group3.persistent.model.podcaster.User;
import org.iii.group3.transferdata.dto.ChannelCardDto;
import org.iii.group3.transferdata.dto.ChannelInfoDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

@Service
@Transactional
public class ChannelService {

	private final ChannelDao channelDao;
	
	private final ModelMapper modelMapper;
	
	private final MessageSource messageSource;
	
	private final ChannelCategoryDao categoryDao;
	
	
	@Autowired
	private UserDao userDao; //之後要改成UserSecurityContext
	
	@Autowired
	public ChannelService(ChannelDao channelDao, 
			              ModelMapper modelMapper,
			              MessageSource messageSource,
			              ChannelCategoryDao channelCategoryDao) {
		this.channelDao = channelDao;
		this.modelMapper = modelMapper;
		this.messageSource = messageSource;
		this.categoryDao = channelCategoryDao;
	}
	
	public Channel addNewChannel(ChannelInfoDto channelDto) {
		Channel channel = channelInfoDtoToEntity(channelDto);
		return channelDao.save(channel);
	}
	
	public Page<ChannelCardDto> getPodcasterCardPage(Long uid, Pageable pageable){
		
		Page<Channel> chanPage = channelDao.findByUserId(uid, pageable);
		List<ChannelCardDto> elements = chanPage.getContent().stream()
				 .map(channel -> modelMapper.map(channel, ChannelCardDto.class))
				 .collect(Collectors.toList());
		Page<ChannelCardDto> dtoPage = new PageImpl<>(elements, 
												pageable, 
												chanPage.getTotalElements());
		return dtoPage;
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
		
		return channelDao.save(channel);
		
	}
	
	public void deleteChannel(Long cid) {
		channelDao.deleteById(cid);
	}
	
	
	private ChannelInfoDto entityToChannelInfoDto(Channel channel) {
		ChannelCategory category = channel.getCategory();
		String enName = category.getEnName();
		
		ChannelInfoDto channelDto = modelMapper.map(channel, ChannelInfoDto.class);
		channelDto.setCategory(enName);
		
		return channelDto;
	}
	
	private Channel channelInfoDtoToEntity(ChannelInfoDto channelDto) {
		Channel channel = modelMapper.map(channelDto, Channel.class);
		ChannelCategory category = categoryDao.findByEnName(channelDto.getCategory());
		channel.setCategory(category);
		//之後要改
		User owner = userDao.findById(1L).get();
		channel.setOwner(owner);
		channel.setPubdate(new Timestamp(System.currentTimeMillis()));
		return channel;
		
	}
	
}
