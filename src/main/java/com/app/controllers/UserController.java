package com.app.controllers;

import com.app.dtos.UserDTO;
import com.app.dtos.UserLoginDTO;
import com.app.responses.Response;
import com.app.services.EmailService;
import com.app.services.IUserService;
import com.app.services.TokenService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/users")
@RequiredArgsConstructor
public class UserController {
    private final IUserService userService;
    private final TokenService tokenService;
    private final EmailService emailService;


    @PostMapping("/register")
    public ResponseEntity<?> createUser(@Valid @RequestBody UserDTO userDTO) {
        try {
            if (!userDTO.getPassword().equals(userDTO.getRetypePassword())) {
                return ResponseEntity.badRequest().body("Password does not match");
            }
            return ResponseEntity.ok().body(Response.success(userService.createUser(userDTO)));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
        //Kiểm tra thông tin đăng nhập và sinh token
        //Trả về token trong response
        try {
            Object response = userService.login(userLoginDTO.getEmail(), userLoginDTO.getPassword());
            return ResponseEntity.ok().body(Response.success(response));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }
}
