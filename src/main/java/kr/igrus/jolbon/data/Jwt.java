package kr.igrus.jolbon.data;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;

@Data @AllArgsConstructor
public class Jwt {
    @JsonProperty("access_token")
    @NonNull
    private String accessToken;

    @JsonProperty("token_type")
    @NonNull
    private String tokenType;

    @JsonProperty("expires_in")
    private int expiration;
}
