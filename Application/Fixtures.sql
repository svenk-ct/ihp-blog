

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at, updated_at) VALUES ('f4e52512-0598-4b97-89f3-f5fdbd69d17e', 'Hello World', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam', '2024-01-05 11:04:33.155811+01', '2024-01-05 11:04:33.155811+01');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at, updated_at) VALUES ('4150e75b-951a-4d08-b19c-2f7404cb5a41', 'f4e52512-0598-4b97-89f3-f5fdbd69d17e', 'Sven', 'Great post!', '2024-01-05 11:56:06.097166+01', '2024-01-05 11:56:06.097166+01');
INSERT INTO public.comments (id, post_id, author, body, created_at, updated_at) VALUES ('d087fc69-dfd1-474a-b8c0-e2c5c131ed12', 'f4e52512-0598-4b97-89f3-f5fdbd69d17e', 'Sven', 'Really nice!', '2024-01-05 11:57:13.226233+01', '2024-01-05 11:57:13.226233+01');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1704448366);
INSERT INTO public.schema_migrations (revision) VALUES (1704451624);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


