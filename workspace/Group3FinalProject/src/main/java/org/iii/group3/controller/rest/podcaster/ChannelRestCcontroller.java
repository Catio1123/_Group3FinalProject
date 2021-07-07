package org.iii.group3.controller.rest.podcaster;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.iii.group3.service.pocaster.ChannelService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.transferdata.dto.ChannelCardDto;
import org.iii.group3.transferdata.dto.ChannelInfoDto;
import org.iii.group3.utils.MapUtil;
import org.iii.group3.utils.ResponseEntityWrapper;
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

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class ChannelRestCcontroller {

	private final ChannelService channelService;
	
	private final MessageSource messageSource;
	
	
	private final ModelMapper modelMapper;
	
	private final ObjectMapper objectMapper;
	

	@Autowired
	public ChannelRestCcontroller(ChannelService channelService, 
							      MessageSource messageSource,
							      ObjectMapper objectMapper,
							      ModelMapper modelMapper) {
		this.channelService = channelService;
		this.messageSource = messageSource;
		this.modelMapper = modelMapper;
		this.objectMapper = objectMapper;
	}
	
	@PostMapping(path = "/logged/podcaster/{uid}/channel")
	public GenericResponse createChannel(@Valid ChannelInfoDto channelDto, Locale locale) {
		
		channelService.addNewChannel(channelDto);
		
		String successMsg = messageSource.getMessage("channel.create.success", null, locale);
		
		Map data = MapUtil.toSingleEntryMap("channel", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,data);
	}
	
	@GetMapping(path = "/logged/podcaster/{uid}/channel")
	public GenericResponse getAllChannel(
			@PathVariable(name = "uid")Long uid,
			@RequestParam(name = "page", defaultValue = "1")Integer pageNum,
			@RequestParam(name = "Size" , defaultValue = "6")Integer pageSize) {
		
		Map pageData = getPageData(uid, pageNum, pageSize);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,pageData);
		
	}
	
	@GetMapping(path = "/logged/podcaster/{uid}/channel/{cid}")
	public GenericResponse getChannelInfo(@PathVariable("cid") Long cid) {
		
		ChannelInfoDto channelDto = channelService.getChannelInfo(cid);
		
		Map data = objectMapper.convertValue(channelDto, new TypeReference<Map>() {});
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, data);
	}
		
	@PutMapping(path = "/logged/podcaster/{uid}/channel/{cid}")
	public GenericResponse updataChannel(@PathVariable("cid")Long cid,
										 @Valid ChannelInfoDto channelDto,
										 Locale locale) {
		channelService.updateChannel(channelDto, cid);
		
		String successMsg = messageSource.getMessage("channel.update.success", null, locale);
		Map<String, String> data = new HashMap<String, String>();
		data.put("channel", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,data);
		
	}
	
	@DeleteMapping(path = "/logged/podcaster/{uid}/channel/{cid}")
	public GenericResponse deleteChannel(@PathVariable("cid") Long cid, Locale locale) {
		
		channelService.deleteChannel(cid);
		
		String successMsg = messageSource.getMessage("channel.delete.success", null, locale);
		
		Map data = MapUtil.toSingleEntryMap("channel", successMsg);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK,data);
		
	}
	
	private Map getPageData(Long uid, Integer current, Integer pageSize) {
		
		Integer pageNumBase0 = current - 1 < 0 ? 0:current - 1;
		
		Pageable pageable = PageRequest.of(pageNumBase0, pageSize);
		
		
		Page<ChannelCardDto> page = channelService.getPodcasterCardPage(uid , pageable);
	
		
		Long total = page.getTotalElements();
		
		
		Map data = new HashMap();
		data.put("total", total);
		data.put("page", current);
		data.put("size", pageSize);
		data.put("elements", page.getContent());
		return data;
		
	}
	
}
