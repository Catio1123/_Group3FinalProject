package tw.secondgroup.model.johnny;

import java.sql.SQLException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("couponService")
public class CouponService {

	@Autowired
	private CouponDao couponDao;

	public Coupon select(int id) throws SQLException {
		return couponDao.select(id);
	}

	public List<Coupon> selectAll() {
		return couponDao.selectAll();
	}

	public Coupon update(int id, String name, String company,String description) {
		return couponDao.update(id, name, company, description);
	}

	public Coupon insert(int id, String name, String company,String description) {
		
	return	couponDao.insert(id, company, name, description);
		
	}

	public boolean delete(int id) {
		return couponDao.delete(id);
	}

}
