package kr.igrus.jolbon.service;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (username.equals("12345678")) {
            return new User("12345678", "$argon2id$v=19$m=4096,t=3,p=1$c9NL/j0PyzLSd0tpbDIU4Q$A7oKuqcEuZRj1oUdzIN+DX3YJIpiRr2Y1BCpxOdb0n4", new ArrayList<>());
        }
        throw new UsernameNotFoundException("Failed to find the user");
    }
}
