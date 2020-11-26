package kr.igrus.jolbon.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import kr.igrus.jolbon.entity.UserDetails;

@Repository
public interface UserDetailsRepository extends CrudRepository<UserDetails, Integer> {
    UserDetails findById(int id);
}
