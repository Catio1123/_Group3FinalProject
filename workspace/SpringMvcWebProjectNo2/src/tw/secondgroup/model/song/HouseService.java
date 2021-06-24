package tw.secondgroup.model.song;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("houseService")
@Transactional
public class HouseService {
	@Autowired
	private HouseDao houseDao;
	
	public House select(int houseid) throws SQLException {
		return houseDao.select(houseid);		
	}
	
	public List<House> selectAll() {
		return houseDao.selectAll();
	}

	public House update(int houseid, String houseName) {
		return houseDao.update(houseid, houseName);
	}

}
