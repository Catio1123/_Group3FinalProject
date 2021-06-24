package tw.secondgroup.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[]{RootAppConfig.class};
	}

	@Override 
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {SpringMVCJavaConfig.class};
	}

	@Override 
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter charEncodingFilter = new CharacterEncodingFilter();
		charEncodingFilter.setEncoding("UTF-8");
		charEncodingFilter.setForceEncoding(true);
		return new Filter[] {charEncodingFilter};
	}
	
	

}
