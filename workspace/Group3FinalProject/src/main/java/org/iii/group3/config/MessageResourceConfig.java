package org.iii.group3.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

@Configuration
public class MessageResourceConfig{

	@Bean 
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource rrbs = new ReloadableResourceBundleMessageSource();
		rrbs.setBasename("classpath:messages");
		rrbs.setDefaultEncoding("UTF-8");
		return rrbs;
	}
	
	@Bean
	@Autowired
	public LocalValidatorFactoryBean validator(MessageSource messageSource) {
		LocalValidatorFactoryBean validatorFactory = new LocalValidatorFactoryBean();
		validatorFactory.setValidationMessageSource(messageSource);
		return validatorFactory;
	}
	
	
}
