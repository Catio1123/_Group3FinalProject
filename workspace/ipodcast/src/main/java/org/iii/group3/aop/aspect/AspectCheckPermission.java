package org.iii.group3.aop.aspect;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.iii.group3.security.PermissionCheckService;
import org.iii.group3.security.UserSecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AspectCheckPermission {

	private static final String POINTCUT = "org.iii.group3.aop.PointCuts.checkPermission()";
	
	@Autowired
	private PermissionCheckService permissionService;
	
	@Autowired
	private UserSecurityContext userContext;

	@Before(POINTCUT)
	public void before(JoinPoint joinPoint) {
		
		Object[] args = joinPoint.getArgs();
		HttpServletRequest request = (HttpServletRequest)Arrays.stream(args)
				.filter(a -> a instanceof HttpServletRequest).findFirst().get();
		
		boolean hasPermission = permissionService.hasPermission(request, userContext.getAuthentication());
		if(!hasPermission) {
			throw new AccessDeniedException("");
		}
		
	}
}
