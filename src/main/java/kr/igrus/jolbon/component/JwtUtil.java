package kr.igrus.jolbon.component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import kr.igrus.jolbon.data.Jwt;
import kr.igrus.jolbon.entity.UserDetails;

@Component
public class JwtUtil {
    private final String issuer;
    private final String audience;
    private final int expiration;
    private final String secret;

    public JwtUtil(@Value("${jwt.issuer}") String issuer,
                   @Value("${jwt.audience}") String audience,
                   @Value("${jwt.expiration}") int expiration,
                   @Value("${jwt.secret}") String secret) {
        this.issuer = issuer;
        this.audience = audience;
        this.expiration = expiration;
        this.secret = secret;
    }

    public Jwt generateToken(UserDetails user) {
        final Map<String, Object> payload = new HashMap<>();
        payload.put("department_id", user.getDepartmentId());
        payload.put("grade", user.getGrade());
        payload.put("name", user.getName());

        final String accessToken = Jwts.builder()
                .setClaims(payload)
                .setIssuer(issuer)
                .setSubject(String.valueOf(user.getId()))
                .setAudience(audience)
                .setExpiration(new Date(System.currentTimeMillis() + (expiration * 1000)))
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .signWith(SignatureAlgorithm.HS256, secret)
                .compact();
        return new Jwt(accessToken, "Bearer", expiration);
    }
}
