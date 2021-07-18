package org.iii.group3.controller.rest.ad;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.iii.group3.persistent.dao.ad.AdDto;
import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.RecordService;
import org.iii.group3.service.member.MemberService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.GenericResponseBuilder;
import org.iii.group3.transferdata.dto.ad.PodcasterAdDto;
import org.iii.group3.transferdata.dto.podcaster.ChannelCardDto;
import org.iii.group3.utils.podcaster.MapUtil;
import org.iii.group3.utils.podcaster.PageableUtil;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;


@RestController
@SessionAttributes("Member")
public class AdRestController {

	@Autowired
	private AdService adService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private ModelMapper modelMapper;
	

	@Autowired
	private MemberService memberSrevice;
	
	@GetMapping(path = "/logged/podcaster/ad")
	public GenericResponse getAdList(@SessionAttribute(name = "Member", required = false)Member logger,
									 @RequestParam(name = "page", defaultValue = "1")Integer pageNum,
									 @RequestParam(name = "Size" , defaultValue = "6")Integer pageSize) {
		
		if(logger ==null) {
			logger = memberSrevice.findByAcct("user02");
		}
		
		List<Ad> adAll = adService.selectAll();

		List<Record> records = recordService.listRecord(logger.getAcctno());
		List<PodcasterAdDto> adDtos = new ArrayList<>();
		
		
		for (Ad ad : adAll) {
			PodcasterAdDto dto = modelMapper.map(ad, PodcasterAdDto.class);
			
			List<Integer> recordAdIdList = records.stream()
					.map(r -> r.getAdId()).collect(Collectors.toList());
			
			if(recordAdIdList.contains(ad.getId())) {
				dto.setEnable(false);
			}
			
			
			adDtos.add(dto);
		}
		
		
		Pageable pageable = PageableUtil.getPageable(pageNum, pageSize, null);
		
		Map data = MapUtil.toPageMap(adDtos, pageable);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, data);
	}
	
	
	
	

}
