package org.iii.group3.controller.rest.podcaster;


import java.util.Map;
import java.util.Set;

import org.iii.group3.restquery.SpecSearchCriteria;
import org.iii.group3.service.podcaster.ChannelService;
import org.iii.group3.restquery.PodcastSpecification;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.dto.podcaster.ChannelCardDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryCategoryCnNameDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryChannelDto;
import org.iii.group3.transferdata.dto.restquery.RestQueryPodcastererNameDto;
import org.iii.group3.utils.podcaster.MapUtil;
import org.iii.group3.utils.podcaster.PageableUtil;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class PodcastRestController {

	
	@Autowired
	private ChannelService channelService;
	
	
	@GetMapping("/podcast")
	public GenericResponse getPodcastPage(
			@RequestParam(name = "page", defaultValue = "1")Integer pageNum,
			@RequestParam(name = "Size" , defaultValue = "9")Integer pageSize,
			@RequestParam(name = "order", required = false)String order,
			RestQueryChannelDto chanRestQueryDto,
			RestQueryCategoryCnNameDto categoryDto,
			RestQueryPodcastererNameDto podcasterDto) {
		
		Pageable pageable = PageableUtil.getPageable(pageNum, pageSize, order);
		
		Page<ChannelCardDto> audienceCardPage = channelService.getAudienceCardPage(pageable, chanRestQueryDto, categoryDto, podcasterDto);
		
		Map pageMap = MapUtil.toPageMap(audienceCardPage);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, pageMap);
	}
	
	@GetMapping(path = "/podcast/{cid}")
	public GenericResponse getPodcastInfo(@PathVariable(name = "cid")Long cid) {
		
		ChannelCardDto dto = channelService.getChannelCardDto(cid);
		
		Map<String, String> dtoMap = MapUtil.objectToMap(dto);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, dtoMap);
	}
	
	
	
	
}
