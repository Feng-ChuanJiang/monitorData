package com.cci.core.handler;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import com.cci.core.expection.BusinessException;
import com.cci.core.expection.SystemException;

/**
 * this handler is used to handle the log and exception for service layer.
 * @author fcj
 *
 */
@Component
@Aspect
public class ServiceLogicHandler {
	private final Logger logger = LoggerFactory.getLogger(ServiceLogicHandler.class);
	@Autowired
	private Environment env;
    /**
     * 拦截服务层所用方法
     * @param pjp
     * @return
     * @throws Throwable
     */
	@Around("execution(* com.cci.*.**.service..*(..))")
	public Object handle(ProceedingJoinPoint pjp) throws Throwable {
		Object retVal = null;
		String method = pjp.getSignature().toShortString();
		try {
			logger.debug(method + " : begin");
			retVal = pjp.proceed();
			logger.debug(method + " : end");
		} catch (Exception exception) {
			handleExceptionLog(pjp, exception);
			if(exception instanceof BusinessException){
				throw exception;
			}else {
				throw new SystemException(500, exception.getMessage());
			}
		}
		return retVal;
	}
    /**
     *把异常记录日志־
     * @param pjp
     * @param exception
     */
	private void handleExceptionLog(ProceedingJoinPoint pjp, Exception exception) {
		Object target = pjp.getTarget();
		String methodName = pjp.getSignature().getName();
		Object[] args = pjp.getArgs();
		logger.error("Error happened in class: " + target.getClass().getName());
		logger.error("Error happened in method: " + methodName);
		for (int i = 0; i < args.length; i++) {
			logger.error("arg[" + i + "]: " + args[i]);
		}
		logger.error("Exception class: " + exception.getClass().getName());
		logger.error("ex.getMessage():" + exception.getMessage());
	}
}
