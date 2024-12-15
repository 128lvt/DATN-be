package com.app.momo.models;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HttpRequest {
    private String method;
    private String endpoint;
    private String payload;
    private String contentType;

    public HttpRequest(String method, String endpoint, String payload, String contentType) {
        this.method = method;
        this.endpoint = endpoint;
        this.payload = payload;
        this.contentType = contentType;
    }

}
