package com.app.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class UserLoginDTO {
    @NotBlank(message = "Phone number is required")
    @JsonProperty("email")
    private String email;

    @NotBlank(message = "Password cannot be blank")
    private String password;
}