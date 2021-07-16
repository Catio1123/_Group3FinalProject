package org.iii.group3.transferdata.dto.restquery;

import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;

public class RestQueryChannelDto implements RestQueryDto<Channel>{

	private String channel_titile;
	
	private String or_channel_Titile;
	
	private String channel_description;
	
	private String or_channel_Description;
	



	public String getChannel_titile() {
		return channel_titile;
	}




	public String getOr_channel_Titile() {
		return or_channel_Titile;
	}




	public String getChannel_description() {
		return channel_description;
	}




	public String getOr_channel_Description() {
		return or_channel_Description;
	}




	public void setChannel_titile(String channel_titile) {
		this.channel_titile = channel_titile;
	}




	public void setOr_channel_Titile(String or_channel_Titile) {
		this.or_channel_Titile = or_channel_Titile;
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
