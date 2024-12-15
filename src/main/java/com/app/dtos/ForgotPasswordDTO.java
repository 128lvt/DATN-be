package com.project.shopapp.dto;

import lombok.Data;

@Data
public class ForgotPasswordDTO {
    private String email;
    private String token;
    private String password;
    private String retypePassword;
}
