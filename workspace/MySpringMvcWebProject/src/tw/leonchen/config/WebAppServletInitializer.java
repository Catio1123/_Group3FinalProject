package tw.leonchen.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//web.xml
public class WebAppServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override  //beans.config.xml
	protected Class<?>[] getRootConfigClasses() {
		return null;
		//return new Class[] {RootAppConfig.class};
	}

	@Override  //mvc-servlet.xml
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
