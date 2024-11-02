package com.app.services;

import com.app.dtos.UserDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Role;
import com.app.models.User;
import com.app.repositories.RoleRepository;
import com.app.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    @Override
    public User createUser(UserDTO userDTO) throws DataNotFoundException {
        String phoneNumber = userDTO.getPhoneNumber();
        //KTra sdt đã tồn tại hay chưa
        if (userRepository.existsByPhoneNumber(phoneNumber)) {
            throw new DataIntegrityViolationException("Phone number already exists");
        }
        //convert userDTO => user
        User newUser = User.builder()
                .fullName(userDTO.getFullName())
                .phoneNumber(userDTO.getPhoneNumber())
                .address(userDTO.getAddress())
                .dateOfBirth(userDTO.getDateOfBirth())
                .facebookAccountId(userDTO.getFacebookAccountId())
                .googleAccountId(userDTO.getGoogleAccountId())
                .build();
        Role role = roleRepository.findById(userDTO.getRoleId())
                .orElseThrow(() -> new DataNotFoundException("Role not found"));
        newUser.setRole(role);
        //Ktra nếu có AccountId, ko yêu cầu mk
//        if (userDTO.getFacebookAccountId() = 0 && userDTO.getFacebookAccountId() = 0) {
//            String password = userDTO.getPassword();
//            //String encodedPassword = passwordEncoder.encode(password);
//            //sẽ nói trong phần spring security
//            //newUser.setPassword(encodedPassword);
//        }
        return userRepository.save(newUser);
    }

    @Override
    public String login(String phoneNumber, String password) {
        //lquan nhiều đến security
        return null;
    }
}