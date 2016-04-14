package com.cci.core.expection.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * Created by fcj on 2015/7/4.
 * 2015/7/4 11:27
 */
@JsonSerialize(include= JsonSerialize.Inclusion.NON_NULL)
public class ResponseEnvelope<T> {

    private T data;
    private RestApiError error;

    public ResponseEnvelope(T data){
        this.data=data;
    }

    public ResponseEnvelope(RestApiError error){
        this.error=error;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public void setError(RestApiError error) {
        this.error = error;
    }

    public RestApiError getError() {
        return error;
    }
}

