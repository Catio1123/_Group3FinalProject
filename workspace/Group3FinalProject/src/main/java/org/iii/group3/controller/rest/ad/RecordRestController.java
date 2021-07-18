package org.iii.group3.controller.rest.ad;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.RecordService;
import org.iii.group3.service.member.MemberService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.dto.ad.ChannelRecordDto;
import org.iii.group3.utils.podcaster.MapUtil;
import org.iii.group3.utils.podcaster.PageableUtil;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;




@RestController
public class RecordRestController {

	@Autowired
	private RecordService recordService;

	@Autowired
	private AdService adService;

	@Autowired
	private ClickTimeService clickTimeService;
	
	@Autowired
	private ModelMapper modelMapper;

	
	@PostMapping(path = "/logged/podcaster/record")
	public GenericResponse addRecord(@RequestParam(name = "aid") Integer aid,
									 @SessionAttribute(name = "Member")Member logger) {
		
		Ad ad = adService.select(aid);
		if(recordService.findByUserIdAndAdId(logger.getAcctno(), aid) == null) {
			recordService.addOne(ad, logger);
			return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, "加入成功");
		};
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.BAD_REQUEST, "廣告已加入過");
	}
	
	
	
	@GetMapping(path = "/logged/podcaster/channel/{cid}/record")
	public GenericResponse getPodcasterRecord(@PathVariable(name = "cid")Long cid,
											  @SessionAttribute(name = "Member")Member logger,
											  @RequestParam(name = "page", defaultValue = "1")Integer pageNum,
											  @RequestParam(name = "Size" , defaultValue = "6")Integer pageSize) {
		
		List<Record> records = recordService.listRecord(logger.getAcctno());
		
		List<ClickTime> clickTime = clickTimeService.findByChannelId(cid);
		
		List<ChannelRecordDto> result = new ArrayList<>();
		
		for(Record r :records) {
			ChannelRecordDto dto = modelMapper.map(r.getAd(), ChannelRecordDto.class);
			
			dto.setAdClick(r.getAdClick());
			dto.setBonus(r.getBonus());
			
			StringBuffer sb = new StringBuffer();
			
			dto.setAddAdToChannelUrl(sb.append("/ipodcast/logged/podcaster/channel/").append(cid)
					.append("/ad").toString());
			dto.setPictureString(r.getAd().getPictureString());
			if(r.getClickTime() != null) {
				
				dto.setEnable(false);
			}
			
			result.add(dto);
		}
		
		Pageable pageable = PageableUtil.getPageable(pageNum, pageSize, null);
		Map data = MapUtil.toPageMap(result, pageable);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, data);
	}

	@DeleteMapping(path = "/logged/podcaster/record/{aid}")
	public GenericResponse delete(@PathVariable(name = "aid")Integer aid,
							      @SessionAttribute(name = "Member")Member logger) {

		recordService.deleteByActAndAdId(logger.getAcctno(), aid);

		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, "刪除成功");
	}

}
