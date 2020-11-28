package kr.igrus.jolbon.entity;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.springframework.data.annotation.LastModifiedDate;

@Entity(name = "user_contacts")
@Data @AllArgsConstructor @NoArgsConstructor
public class UserContact {
    @Id
    private int id;

    @NonNull
    private String email;

    @NonNull
    private String phone;

    @NonNull
    private String kakaoId;

    @NonNull
    private String openkakaoLink;

    @LastModifiedDate
    @NonNull
    private LocalDateTime updatedAt;
}
