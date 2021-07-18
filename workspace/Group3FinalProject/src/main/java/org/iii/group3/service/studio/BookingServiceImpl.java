package org.iii.group3.service.studio;



import java.util.List;

import org.iii.group3.persistent.dao.studio.BookingDaoImpl;
import org.iii.group3.persistent.model.studio.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




@Service
@Transactional
public class BookingServiceImpl {

	@Autowired
	BookingDaoImpl bookingDao;

	public void save(Booking booking) {
		bookingDao.save(booking);
	}
	
	public List<Booking> findAll(){
		return bookingDao.findAll();
	}
	
	public Booking findById(Integer id){
		return bookingDao.findById(id);
	}
	public void update(Booking booking) {
		bookingDao.update(booking);
	}
	public void delete(Integer id) {
		bookingDao.delete(id);
	}
	
	
	public boolean updateExitTarget(Booking updateBean, Integer id) {
		Booking target = bookingDao.findById(id);
		if (target != null) {
			updateBean.setId(id);
			bookingDao.update(updateBean);
			return true;
		}

		return false;
	}

}
