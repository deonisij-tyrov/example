CREATE TABLE person (
  id       BIGINT NOT NULL,
  email    VARCHAR(255),
  filename VARCHAR(255),
  name     VARCHAR(255),
  user_id  BIGINT,
  PRIMARY KEY (id)
);

CREATE TABLE user_role (
  user_id  BIGINT NOT NULL,
  role_set VARCHAR(255)
);

CREATE TABLE usr (
  id              BIGINT NOT NULL,
  activation_code VARCHAR(255),
  email           VARCHAR(255),
  is_active       BIT    NOT NULL,
  password        VARCHAR(255) NOT NULL,
  username        VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE person
  ADD CONSTRAINT person_user_fk FOREIGN KEY (user_id) REFERENCES usr (id);
ALTER TABLE user_role
  ADD CONSTRAINT user_role_user_fk FOREIGN KEY (user_id) REFERENCES usr (id);