CREATE TABLE departments (
    `id`        INT          NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(25)  NOT NULL UNIQUE,
    `priority`  TINYINT      NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE professors (
    `id`             INT          NOT NULL AUTO_INCREMENT,
    `department_id`  INT          NOT NULL,
    `name`           VARCHAR(25)  NOT NULL,
    `lab_name`       VARCHAR(50)  NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE users (
    `id`             INT          NOT NULL,
    `department_id`  INT          NOT NULL,
    `grade`          TINYINT      NOT NULL,
    `name`           VARCHAR(25)  NOT NULL,
    `age`            TINYINT      NULL,
    `gender`         TINYINT      NULL,
    `residence`      VARCHAR(50)  NULL,
    `country`        VARCHAR(50)  NULL,
    `profile_link`   VARCHAR(50)  NULL,
    `created_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`     TIMESTAMP    NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE user_auth (
    `id`               INT        NOT NULL,
    `password_hashed`  CHAR(96)   NOT NULL,
    `verified`         TINYINT    NOT NULL,
    `updated_at`       TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE user_contacts (
    `id`              INT           NOT NULL,
    `email`           VARCHAR(100)  NOT NULL UNIQUE,
    `phone`           VARCHAR(25)   NULL UNIQUE,
    `kakao_id`        VARCHAR(25)   NULL UNIQUE,
    `openkakao_link`  VARCHAR(100)  NULL UNIQUE,
    `updated_at`      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE user_experience (
    `id`          INT        NOT NULL,
    `content`     TEXT       NULL,
    `updated_at`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE user_security_logs (
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `user_id`     INT          NOT NULL,
    `action`      VARCHAR(25)  NOT NULL,
    `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE tags (
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(25)  NOT NULL UNIQUE,
    `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE recruits (
    `id`               BIGINT       NOT NULL AUTO_INCREMENT,
    `department_id`    INT          NOT NULL,
    `professor_id`     INT          NOT NULL,
    `year`             INT          NOT NULL,
    `required_member`  TINYINT      NOT NULL,
    `title`            VARCHAR(50)  NOT NULL,
    `content`          TEXT         NOT NULL,
    `author_id`        INT          NOT NULL,
    `anonymous`        TINYINT      NOT NULL,
    `views`            INT          NOT NULL,
    `likes`            INT          NOT NULL,
    `created_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`       TIMESTAMP    NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (professor_id) REFERENCES professors (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (author_id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE recruit_contact_visibilities (
    `id`              BIGINT     NOT NULL,
    `email`           TINYINT    NOT NULL,
    `phone`           TINYINT    NOT NULL,
    `kakao_id`        TINYINT    NOT NULL,
    `openkakao_link`  TINYINT    NOT NULL,
    `updated_at`      TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES recruits (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE recruit_likes (
    `id`          BIGINT     NOT NULL AUTO_INCREMENT,
    `recruit_id`  BIGINT     NOT NULL,
    `actor_id`    INT        NOT NULL,
    `created_at`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (recruit_id) REFERENCES recruits (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (actor_id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE recruit_views (
    `id`          BIGINT     NOT NULL AUTO_INCREMENT,
    `recruit_id`  BIGINT     NOT NULL,
    `viewer_id`   INT        NOT NULL,
    `created_at`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (recruit_id) REFERENCES recruits (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (viewer_id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE recruit_tags (
    `id`          BIGINT     NOT NULL AUTO_INCREMENT,
    `recruit_id`  BIGINT     NOT NULL,
    `tag_id`      BIGINT     NOT NULL,
    `created_at`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (recruit_id) REFERENCES recruits (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (tag_id) REFERENCES tags (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE previous_projects (
    `id`             INT          NOT NULL AUTO_INCREMENT,
    `department_id`  INT          NOT NULL,
    `professor_id`   INT          NOT NULL,
    `year`           INT          NOT NULL,
    `title`          VARCHAR(50)  NOT NULL,
    `member`         INT          NOT NULL,
    `hidden`         TINYINT      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (professor_id) REFERENCES professors (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE previous_project_tags (
    `id`          BIGINT     NOT NULL AUTO_INCREMENT,
    `project_id`  INT        NOT NULL,
    `tag_id`      BIGINT     NOT NULL,
    `created_at`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES previous_projects (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (tag_id) REFERENCES tags (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
