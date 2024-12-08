package com.project.shopapp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class UserDTO {
    @JsonProperty("fullname")
    private String fullName;

    @NotBlank(message = "Email is required")
    @JsonProperty("email")
    private String email;

    private String address;

    @NotBlank(message = "Password cannot be blank")
    private String password;

    @JsonProperty("retype_password")
    private String retypePassword;

    @JsonProperty("facebook_account_id")
    private String facebookAccountId;

    @JsonProperty("google_account_id")
    private String googleAccountId;

//    @NotNull(message = "Role ID is required")
//    @JsonProperty("role_id")
//    private Long roleId;
}
