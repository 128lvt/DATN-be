package com.app.momo.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import okhttp3.Headers;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HttpResponse {

    int status;
    String data;
    Headers headers;

    public String toString() {
        return "HttpStatusCode:: " + this.status + ", ResponseBody:: " + this.data;
    }

}
