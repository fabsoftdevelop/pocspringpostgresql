
DROP EXTENSION IF EXISTS pgcrypto;
CREATE EXTENSION pgcrypto;

-- public.usersequence definition

DROP SEQUENCE  IF EXISTS public.usersequence CASCADE;

CREATE SEQUENCE public.usersequence
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
    CACHE 1
    NO CYCLE;

-- public.rolesequence definition

DROP SEQUENCE IF EXISTS public.rolesequence CASCADE;

CREATE SEQUENCE public.rolesequence
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
    CACHE 1
    NO CYCLE;




-- Drop table

DROP TABLE IF EXISTS public."role";

CREATE TABLE public."role" (
                               id int4 NOT NULL DEFAULT nextval('rolesequence'::regclass),
                               role_title varchar NOT NULL
);

INSERT INTO public."role"
(role_title)
VALUES('role1');

DROP TABLE IF EXISTS public."roleuser";

CREATE TABLE public."roleuser" (
                               user_id int4 NOT NULL,
                               role_id int4 NOT NULL
);


-- Drop table

DROP TABLE IF EXISTS  public.app_user;

CREATE TABLE public.app_user (
                                 id int4 NOT NULL DEFAULT nextval('usersequence'::regclass),
                                 username varchar NOT NULL,
                                 "password" varchar NOT NULL
);

CREATE OR REPLACE FUNCTION public.add_user(new_username VARCHAR, new_password VARCHAR, role_name VARCHAR) RETURNS int AS $$
       DECLARE
ret_role_id INTEGER;
        ret_user_id INTEGER;
BEGIN
       ret_role_id = (SELECT id FROM public.role WHERE role_title = role_name);
INSERT INTO public.app_user (username, password) VALUES
    (new_username, crypt(new_password, gen_salt('bf', 8)));
ret_user_id = (SELECT id FROM public.app_user WHERE username = new_username);
INSERT into public.roleuser(user_id, role_id) VALUES (ret_user_id, ret_role_id);
RETURN ret_user_id;
END;
$$ LANGUAGE plpgsql;