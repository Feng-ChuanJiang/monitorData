package com.cci.core.expection;

/**
 * Created by chuanjiang.feng on 2015/7/4.
 * 2015/7/4 11:06
 * 自定义异常
 */
public class BusinessException extends RuntimeException {

    private Integer statusCode;
    private String message;

    public BusinessException(Integer statusCode,String message){
        super(message);
        this.statusCode=statusCode;
        this.message=message;
    }

    public Integer getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
