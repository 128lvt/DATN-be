package com.app.services;

import com.app.dtos.UserDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.User;


public interface IUserService {
    User createUser(UserDTO userDTO) throws DataNotFoundException;

    String login(String phoneNumber, String password);
}