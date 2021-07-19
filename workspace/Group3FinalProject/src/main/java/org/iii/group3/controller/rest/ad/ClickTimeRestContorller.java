package org.iii.group3.controller.rest.ad;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;
import org.iii.group3.service.ad.AdService;
import org.iii.group3.service.ad.ClickTimeService;
import org.iii.group3.service.ad.RecordService;
import org.iii.group3.service.member.MemberService;
import org.iii.group3.service.podcaster.ChannelService;
import org.iii.group3.transferdata.GenericResponse;
import org.iii.group3.transferdata.dto.ad.PodcastAdDto;
import org.iii.group3.utils.podcaster.MapUtil;
import org.iii.group3.utils.podcaster.ResponseEntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.sym.Name;

@RestController
public class ClickTimeRestContorller {

	@Autowired
	private RecordService recordService;

	@Autowired
	private AdService adService;
	

	@Autowired
	private ClickTimeService clickTimeService;
	
	@Autowired
	private ChannelService channelService;
	

	@PostMapping("/logged/podcaster/channel/{cid}/ad")
	public GenericResponse addAdToChannel(Model m, @RequestParam(name = "aid", required = true) Integer aid,
			@PathVariable(value = "cid", required = true) Long cid,
			@SessionAttribute(name = "Member")Member logger) {

		Ad ad = adService.select(aid);
		Channel channel = channelService.getChannel(cid);
		Record record = recordService.findByUserIdAndAdId(logger.getAcctno(), aid);
		
		Map data = null;
		HttpStatus status = null;
		
		if(clickTimeService.isExistById(cid, aid)) {
			data = MapUtil.toSingleEntryMap("msg", "添加失敗，此廣告已添加過");
			status = HttpStatus.BAD_REQUEST;
		}else {
			
			clickTimeService.addOne(ad, channel, record);
			data = MapUtil.toSingleEntryMap("msg", "添加成功");
			status = HttpStatus.OK;
		}
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(status, data);
	}

	@PostMapping("/podcast/{cid}/ad/{aid}")
	public GenericResponse increaseClickTimeCount(@PathVariable(name = "cid")Long cid,
							   @PathVariable(name = "aid")Integer aid) {

		clickTimeService.increaseClickTime(aid, cid, 1);
		recordService.increaseClicktime(aid, cid, 1);
		adService.updateClickTime(aid);
		
		recordService.updateBonus(aid);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, "已計算此點擊") ;
	}

	
	@DeleteMapping(path = "/logged/podcaster/channel/{cid}/ad/{aid}")
	public GenericResponse deleteFront(@PathVariable(value = "aid", required = true) Integer aid,
			@PathVariable(value = "cid", required = true) Long cid) {
		
		List<ClickTime> clickTimeList = clickTimeService.findByAdId(aid);
		if(clickTimeList.isEmpty()) {
			return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.BAD_REQUEST, "指定廣告不存在或已被移除");
		}
		clickTimeService.deleteById(aid, cid);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, "已成功移除");

	}
	
	@GetMapping("/podcast/{cid}/ad")
	public GenericResponse getPodcastAdList(@PathVariable(name = "cid")Long cid) {

		List<ClickTime> clickAll = clickTimeService.findByChannelId(cid);
		List<PodcastAdDto> clickDtos = new ArrayList();
		
		for (ClickTime c : clickAll) {
			PodcastAdDto dto = new PodcastAdDto();
			Ad ad = c.getAd();
			dto.setUrl(ad.getUrl());
			dto.setPictureString(ad.getPictureString());
			dto.setClickCountUrl("/ipodcast/podcast/"+cid +"/ad/" + ad.getId());
dto.setText(ad.getText());
			clickDtos.add(dto);
		}

		Map data = MapUtil.toSingleEntryMap("ads", clickDtos);
		
		return ResponseEntityWrapper.wrapDataToGenericResponse(HttpStatus.OK, data);
	}

}
