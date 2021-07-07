package org.iii.group3.service.pocaster;

import java.sql.Timestamp;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import org.iii.group3.exception.AccountAlreadyUsedException;
import org.iii.group3.exception.EmailAlreadyUsedException;
import org.iii.group3.persistent.dao.podcaster.UserDao;
import org.iii.group3.persistent.model.podcaster.User;
import org.iii.group3.transferdata.dto.UserRegisgterDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserDao userDao;
	
	
	@Autowired
	private ModelMapper modelMapper;
	
	public User registerNewUser(UserRegisgterDto userDto) throws AccountAlreadyUsedException, EmailAlreadyUsedException{
		
		
		User registerUser = userRegisterDto2User(userDto);
		return userDao.save(registerUser);
	}
	
	

	public Optional<User> findUser(Long id) {
		return userDao.findById(id);
	}
	
	public List<User> findAllUser() {
		return userDao.findAll();
	}
	
	public Optional<User> finaById(Long id) {
		return userDao.findById(id);
	}
	
	private User userRegisterDto2User(UserRegisgterDto userDto) {
		
		User registerUser = modelMapper.map(userDto, User.class);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		registerUser.setRegistdate(ts);
		
		return registerUser;
	}
	
	public boolean accountExist(String account) {
		return userDao.findByAccount(account) != null;
	}
	
	
	public boolean emailExist(String email) {
		return userDao.findByEmail(email) != null;
	}

}
