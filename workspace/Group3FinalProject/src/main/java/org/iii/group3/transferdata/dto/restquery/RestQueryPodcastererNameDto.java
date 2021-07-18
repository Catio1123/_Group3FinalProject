package org.iii.group3.transferdata.dto.restquery;

import org.iii.group3.persistent.model.member.Member;

public class RestQueryPodcastererNameDto implements RestQueryDto<Member>{

	private String podcaster_name;
	
	private String or_podcaster_name;


	public String getPodcaster_name() {
		return podcaster_name;
	}


	public String getOr_podcaster_name() {
		return or_podcaster_name;
	}


	public void setPodcaster_name(String podcaster_name) {
		this.podcaster_name = podcaster_name;
	}


	public void setOr_podcaster_name(String or_podcaster_name) {
		this.or_podcaster_name = or_podcaster_name;
	}


	@Override
	public Class<Member> type() {
		return Member.class;
	}
	
	
	
}
