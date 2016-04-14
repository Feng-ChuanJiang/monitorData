package com.cci.core.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cci.core.expection.BusinessException;
import com.cci.core.expection.SystemException;
import com.cci.core.expection.model.ResponseEnvelope;
import com.cci.core.expection.model.RestApiError;

@ControllerAdvice(annotations = Controller.class)
public class FrameWorkExceptionHandler {

//
//    @ExceptionHandler
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//    public ModelAndView resolveException(Throwable e) {
//        Map<String, Throwable> map = new HashMap<String, Throwable>();
//        map.put("exception", e);
//        return new ModelAndView("default-error", map);
//    }

    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public ResponseEnvelope businessException(BusinessException e) {
        RestApiError restApiError = new RestApiError();
        restApiError.setStatusCode(e.getStatusCode());
        restApiError.setMessage(e.getMessage());
        ResponseEnvelope responseEnvelope = new ResponseEnvelope(restApiError);
        return responseEnvelope;
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView systemException(Exception e) {
        Map<String, Throwable> map = new HashMap<String, Throwable>();
        map.put("exception", e);
        return new ModelAndView("error_500", map);
    }

}