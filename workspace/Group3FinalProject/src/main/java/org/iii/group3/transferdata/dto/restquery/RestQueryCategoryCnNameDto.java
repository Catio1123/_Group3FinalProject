package org.iii.group3.transferdata.dto.restquery;

import org.iii.group3.persistent.model.podcaster.ChannelCategory;

public class RestQueryCategoryCnNameDto implements RestQueryDto<ChannelCategory>{

	private String category_cnName;
	
	private String or_category_CnName;

	

	public String getCategory_cnName() {
		return category_cnName;
	}



	public String getOr_category_CnName() {
		return or_category_CnName;
	}



	public void setCategory_cnName(String category_cnName) {
		this.category_cnName = category_cnName;
	}



	public void setOr_category_CnName(String or_category_CnName) {
		this.or_category_CnName = or_category_CnName;
	}



	@Override
	public Class<ChannelCategory> type() {
		return ChannelCategory.class;
	}

	
	
}
