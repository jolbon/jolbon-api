package kr.igrus.jolbon.entity;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.springframework.data.annotation.LastModifiedDate;

@Entity(name = "user_experience")
@Data @AllArgsConstructor @NoArgsConstructor
public class UserExperience {
    @Id
    private int id;

    @NonNull
    private String content;

    @LastModifiedDate
    @NonNull
    private LocalDateTime updatedAt;
}
