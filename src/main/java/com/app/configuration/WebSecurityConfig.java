package com.project.shopapp.configuration;

import com.project.shopapp.filter.JwtTokenFilter;
import com.project.shopapp.model.Role;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
public class WebSecurityConfig {
    private final JwtTokenFilter jwtTokenFilter;

    @Value("${api.prefix}")
    private String apiPrefix;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .addFilterBefore(jwtTokenFilter, UsernamePasswordAuthenticationFilter.class)
                .authorizeHttpRequests(requests -> requests
                        .requestMatchers(
                                String.format("%s/users/register", apiPrefix),
                                String.format("%s/users/login", apiPrefix),
                                String.format("%s/users/token", apiPrefix),
                                String.format("%s/users/forgot-password", apiPrefix),
                                String.format("%s/payments/momo/callback", apiPrefix)
                        )
                        .permitAll()
                        .requestMatchers(HttpMethod.GET,
                                String.format("%s/dashboard/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.POST,
                                String.format("%s/categories/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.GET,
                                String.format("%s/categories/**", apiPrefix)).permitAll()

                        .requestMatchers(HttpMethod.PUT,
                                String.format("%s/categories/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.DELETE,
                                String.format("%s/categories/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.POST,
                                String.format("%s/products/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.GET,
                                String.format("%s/products/**", apiPrefix)).permitAll()

                        .requestMatchers(HttpMethod.PUT,
                                String.format("%s/products/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.DELETE,
                                String.format("%s/products/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.POST,
                                String.format("%s/orders/**", apiPrefix)).hasAnyRole(Role.USER, Role.DEV)

                        .requestMatchers(HttpMethod.GET,
                                String.format("%s/orders/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.USER, Role.DEV)

                        .requestMatchers(HttpMethod.GET,
                                String.format("%s/orders", apiPrefix)).hasAnyRole(Role.ADMIN, Role.USER, Role.DEV)

                        .requestMatchers(HttpMethod.PUT,
                                String.format("%s/orders/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.DELETE,
                                String.format("%s/orders/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.PUT,
                                String.format("%s/orders/status/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.POST,
                                String.format("%s/order_details/**", apiPrefix)).hasAnyRole(Role.USER, Role.DEV)

                        .requestMatchers(HttpMethod.GET,
                                String.format("%s/order_details/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.USER, Role.DEV)

                        .requestMatchers(HttpMethod.PUT,
                                String.format("%s/order_details/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .requestMatchers(HttpMethod.DELETE,
                                String.format("%s/order_details/**", apiPrefix)).hasAnyRole(Role.ADMIN, Role.DEV)

                        .anyRequest().hasAnyRole(Role.DEV, Role.ADMIN, Role.USER)
                );

        return http.build();
    }
}
