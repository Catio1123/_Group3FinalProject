package org.iii.group3.transferdata.dto.restquery;

import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;

public class RestQueryChannelDto implements RestQueryDto<Channel>{

	private String channel_title;
	
	private String or_channel_title;
	
	private String channel_description;
	
	private String or_channel_Description;
	







	public String getChannel_title() {
		return channel_title;
	}








	public String getOr_channel_title() {
		return or_channel_title;
	}








	public String getChannel_description() {
		return channel_description;
	}








	public String getOr_channel_Description() {
		return or_channel_Description;
	}








	public void setChannel_title(String channel_title) {
		this.channel_title = channel_title;
	}








	public void setOr_channel_title(String or_channel_title) {
		this.or_channel_title = or_channel_title;
	}








	public void setChannel_description(String channel_description) {
		this.channel_description = channel_description;
	}








	public void setOr_channel_Description(String or_channel_Description) {
		this.or_channel_Description = or_channel_Description;
	}








	@Override
	public Class<Channel> type() {
		return Channel.class;
	}



	
}
