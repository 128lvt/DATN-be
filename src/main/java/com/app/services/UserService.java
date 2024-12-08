package com.app.services;

import com.app.component.JwtTokenUtil;
import com.app.dtos.UserDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Role;
import com.app.models.User;
import com.app.repositories.RoleRepository;
import com.app.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenUtil jwtTokenUtil;
    private final AuthenticationManager authenticationManager;

    public User createUser(UserDTO userDTO) throws Exception {
        String phoneNUmber = userDTO.getEmail();
        //Kiểm tra số điện thoại đ ồn tại hay chưa
        if (userRepository.findByEmail(phoneNUmber).isPresent()) {
            throw new DataIntegrityViolationException("Email already exists");
        }

        Role role = roleRepository.findByName("user");

        User user = User.builder()
                .fullName(userDTO.getFullName())
                .email(userDTO.getEmail())
                .password(userDTO.getPassword())
                .address(userDTO.getAddress())
                .facebookAccountId(userDTO.getFacebookAccountId())
                .googleAccountId(userDTO.getGoogleAccountId())
                .build();

        user.setRole(role);
        //Kiểm tra đăng nhập bằng facebook và google
        if (userDTO.getFacebookAccountId() == null && userDTO.getGoogleAccountId() == null) {
            String password = userDTO.getPassword();
            String encodePassword = passwordEncoder.encode(password);
            user.setPassword(encodePassword);
        }
        user.setActive(true);
        return userRepository.save(user);
    }

    public Object login(String email, String password) throws DataNotFoundException {
        User user = userRepository.findByEmail(email).orElseThrow(() -> new DataNotFoundException("User not found"));

        if (user.getFacebookAccountId() == null && user.getGoogleAccountId() == null) {
            if (!passwordEncoder.matches(password, user.getPassword())) {
                throw new BadCredentialsException("Incorrect password");
            }
        }

        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password, user.getAuthorities()));

        Map<String, Object> response = new HashMap<>();
        response.put("token", jwtTokenUtil.generateToken(user));
        response.put("user", user);

        return response;
    }

    public User findByEmail(String email) throws DataNotFoundException {
        return userRepository.findByEmail(email).orElseThrow(() -> new DataNotFoundException("User not found"));
    }

    public void setPassword(String email, String password) throws DataNotFoundException {
        User user = userRepository.findByEmail(email).orElseThrow(() -> new DataNotFoundException("User not found"));
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }
}