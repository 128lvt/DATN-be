package com.project.shopapp.service.user;

import com.project.shopapp.component.JwtTokenUtil;
import com.project.shopapp.dto.UserDTO;
import com.project.shopapp.exception.DataNotFoundException;
import com.project.shopapp.model.Role;
import com.project.shopapp.model.User;
import com.project.shopapp.repository.RoleRepository;
import com.project.shopapp.repository.UserRepository;
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
        String email = userDTO.getEmail();
        //Kiểm tra email đã đăng ký chưa
        if (userRepository.findByEmail(email).isPresent()) {
            throw new DataIntegrityViolationException("Email đã được đăng ký.");
        }

        //Build User từ DTO
        User user = User.builder()
                .fullName(userDTO.getFullName())
                .email(userDTO.getEmail())
                .password(userDTO.getPassword())
                .address(userDTO.getAddress())
                .facebookAccountId(userDTO.getFacebookAccountId())
                .googleAccountId(userDTO.getGoogleAccountId())
                .build();

        //Mã hóa mật khẩu
        String password = userDTO.getPassword();
        String encodePassword = passwordEncoder.encode(password);
        user.setPassword(encodePassword);

        //Set role và trạng thái
        Role role = roleRepository.findByName("user");
        user.setRole(role);
        user.setActive(true);
        //Lưu User vào database
        return userRepository.save(user);
    }


    public Object login(String email, String password) throws DataNotFoundException {
        //Kiểm tra email đã được đăng ký chưa
        User user = userRepository.findByEmail(email).orElseThrow(() -> new DataNotFoundException("Email chưa được đăng ký."));

        //Kiểm tra mật khẩu
        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new BadCredentialsException("Mật khẩu không đúng.");
        }

        //Xác thực người dùng với Spring Security
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password, user.getAuthorities()));

        //Trả về token, thông tin User, Role
        Map<String, Object> response = new HashMap<>();
        response.put("token", jwtTokenUtil.generateToken(user));
        response.put("user", user);
        response.put("role", user.getRole());

        return response;
    }

    public User findByEmail(String email) throws DataNotFoundException {
        return userRepository.findByEmail(email).orElseThrow(() -> new DataNotFoundException("Email chưa được đăng ký."));
    }

    public void setPassword(String email, String password) throws DataNotFoundException {
        User user = userRepository.findByEmail(email).orElseThrow(() -> new DataNotFoundException("Email chưa được đăng ký."));
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }


}
