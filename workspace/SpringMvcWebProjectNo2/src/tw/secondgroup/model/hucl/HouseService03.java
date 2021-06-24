package tw.secondgroup.model.hucl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("houseService03")
@Transactional
public class HouseService03 {
	@Autowired
	private HouseDao03 houseDao;
	
	public House03 select(int houseid) throws SQLException {
		return houseDao.select(houseid);		
	}
	
	public List<House03> selectAll() {
		return houseDao.selectAll();
	}

	public House03 update(int houseid, String houseName) {
		return houseDao.update(houseid, houseName);
	}
	
	public House03 insert(int houseid, String houseName) {
		return houseDao.insert(houseid, houseName);
	}

	public boolean delete(int houseid) {
		return houseDao.delete(houseid);
	}
	
}
