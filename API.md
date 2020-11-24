# API

## Index

- 로그인 `POST /auth`
- 회원가입 `POST /users`
- 내 정보 조회 `GET /users/{id}`
- 내 정보 수정 `PATCH /users/{id}`
- 회원탈퇴 `DELETE /users/{id}`
- 학생인증 `POST /users/{id}/verify`
- 팀원 모집글 목록 조회 `GET /recruits?q={keywords}&limit={limit}&offset={offset}`
- 팀원 모집글 작성 `POST /recruits`
- 팀원 모집글 조회 `GET /recruits/{id}`
- 팀원 모집글 수정 `PATCH /recruits/{id}`
- 팀원 모집글 좋아요 `POST /recruits/{id}/like`
- 과거 프로젝트 조회 `GET /prev-projects?q={keywords}&limit={limit}&offset={offset}`
- 지도교수 조회 `GET /professors`
- 학과목록 조회 `GET /departments`
