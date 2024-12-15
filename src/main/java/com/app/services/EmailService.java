package com.project.shopapp.service.user;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {
    private final JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }

    public void sendTestEmail() {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("thoailvps34860@fpt.edu.vn");  // Use your email here
            message.setTo("124ugust@gmail.com");  // Recipient's email
            message.setSubject("Test Email from Spring Boot");
            message.setText("This is a test email to verify the email configuration.");

            mailSender.send(message);
            System.out.println("Test email sent successfully!");
        } catch (Exception e) {
            System.out.println("Error sending test email: " + e.getMessage());
        }
    }
}
