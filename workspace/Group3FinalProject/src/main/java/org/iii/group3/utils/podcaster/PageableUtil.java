package org.iii.group3.utils.podcaster;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class PageableUtil {

	public static Pageable getPageable(Integer pageNum, Integer pageSize, String order) {
		
		Integer pageNumBase0 = pageNum - 1 < 0 ? 0:pageNum - 1;
		
		if(order == null) {
			return PageRequest.of(pageNumBase0, pageSize);
		}else {
			
			String[] orderBy = order.trim().split("_");
			if(orderBy.length != 2) {
				getPageable(pageNumBase0, pageSize, null);
			}else {
				String field = orderBy[0];
				
				if("desc".equalsIgnoreCase(orderBy[1])) {
					return PageRequest.of(pageNumBase0, pageSize, Sort.by(field).descending());
					
				}else if ("asc".equalsIgnoreCase(orderBy[1])) {
					return PageRequest.of(pageNumBase0, pageSize, Sort.by(field).ascending());
				}else {
					
					return getPageable(pageNumBase0, pageSize, null);
				}
			}
		}
		return null;
		
	}
	
}
