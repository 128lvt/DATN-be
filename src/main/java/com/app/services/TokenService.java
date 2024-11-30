package com.app.services;

import com.app.models.Token;
import com.app.models.User;
import com.app.repositories.TokenRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TokenService {
    private final TokenRepository tokenRepository;
    private final EmailService emailService;

    public boolean isTokenValid(String token) {
        Token tokenEntity = tokenRepository.findByToken(token);
        if (tokenEntity == null) {
            return false;
        }
        return tokenEntity.getExpirationDate().isAfter(LocalDateTime.now());
    }

    public String createToken(User user) {
        String generatedToken = UUID.randomUUID().toString();
        Token token = new Token();
        token.setToken(generatedToken);
        token.setUser(user);
        token.setExpirationDate(LocalDateTime.now().plusMinutes(10));

        String emailBody = "Chào " + user.getFullName() + ",\n\n" +
                "Đây là token của bạn: " + generatedToken + "\n" +
                "Token này sẽ hết hạn sau 10 phút.\n\n" +
                "Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!";
        emailService.sendEmail(user.getEmail(), "Token xác thực", emailBody);

        tokenRepository.save(token);
        return generatedToken;
    }

    public Token findByToken(String token) {
        return tokenRepository.findByToken(token);
    }

    public void delete(Token token) {
        tokenRepository.delete(token);
    }

    public Token findByUserEmail(String email) {
        return tokenRepository.findByUserEmail(email);
    }
}
