package com.example.datnweb.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.validation.constraints.NotBlank;  // Import cần thiết cho @NotBlank
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    @JsonProperty("phone_number")
    @NotBlank(message = "Phone number is required")  // Validation: không được để trống
    private String phoneNumber;

    private
