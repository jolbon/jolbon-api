package kr.igrus.jolbon.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.igrus.jolbon.entity.UserDetails;
import kr.igrus.jolbon.service.UserDetailsServiceImpl;
import kr.igrus.jolbon.util.JwtUtil;

@RestController
public class AuthenticationController {
    @Data @AllArgsConstructor
    public static class AuthenticationRequest {
        private int id;

        @NonNull
        private String password;
    }

    @Data @AllArgsConstructor
    public static class AuthenticationResponse {
        @JsonProperty("access_token")
        @NonNull
        private String accessToken;

        @JsonProperty("token_type")
        @NonNull
        private String tokenType;

        @JsonProperty("expires_in")
        private int expiresIn;
    }

    private final AuthenticationManager authenticationManager;
    private final UserDetailsServiceImpl userDetailsService;
    private final JwtUtil jwtUtil;

    public AuthenticationController(AuthenticationManager authenticationManager, UserDetailsServiceImpl userDetailsService, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.userDetailsService = userDetailsService;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/auth")
    public ResponseEntity<?> login(@RequestBody AuthenticationRequest authenticationRequest) throws Exception {
        final int id = authenticationRequest.getId();
        final String password = authenticationRequest.getPassword();

        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(id, password));
            final UserDetails user = (UserDetails) userDetailsService.loadUserByUsername(String.valueOf(id));
            return ResponseEntity.ok(jwtUtil.generateToken(user));
        } catch (BadCredentialsException e) {
            throw new Exception("the credentials are invalid");
        }
    }
}
