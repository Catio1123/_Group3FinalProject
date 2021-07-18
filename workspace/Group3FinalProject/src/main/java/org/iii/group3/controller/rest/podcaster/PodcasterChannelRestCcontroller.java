package org.iii.group3.controller.rest.podcaster;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.podcaster.ChannelService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.transferdata.dto.podcaster.ChannelCardDto;
import org.iii.group3.transferdata.dto.podcaster.ChannelInfoDto;
import org.iii.group3.utils.podcaster.MapUtil;
import org.iii.group3.utils.podcaster.PageableUtil;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class PodcasterChannelRestCcontroller {

	private final ChannelService channelService;
	
	private final MessageSource messageSource;
	
	
	private final ModelMapper modelMapper;
	
	private final ObjectMapper objectMapper;
	

	@Autowired
	public PodcasterChannelRestCcontroller(ChannelService channelService, 
							      MessageSource messageSource,
							      ObjectMapper objectMapper,
							      ModelMapper modelMapper) {
		this.channelService = channelService;
		this.messageSource = messageSource;
		this.modelMapper = modelMapper;
		this.objectMapper = objectMapper;
	}
	
	@PostMapping(path = "/logged/podcaster/channel")
	public GenericResponse createChannel(@Valid ChannelInfoDto channelDto, 
									     @SessionAttribute(name = "Member")Member logger, Locale locale) {
		
		channelService.addNewChannel(channelDto, logger.getAcctno());
		
		String successMsg = messageSource.getMessage("channel.create.success", null, locale);
		
		Map data = MapUtil.toSingleEntryMap("channel", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,data);
	}
	
	@GetMapping(path = "/logged/podcaster/channel")
	public GenericResponse getAllChannel(
			@SessionAttribute(name = "Member")Member logger,
			@RequestParam(name = "page", defaultValue = "1")Integer pageNum,
			@RequestParam(name = "Size" , defaultValue = "6")Integer pageSize) {
		

		Pageable pageable = PageableUtil.getPageable(pageNum, pageSize, null);
		
		Page<ChannelCardDto> cardPage = channelService.getPodcasterCardPage(logger.getAcctno(), pageable);
		
		Map pageData = MapUtil.toPageMap(cardPage);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,pageData);
		
	}
	
	@GetMapping(path = "/logged/podcaster/channel/{cid}")
	public GenericResponse getChannelInfo(@PathVariable("cid") Long cid) {
		
		ChannelInfoDto channelDto = channelService.getChannelInfo(cid);
		
		Map data = objectMapper.convertValue(channelDto, new TypeReference<Map>() {});
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, data);
	}
		
	@PutMapping(path = "/logged/podcaster/channel/{cid}")
	public GenericResponse updataChannel(@PathVariable("cid")Long cid,
										 @Valid ChannelInfoDto channelDto,
										 Locale locale) {
		channelService.updateChannel(channelDto, cid);
		
		String successMsg = messageSource.getMessage("channel.update.success", null, locale);
		Map<String, String> data = new HashMap<String, String>();
		data.put("channel", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,data);
		
	}
	
	@DeleteMapping(path = "/logged/podcaster/channel/{cid}")
	public GenericResponse deleteChannel(@PathVariable("cid") Long cid, Locale locale) {
		
		channelService.deleteChannel(cid);
		
		String successMsg = messageSource.getMessage("channel.delete.success", null, locale);
		
		Map data = MapUtil.toSingleEntryMap("channel", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,data);
		
	}

	
}
