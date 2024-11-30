package com.app.responses;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Response {
    private String message;
    private Object data;

    public static Response success(Object data) {
        return new Response("Success", data);
    }

    public static Response error(String message) {
        return new Response("Error", message);
    }
}
