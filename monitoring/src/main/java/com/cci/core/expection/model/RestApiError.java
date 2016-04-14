package com.cci.core.expection.model;

/**
 * Created by fcj on 2015/7/4.
 * 2015/7/4 11:27
 */
public class RestApiError {

    private Integer statusCode;
    private String message;

    public Integer getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
