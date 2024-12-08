package com.project.shopapp.controller;

import com.project.shopapp.dto.ForgotPasswordDTO;
import com.project.shopapp.dto.UserDTO;
import com.project.shopapp.dto.UserLoginDTO;
import com.project.shopapp.exception.DataNotFoundException;
import com.project.shopapp.model.Token;
import com.project.shopapp.model.User;
import com.project.shopapp.response.Response;
import com.project.shopapp.service.user.EmailService;
import com.project.shopapp.service.user.TokenService;
import com.project.shopapp.service.user.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RestController
@RequestMapping("${api.prefix}/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final TokenService tokenService;
    private final EmailService emailService;

    @PostMapping("/register")
    public ResponseEntity<?> createUser(@Valid @RequestBody UserDTO userDTO) {
        try {
            //Kiểm tra mật khẩu nhập lại có giống không
            if (!userDTO.getPassword().equals(userDTO.getRetypePassword())) {
                return ResponseEntity.badRequest().body("Mật khẩu không giống nhau.");
            }
            //Gọi function createUser nếu không có lỗi
            return ResponseEntity.ok().body(Response.success(userService.createUser(userDTO)));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
        try {
            //Gọi function login
            Object response = userService.login(userLoginDTO.getEmail(), userLoginDTO.getPassword());
            return ResponseEntity.ok().body(Response.success(response));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }

    @GetMapping("/token")
    public ResponseEntity<?> generateToken(@Valid @RequestParam String email) {
        try {
            //Kiem tra email ton tai chua
            if (tokenService.findByUserEmail(email) != null) {
                return ResponseEntity.badRequest().body(Response.success("Token đã được gửi đến email của bạn, vui lòng không SPAM."));
            }
            //Kiem tra email co ton tai hay chua
            User user = userService.findByEmail(email);

            String token = tokenService.createToken(user);
            return ResponseEntity.ok().body(Response.success("Token đã được gửi qua email."));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }

    @PostMapping("/forgot-password")
    public ResponseEntity<?> getToken(@Valid @RequestBody ForgotPasswordDTO forgotPasswordDTO) throws DataNotFoundException {
        if (!Objects.equals(forgotPasswordDTO.getPassword(), forgotPasswordDTO.getRetypePassword())) {
            return ResponseEntity.badRequest().body("Mật khẩu không giống nhau.");
        }
        try {
            //Kiem tra token da ton tai hay chua
            Token existingToken = tokenService.findByToken(forgotPasswordDTO.getToken());

            boolean isTokenValid = tokenService.isTokenValid(forgotPasswordDTO.getToken());
            if (existingToken != null && isTokenValid) {
                User user = existingToken.getUser();
                if (forgotPasswordDTO.getEmail().equals(user.getEmail())) {
                    userService.setPassword(forgotPasswordDTO.getEmail(), forgotPasswordDTO.getPassword());
                    //Xoa token trong database
                    tokenService.delete(existingToken);
                    return ResponseEntity.ok().body(Response.success("Xác nhận mật khẩu thành công."));
                }
            }
            return ResponseEntity.badRequest().body(Response.error("Token không hợp lệ."));
        } catch (DataNotFoundException e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }

    @GetMapping("/test-email")
    public String testEmail() {
        emailService.sendTestEmail();
        return "Test email sent!";
    }
}
