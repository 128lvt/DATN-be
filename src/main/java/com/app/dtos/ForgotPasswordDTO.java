package com.app.dtos;

import lombok.Data;

@Data
public class ForgotPasswordDTO {
    private String email;
    private String token;
    private String password;
    private String retypePassword;
}
