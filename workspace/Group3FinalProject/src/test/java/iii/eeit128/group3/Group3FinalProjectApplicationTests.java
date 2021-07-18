package iii.eeit128.group3;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.group3.utils.podcaster.MapUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Group3FinalProjectApplicationTests {

	@Test
	void contextLoads() {
		Map map = new HashMap();
		
		Map data = new HashMap();
		
		List ads = new ArrayList();
		
		data.put("ads", ads);
		
		map.put("data", data);
		
		
	}

}
