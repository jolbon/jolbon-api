package kr.igrus.jolbon.entity;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.springframework.data.annotation.LastModifiedDate;

@Entity(name = "user_auth")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAuth {
    @Id
    private int id;

    @Column(name = "password_hashed")
    @NonNull
    private String password;

    private Boolean verified;

    @NonNull
    @LastModifiedDate
    private LocalDateTime updatedAt;
}
