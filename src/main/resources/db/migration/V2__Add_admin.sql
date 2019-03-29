INSERT into usr (id, is_active, password, username)
VALUE (1, true, '123', 'admin');

INSERT INTO user_role (user_id, role_set)
VALUEs (1,'USER'), (1, 'ADMIN');