--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE studyportal;




--
-- Drop roles
--

DROP ROLE postgres;
DROP ROLE studyportal;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE studyportal;
ALTER ROLE studyportal WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md51b7b27c87013ec53a86ec35a5821862b';






--
-- Database creation
--

CREATE DATABASE studyportal WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect studyportal

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO studyportal;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO studyportal;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO studyportal;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO studyportal;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO studyportal;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO studyportal;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO studyportal;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO studyportal;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO studyportal;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO studyportal;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO studyportal;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO studyportal;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO studyportal;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO studyportal;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO studyportal;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO studyportal;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO studyportal;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO studyportal;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO studyportal;

--
-- Name: rest_api_course; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.rest_api_course (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    department_id integer,
    code character varying(10) NOT NULL
);


ALTER TABLE public.rest_api_course OWNER TO studyportal;

--
-- Name: rest_api_course_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.rest_api_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rest_api_course_id_seq OWNER TO studyportal;

--
-- Name: rest_api_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.rest_api_course_id_seq OWNED BY public.rest_api_course.id;


--
-- Name: rest_api_department; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.rest_api_department (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    imageurl character varying(100) NOT NULL
);


ALTER TABLE public.rest_api_department OWNER TO studyportal;

--
-- Name: rest_api_department_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.rest_api_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rest_api_department_id_seq OWNER TO studyportal;

--
-- Name: rest_api_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.rest_api_department_id_seq OWNED BY public.rest_api_department.id;


--
-- Name: rest_api_file; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.rest_api_file (
    id integer NOT NULL,
    downloads integer NOT NULL,
    date_modified date NOT NULL,
    filetype character varying(20) NOT NULL,
    course_id integer NOT NULL,
    driveid character varying(50) NOT NULL,
    title character varying(100) NOT NULL,
    size character varying(10) NOT NULL,
    fileext character varying(10) NOT NULL,
    finalized boolean NOT NULL
);


ALTER TABLE public.rest_api_file OWNER TO studyportal;

--
-- Name: rest_api_file_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.rest_api_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rest_api_file_id_seq OWNER TO studyportal;

--
-- Name: rest_api_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.rest_api_file_id_seq OWNED BY public.rest_api_file.id;


--
-- Name: users_courserequest; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.users_courserequest (
    id integer NOT NULL,
    status integer NOT NULL,
    department character varying(100) NOT NULL,
    course character varying(100) NOT NULL,
    code character varying(8) NOT NULL,
    date date NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_courserequest OWNER TO studyportal;

--
-- Name: users_courserequest_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.users_courserequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_courserequest_id_seq OWNER TO studyportal;

--
-- Name: users_courserequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.users_courserequest_id_seq OWNED BY public.users_courserequest.id;


--
-- Name: users_filerequest; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.users_filerequest (
    id integer NOT NULL,
    filetype character varying(20) NOT NULL,
    status integer NOT NULL,
    title character varying(100) NOT NULL,
    date date NOT NULL,
    course_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_filerequest OWNER TO studyportal;

--
-- Name: users_filerequest_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.users_filerequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_filerequest_id_seq OWNER TO studyportal;

--
-- Name: users_filerequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.users_filerequest_id_seq OWNED BY public.users_filerequest.id;


--
-- Name: users_upload; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.users_upload (
    id integer NOT NULL,
    driveid character varying(50) NOT NULL,
    resolved boolean NOT NULL,
    status integer NOT NULL,
    title character varying(100) NOT NULL,
    filetype character varying(20) NOT NULL,
    date date NOT NULL,
    course_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_upload OWNER TO studyportal;

--
-- Name: users_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.users_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_upload_id_seq OWNER TO studyportal;

--
-- Name: users_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.users_upload_id_seq OWNED BY public.users_upload.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: studyportal
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    falcon_id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    profile_image character varying(500) NOT NULL,
    courses integer[] NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE public.users_user OWNER TO studyportal;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: studyportal
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO studyportal;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: studyportal
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: rest_api_course id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_course ALTER COLUMN id SET DEFAULT nextval('public.rest_api_course_id_seq'::regclass);


--
-- Name: rest_api_department id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_department ALTER COLUMN id SET DEFAULT nextval('public.rest_api_department_id_seq'::regclass);


--
-- Name: rest_api_file id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_file ALTER COLUMN id SET DEFAULT nextval('public.rest_api_file_id_seq'::regclass);


--
-- Name: users_courserequest id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_courserequest ALTER COLUMN id SET DEFAULT nextval('public.users_courserequest_id_seq'::regclass);


--
-- Name: users_filerequest id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_filerequest ALTER COLUMN id SET DEFAULT nextval('public.users_filerequest_id_seq'::regclass);


--
-- Name: users_upload id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_upload ALTER COLUMN id SET DEFAULT nextval('public.users_upload_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add department	7	add_department
26	Can change department	7	change_department
27	Can delete department	7	delete_department
28	Can view department	7	view_department
29	Can add course	8	add_course
30	Can change course	8	change_course
31	Can delete course	8	delete_course
32	Can view course	8	view_course
33	Can add file	9	add_file
34	Can change file	9	change_file
35	Can delete file	9	delete_file
36	Can view file	9	view_file
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add upload	11	add_upload
42	Can change upload	11	change_upload
43	Can delete upload	11	delete_upload
44	Can view upload	11	view_upload
45	Can add file request	12	add_filerequest
46	Can change file request	12	change_filerequest
47	Can delete file request	12	delete_filerequest
48	Can view file request	12	view_filerequest
49	Can add course request	13	add_courserequest
50	Can change course request	13	change_courserequest
51	Can delete course request	13	delete_courserequest
52	Can view course request	13	view_courserequest
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$NSqeqhzctjkB$gJSDjWvJuLiX87ahBb/O70+Oq2KclTzEGgEzG+nEPyc=	\N	f	studyportal			test@test.test	f	t	2020-04-21 04:47:51.542059+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-08-30 22:06:50.287472+00	1	Electrical Engineering	1	[{"added": {}}]	7	1
2	2019-08-30 22:07:04.31955+00	1	Network Theory	1	[{"added": {}}]	8	1
3	2019-08-30 22:24:25.119222+00	1	Electrical Engineering	2	[]	7	1
4	2019-08-30 22:24:31.322563+00	1	Network Theory	2	[]	8	1
5	2019-08-30 23:04:34.019852+00	1	Tutorial 1	1	[{"added": {}}]	10	1
6	2019-08-31 10:52:31.953574+00	20	Network Theory	1	[{"added": {}}]	8	1
7	2019-08-31 10:53:07.668362+00	21	Analog Electronic	1	[{"added": {}}]	8	1
8	2019-09-01 13:10:23.758295+00	3	Electronics and Communication Engineering	1	[{"added": {}}]	7	1
9	2019-09-01 13:10:49.934904+00	22	Semiconductor Devices	1	[{"added": {}}]	8	1
10	2019-09-01 13:22:11.421957+00	4	Production and Industrial Engineering	1	[{"added": {}}]	7	1
11	2019-09-01 13:22:48.474841+00	5	Polymer Science And Engineering	1	[{"added": {}}]	7	1
12	2019-09-01 13:23:45.669+00	6	Computer Science and Engineering	1	[{"added": {}}]	7	1
13	2019-09-01 13:24:02.81564+00	7	Mechanical Engineering	1	[{"added": {}}]	7	1
14	2019-09-01 13:24:22.464381+00	8	Applied Mathematics	1	[{"added": {}}]	7	1
15	2019-09-01 13:26:00.579686+00	9	Metallurgical and Materials Engineering	1	[{"added": {}}]	7	1
16	2019-09-01 13:26:38.397921+00	10	Civil Engineering	1	[{"added": {}}]	7	1
17	2019-09-01 13:27:07.875368+00	11	Biotechnology	1	[{"added": {}}]	7	1
18	2019-09-01 13:27:53.777036+00	12	Engineering Physics	1	[{"added": {}}]	7	1
19	2019-09-01 18:16:37.651322+00	2	Tutorial 1	1	[{"added": {}}]	10	1
20	2019-09-01 19:14:01.017669+00	23	Digital Logic Design	1	[{"added": {}}]	8	1
21	2019-09-21 19:28:42.730454+00	1	Electrical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
22	2019-09-28 23:45:20.479451+00	1	Electrical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
23	2019-09-28 23:46:19.869223+00	12	Engineering Physics	2	[{"changed": {"fields": ["url"]}}]	7	1
24	2019-09-28 23:46:56.184047+00	11	Biotechnology	2	[{"changed": {"fields": ["url"]}}]	7	1
25	2019-09-28 23:46:58.799201+00	11	Biotechnology	2	[]	7	1
26	2019-09-28 23:47:12.120682+00	10	Civil Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
27	2019-09-28 23:47:49.040713+00	9	Metallurgical and Materials Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
28	2019-09-28 23:48:21.688429+00	8	Applied Mathematics	2	[{"changed": {"fields": ["url"]}}]	7	1
29	2019-09-28 23:48:55.520266+00	7	Mechanical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
30	2019-09-28 23:49:07.410987+00	6	Computer Science and Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
31	2019-09-28 23:49:39.884534+00	5	Polymer Science And Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
32	2019-09-28 23:49:50.937692+00	4	Production and Industrial Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
33	2019-09-28 23:50:16.116946+00	3	Electronics and Communication Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
34	2019-09-28 23:50:33.387465+00	2	Chemical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
35	2019-09-28 23:51:02.159236+00	5	Polymer Science And Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
36	2019-09-28 23:51:14.854116+00	12	Engineering Physics	2	[{"changed": {"fields": ["url"]}}]	7	1
37	2019-10-03 12:17:28.879348+00	2	Tutorial 1	3		10	1
38	2019-10-03 12:24:43.554002+00	3	Tutorial-1	1	[{"added": {}}]	10	1
39	2019-10-07 15:38:48.113809+00	3	Tutorial-1	3		10	1
40	2019-10-07 15:42:30.92814+00	4	Tutorial-1	1	[{"added": {}}]	10	1
41	2019-10-07 15:55:24.814566+00	4	Tutorial-1	3		10	1
42	2019-10-07 15:57:19.56742+00	5	Tutorial-1	1	[{"added": {}}]	10	1
43	2019-10-07 16:10:00.295493+00	5	Tutorial-1	3		10	1
44	2019-10-07 16:12:17.597176+00	6	Tutorial-1	1	[{"added": {}}]	10	1
45	2019-10-07 16:13:41.290064+00	6	Tutorial-1	3		10	1
46	2019-10-07 16:15:25.811711+00	7	Tutorial-1	1	[{"added": {}}]	10	1
47	2019-10-07 16:17:31.121135+00	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
48	2019-10-07 16:19:09.948481+00	7	Tutorial-1	2	[{"changed": {"fields": ["filetype"]}}]	10	1
49	2019-10-07 16:19:42.176864+00	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
50	2019-10-07 16:20:03.280286+00	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
51	2019-10-07 16:20:48.796738+00	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
52	2019-10-07 16:21:07.962575+00	7	Tutorial-1	2	[{"changed": {"fields": ["file", "filetype"]}}]	10	1
53	2019-10-07 16:21:32.1278+00	7	Tutorial-1	2	[{"changed": {"fields": ["file", "filetype"]}}]	10	1
54	2019-10-07 17:13:10.331447+00	7	files/exampapers/Booking_Details.pdf	2	[]	10	1
55	2019-10-07 17:35:30.822267+00	7	files/exampapers/Booking_Details.pdf	2	[]	10	1
56	2019-10-07 17:38:06.569891+00	7	files/exampapers/Booking_Details.pdf	3		10	1
57	2019-10-07 17:38:26.276963+00	8	files/tutorials/air_asia.pdf	1	[{"added": {}}]	10	1
58	2019-10-07 20:05:42.408579+00	8	Tutorial-1	2	[{"changed": {"fields": ["title", "size", "fileext"]}}]	10	1
59	2019-10-07 20:26:19.493557+00	9	Tutorial 2	1	[{"added": {}}]	10	1
60	2019-10-07 20:27:03.270698+00	9	Network Thory-E Kandestal	2	[{"changed": {"fields": ["title"]}}]	10	1
61	2019-10-07 21:32:30.629132+00	8	Tutorial-1	3		10	1
62	2019-10-07 21:32:37.546398+00	9	Network Thory-E Kandestal	3		10	1
63	2019-10-07 21:37:57.588343+00	11	files/tutorials/bash_9a7gZHO.sh	1	[{"added": {}}]	10	1
64	2019-10-07 21:45:00.894022+00	12	ayan	1	[{"added": {}}]	10	1
65	2019-10-07 22:28:48.008136+00	13	Ayan_Choudhary_s_CV	1	[{"added": {}}]	10	1
66	2019-10-07 22:29:52.396627+00	14	image	1	[{"added": {}}]	10	1
67	2019-10-14 17:13:10.811133+00	15	Booking_Details	1	[{"added": {}}]	10	1
68	2019-10-30 15:09:51.765372+00	62	Electrical Machines	3		8	1
69	2019-10-30 15:10:09.729271+00	61	Electrical Machines	3		8	1
70	2019-10-30 15:10:09.760195+00	60	Electrical Machines	3		8	1
71	2019-10-30 15:10:09.804347+00	59	Electrical Machines	3		8	1
72	2019-10-30 15:10:09.847407+00	58	Electrical Machines	3		8	1
73	2019-10-30 15:10:09.890957+00	57	Electrical Machines	3		8	1
74	2019-10-30 15:10:09.91068+00	56	Electrical Machines	3		8	1
75	2019-10-30 15:10:09.923135+00	55	Electrical Machines	3		8	1
76	2019-10-31 08:18:03.561102+00	72	Electrical Machines	3		8	1
77	2019-10-31 08:23:03.544984+00	73	Electrical Machines	3		8	1
78	2019-10-31 08:23:22.222201+00	74	Electrical Machines	3		8	1
79	2019-10-31 09:20:25.019963+00	15	Booking_Details	3		10	1
80	2019-10-31 09:20:25.10833+00	14	image	3		10	1
81	2019-10-31 09:20:25.120539+00	13	Ayan_Choudhary_s_CV	3		10	1
82	2019-10-31 09:20:25.133455+00	12	ayan	3		10	1
83	2019-10-31 09:20:25.145842+00	11	bash_9a7gZHO	3		10	1
1387	2020-02-19 12:19:53.753122+00	24	nkansn	3		11	1
84	2019-10-31 14:42:36.013471+00	75	Structural Analysis - 1	2	[{"changed": {"fields": ["department"]}}]	8	1
85	2019-11-01 16:57:52.215454+00	16	Geo Physical Technology	3		7	1
86	2019-11-03 15:58:51.079131+00	76	Digital Electronic	1	[{"added": {}}]	8	1
87	2019-11-03 16:12:16.723202+00	18	PDF	3		10	1
88	2019-11-03 16:12:17.249831+00	17	PDF	3		10	1
89	2019-11-03 16:22:20.074742+00	22	ECN-212 End term solution.PDF	3		10	1
90	2019-11-03 16:22:20.146644+00	21	ECN-212 quiz 2 solution.PDF	3		10	1
91	2019-11-03 16:25:35.028127+00	24	ECN-212 End term solution.PDF	3		10	1
92	2019-11-03 16:25:35.162977+00	23	ECN-212 quiz 2 solution.PDF	3		10	1
93	2019-11-24 12:24:44.497669+00	50	Water Resources Development and Management	3		7	1
94	2019-11-24 12:24:45.21382+00	49	Physics	3		7	1
95	2019-11-24 12:24:45.226342+00	48	Polymer and Process Engineering	3		7	1
96	2019-11-24 12:24:45.2386+00	47	Paper Technology	3		7	1
97	2019-11-24 12:24:45.251355+00	46	Metallurgical and Materials Engineering	3		7	1
98	2019-11-24 12:24:45.263929+00	45	Mechanical and Industrial Engineering	3		7	1
99	2019-11-24 12:24:45.277148+00	44	Mathematics	3		7	1
100	2019-11-24 12:24:45.289158+00	43	Management Studies	3		7	1
101	2019-11-24 12:24:45.302102+00	42	Hydrology	3		7	1
102	2019-11-24 12:24:45.314546+00	41	Humanities and Social Sciences	3		7	1
103	2019-11-24 12:24:45.327429+00	40	Electronics and Communication Engineering	3		7	1
104	2019-11-24 12:24:45.339816+00	39	Electrical Engineering	3		7	1
105	2019-11-24 12:24:45.352784+00	38	Earth Sciences	3		7	1
106	2019-11-24 12:24:45.365316+00	37	Earthquake	3		7	1
107	2019-11-24 12:24:45.378121+00	36	Computer Science and Engineering	3		7	1
108	2019-11-24 12:24:45.39061+00	35	Civil Engineering	3		7	1
109	2019-11-24 12:24:45.403283+00	34	Chemistry	3		7	1
110	2019-11-24 12:24:45.415805+00	33	Chemical Engineering	3		7	1
111	2019-11-24 12:24:45.428877+00	32	Biotechnology	3		7	1
112	2019-11-24 12:24:45.441173+00	31	Architecture and Planning	3		7	1
113	2019-11-24 12:24:45.454032+00	30	Applied Science and Engineering	3		7	1
114	2019-11-24 12:24:45.466402+00	29	Hydro and Renewable Energy	3		7	1
115	2019-11-24 12:24:45.487406+00	28	Physics	3		7	1
116	2019-11-24 12:24:45.499865+00	27	Paper Technology	3		7	1
117	2019-11-24 12:24:45.513243+00	26	Mathematics	3		7	1
118	2019-11-24 12:24:45.525314+00	25	Management Studies	3		7	1
119	2019-11-24 12:24:45.538197+00	24	Hydrology	3		7	1
120	2019-11-24 12:24:45.550578+00	23	Humanities and Social Sciences	3		7	1
121	2019-11-24 12:24:45.563445+00	22	Electrical Engineering	3		7	1
122	2019-11-24 12:24:45.57562+00	21	Earth Sciences	3		7	1
123	2019-11-24 12:24:45.588294+00	20	Earthquake	3		7	1
124	2019-11-24 12:24:45.60082+00	19	Civil Engineering	3		7	1
125	2019-11-24 12:24:45.613964+00	18	Chemistry	3		7	1
126	2019-11-24 12:24:45.626746+00	17	Biotechnology	3		7	1
127	2019-11-24 12:24:45.639346+00	15	Geo Physical Technology	3		7	1
128	2019-11-24 12:24:45.652266+00	14	Geotechnology	3		7	1
129	2019-11-24 12:24:45.664961+00	13	Textile Engineering	3		7	1
130	2019-11-24 12:24:45.677714+00	12	Engineering Physics	3		7	1
131	2019-11-24 12:24:45.690098+00	11	Biotechnology	3		7	1
132	2019-11-24 12:24:45.703099+00	10	Civil Engineering	3		7	1
133	2019-11-24 12:24:45.715301+00	9	Metallurgical and Materials Engineering	3		7	1
134	2019-11-24 12:24:45.728368+00	8	Applied Mathematics	3		7	1
135	2019-11-24 12:24:45.740847+00	7	Mechanical Engineering	3		7	1
136	2019-11-24 12:24:45.753659+00	6	Computer Science and Engineering	3		7	1
137	2019-11-24 12:24:45.765918+00	5	Polymer Science And Engineering	3		7	1
138	2019-11-24 12:24:45.778933+00	4	Production and Industrial Engineering	3		7	1
139	2019-11-24 12:24:45.794905+00	3	Electronics and Communication Engineering	3		7	1
140	2019-11-24 12:24:45.807774+00	2	Chemical Engineering	3		7	1
141	2019-11-24 12:24:45.820362+00	1	Electrical Engineering	3		7	1
142	2019-11-24 12:25:54.937495+00	72	Water Resources Development and Management	3		7	1
143	2019-11-24 12:25:55.316912+00	71	Physics	3		7	1
144	2019-11-24 12:25:55.516329+00	70	Polymer and Process Engineering	3		7	1
145	2019-11-24 12:25:55.783961+00	69	Paper Technology	3		7	1
146	2019-11-24 12:25:55.972369+00	68	Metallurgical and Materials Engineering	3		7	1
147	2019-11-24 12:25:56.132009+00	67	Mechanical and Industrial Engineering	3		7	1
148	2019-11-24 12:25:56.311779+00	66	Mathematics	3		7	1
149	2019-11-24 12:25:56.51721+00	65	Management Studies	3		7	1
150	2019-11-24 12:25:56.705686+00	64	Hydrology	3		7	1
151	2019-11-24 12:25:56.877536+00	63	Humanities and Social Sciences	3		7	1
152	2019-11-24 12:25:57.173766+00	62	Electronics and Communication Engineering	3		7	1
153	2019-11-24 12:25:57.329031+00	61	Electrical Engineering	3		7	1
154	2019-11-24 12:25:57.646289+00	60	Earth Sciences	3		7	1
155	2019-11-24 12:25:57.797086+00	59	Earthquake	3		7	1
156	2019-11-24 12:25:57.939833+00	58	Computer Science and Engineering	3		7	1
157	2019-11-24 12:25:58.092144+00	57	Civil Engineering	3		7	1
158	2019-11-24 12:25:58.22709+00	56	Chemistry	3		7	1
159	2019-11-24 12:25:58.362757+00	55	Chemical Engineering	3		7	1
160	2019-11-24 12:25:58.505943+00	54	Biotechnology	3		7	1
161	2019-11-24 12:25:58.674344+00	53	Architecture and Planning	3		7	1
162	2019-11-24 12:25:58.817388+00	52	Applied Science and Engineering	3		7	1
163	2019-11-24 12:25:58.969347+00	51	Hydro and Renewable Energy	3		7	1
164	2019-11-24 13:07:46.348197+00	663	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
165	2019-11-24 13:07:46.441522+00	662	SEMINAR	3		8	1
166	2019-11-24 13:07:46.453867+00	661	On Farm Development	3		8	1
167	2019-11-24 13:07:46.466845+00	660	Principles and Practices of Irrigation	3		8	1
168	2019-11-24 13:07:46.479344+00	659	Design of Irrigation Structures and Drainage Works	3		8	1
169	2019-11-24 13:07:46.492059+00	658	Construction Planning and Management	3		8	1
170	2019-11-24 13:07:46.517504+00	657	Design of Hydro Mechanical Equipment	3		8	1
171	2019-11-24 13:07:46.529896+00	656	Power System Protection Application	3		8	1
172	2019-11-24 13:07:46.542834+00	655	Hydropower System Planning	3		8	1
173	2019-11-24 13:07:46.555145+00	654	Hydro Generating Equipment	3		8	1
174	2019-11-24 13:07:46.56808+00	653	Applied Hydrology	3		8	1
175	2019-11-24 13:07:46.580466+00	652	Water Resources Planning and Management	3		8	1
176	2019-11-24 13:07:46.593604+00	651	Design of Water Resources Structures	3		8	1
177	2019-11-24 13:07:46.605729+00	650	System Design Techniques	3		8	1
178	2019-11-24 13:07:46.700837+00	649	MATHEMATICAL AND COMPUTATIONAL TECHNIQUES	3		8	1
179	2019-11-24 13:07:46.712877+00	648	Experimental Techniques	3		8	1
180	2019-11-24 13:07:46.726566+00	647	Laboratory Work in Photonics	3		8	1
181	2019-11-24 13:07:46.739038+00	646	Semiconductor Device Physics	3		8	1
182	2019-11-24 13:07:46.751928+00	645	Computational Techniques and Programming	3		8	1
183	2019-11-24 13:07:46.764765+00	644	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
184	2019-11-24 13:07:46.777338+00	643	SEMINAR	3		8	1
185	2019-11-24 13:07:46.790028+00	642	SEMINAR	3		8	1
186	2019-11-24 13:07:46.802452+00	641	Numerical Analysis & Computer Programming	3		8	1
187	2019-11-24 13:07:46.815704+00	640	Semiconductor Photonics	3		8	1
188	2019-11-24 13:07:46.827768+00	639	Quantum Theory of Solids	3		8	1
189	2019-11-24 13:07:46.840715+00	638	A Primer in Quantum Field Theory	3		8	1
190	2019-11-24 13:07:46.853353+00	637	Advanced Characterization Techniques	3		8	1
191	2019-11-24 13:07:46.865987+00	636	Advanced Nuclear Physics	3		8	1
192	2019-11-24 13:07:46.87836+00	635	Advanced Laser Physics	3		8	1
193	2019-11-24 13:07:46.891343+00	634	Advanced Condensed Matter Physics	3		8	1
194	2019-11-24 13:07:46.903994+00	633	DISSERTATION STAGE-I	3		8	1
195	2019-11-24 13:07:46.916754+00	632	SEMICONDUCTOR DEVICES AND APPLICATIONS	3		8	1
196	2019-11-24 13:07:46.929254+00	631	Classical Mechanics	3		8	1
197	2019-11-24 13:07:46.941912+00	630	Mathematical Physics	3		8	1
198	2019-11-24 13:07:46.954334+00	629	Quantum Mechanics – I	3		8	1
199	2019-11-24 13:07:46.967321+00	628	Training Seminar	3		8	1
200	2019-11-24 13:07:46.979773+00	627	B.Tech. Project	3		8	1
201	2019-11-24 13:07:46.992548+00	626	Nuclear Astrophysics	3		8	1
202	2019-11-24 13:07:47.005299+00	625	Techincal Communication	3		8	1
203	2019-11-24 13:07:47.017918+00	624	Laser & Photonics	3		8	1
204	2019-11-24 13:07:47.030355+00	623	Signals and Systems	3		8	1
205	2019-11-24 13:07:47.043207+00	622	Numerical Analysis and Computational Physics	3		8	1
206	2019-11-24 13:07:47.055512+00	621	Applied Instrumentation	3		8	1
207	2019-11-24 13:07:47.068788+00	620	Lab-based Project	3		8	1
208	2019-11-24 13:07:47.080932+00	619	Microprocessors and Peripheral Devices	3		8	1
209	2019-11-24 13:07:47.093794+00	618	Mathematical Physics	3		8	1
210	2019-11-24 13:07:47.106217+00	617	Mechanics and Relativity	3		8	1
211	2019-11-24 13:07:47.119147+00	616	Atomic Molecular and Laser Physics	3		8	1
212	2019-11-24 13:07:47.131561+00	615	Computer Programming	3		8	1
213	2019-11-24 13:07:47.144463+00	614	Introduction to Physical Science	3		8	1
214	2019-11-24 13:07:47.156832+00	613	Modern Physics	3		8	1
215	2019-11-24 13:07:47.16978+00	612	QUARK GLUON PLASMA & FINITE TEMPERATURE FIELD THEORY	3		8	1
216	2019-11-24 13:07:47.181992+00	611	Optical Electronics	3		8	1
217	2019-11-24 13:07:47.19487+00	610	Semiconductor Materials and Devices	3		8	1
218	2019-11-24 13:07:47.207032+00	609	Laboratory Work	3		8	1
219	2019-11-24 13:07:47.220232+00	608	Weather Forecasting	3		8	1
220	2019-11-24 13:07:47.232536+00	607	Advanced Atmospheric Physics	3		8	1
221	2019-11-24 13:07:47.2453+00	606	Physics of Earth’s Atmosphere	3		8	1
222	2019-11-24 13:07:47.25839+00	605	Classical Electrodynamics	3		8	1
223	2019-11-24 13:07:47.270738+00	604	Laboratory Work	3		8	1
224	2019-11-24 13:07:47.283881+00	603	QUANTUM INFORMATION AND COMPUTING	3		8	1
225	2019-11-24 13:07:47.296247+00	602	Plasma Physics and Applications	3		8	1
226	2019-11-24 13:07:47.309331+00	601	Applied Optics	3		8	1
227	2019-11-24 13:07:47.321721+00	600	Quantum Physics	3		8	1
228	2019-11-24 13:07:47.33464+00	599	Engineering Analysis Design	3		8	1
229	2019-11-24 13:07:47.346979+00	598	Quantum Mechanics and Statistical Mechanics	3		8	1
230	2019-11-24 13:07:47.359996+00	597	Electrodynamics and Optics	3		8	1
231	2019-11-24 13:07:47.372299+00	596	Applied Physics	3		8	1
232	2019-11-24 13:07:47.385357+00	595	Electromagnetic Field Theory	3		8	1
233	2019-11-24 13:07:47.397662+00	594	Mechanics	3		8	1
234	2019-11-24 13:07:47.410566+00	593	Advanced Atmospheric Physics	3		8	1
235	2019-11-24 13:07:47.426697+00	592	Elements of Nuclear and  Particle Physics	3		8	1
236	2019-11-24 13:07:47.439638+00	591	Physics of Earth’s Atmosphere	3		8	1
237	2019-11-24 13:07:47.451921+00	590	Computational Physics	3		8	1
238	2019-11-24 13:07:47.464848+00	589	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
239	2019-11-24 13:07:47.477201+00	588	SEMINAR	3		8	1
240	2019-11-24 13:07:47.490121+00	587	Converting Processes for Packaging	3		8	1
241	2019-11-24 13:07:47.502522+00	586	Printing Technology	3		8	1
242	2019-11-24 13:07:47.51556+00	585	Packaging Materials	3		8	1
243	2019-11-24 13:07:47.528025+00	584	Packaging Principles, Processes and Sustainability	3		8	1
244	2019-11-24 13:07:47.541069+00	583	Process Instrumentation  and Control	3		8	1
245	2019-11-24 13:07:47.553237+00	582	Advanced Numerical Methods and Statistics	3		8	1
246	2019-11-24 13:07:47.56607+00	581	Paper Proprieties and Stock Preparation	3		8	1
247	2019-11-24 13:07:47.578437+00	580	Chemical Recovery Process	3		8	1
248	2019-11-24 13:07:47.591459+00	579	Pulping	3		8	1
249	2019-11-24 13:07:47.604089+00	578	Printing Technology	3		8	1
250	2019-11-24 13:07:47.616783+00	577	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
251	2019-11-24 13:07:47.629352+00	576	SEMINAR	3		8	1
252	2019-11-24 13:07:47.642007+00	575	Numerical Methods in Manufacturing	3		8	1
253	2019-11-24 13:07:47.654836+00	574	Non-Traditional Machining Processes	3		8	1
254	2019-11-24 13:07:47.667425+00	573	Materials Management	3		8	1
255	2019-11-24 13:07:47.679687+00	572	Machine Tool Design and Numerical Control	3		8	1
256	2019-11-24 13:07:47.692915+00	571	Design for Manufacturability	3		8	1
257	2019-11-24 13:07:47.705294+00	570	Advanced Manufacturing Processes	3		8	1
258	2019-11-24 13:07:47.717931+00	569	Quality Management	3		8	1
259	2019-11-24 13:07:47.730422+00	568	Operations Management	3		8	1
260	2019-11-24 13:07:47.743242+00	567	Computer Aided Design	3		8	1
261	2019-11-24 13:07:47.755636+00	566	Advanced Mechanics of Solids	3		8	1
262	2019-11-24 13:07:47.768903+00	565	Dynamics of Mechanical Systems	3		8	1
263	2019-11-24 13:07:47.781012+00	564	Micro and Nano Scale Thermal Engineering	3		8	1
264	2019-11-24 13:07:47.794705+00	563	Hydro-dynamic Machines	3		8	1
265	2019-11-24 13:07:47.807151+00	562	Solar Energy	3		8	1
1388	2020-02-19 12:19:53.765557+00	23	dasasd	3		11	1
266	2019-11-24 13:07:47.819886+00	561	Advanced Heat Transfer	3		8	1
267	2019-11-24 13:07:47.832344+00	560	Advanced Fluid Mechanics	3		8	1
268	2019-11-24 13:07:47.845377+00	559	Advanced Thermodynamics	3		8	1
269	2019-11-24 13:07:47.857583+00	558	Modeling and Simulation	3		8	1
270	2019-11-24 13:07:47.870501+00	557	Modeling and Simulation	3		8	1
271	2019-11-24 13:07:47.883108+00	556	Robotics and Control	3		8	1
272	2019-11-24 13:07:47.895838+00	555	Training Seminar	3		8	1
273	2019-11-24 13:07:47.909039+00	554	B.Tech. Project 	3		8	1
274	2019-11-24 13:07:47.921592+00	553	Technical Communication	3		8	1
275	2019-11-24 13:07:47.934073+00	552	Refrigeration and Air-Conditioning	3		8	1
276	2019-11-24 13:07:47.946596+00	551	Industrial Management	3		8	1
277	2019-11-24 13:07:47.95949+00	550	Vibration  and Noise	3		8	1
278	2019-11-24 13:07:47.971995+00	549	Operations Research	3		8	1
279	2019-11-24 13:07:47.984429+00	548	Principles of Industrial Enigneering	3		8	1
280	2019-11-24 13:07:47.996664+00	547	Dynamics of Machines	3		8	1
281	2019-11-24 13:07:48.022749+00	546	THEORY OF MACHINES	3		8	1
282	2019-11-24 13:07:48.048461+00	545	Energy Conversion	3		8	1
283	2019-11-24 13:07:48.073134+00	544	THERMAL ENGINEERING	3		8	1
284	2019-11-24 13:07:48.099319+00	543	FLUID MECHANICS	3		8	1
285	2019-11-24 13:07:48.124542+00	542	MANUFACTURING TECHNOLOGY-II	3		8	1
286	2019-11-24 13:07:48.150437+00	541	KINEMATICS OF MACHINES	3		8	1
287	2019-11-24 13:07:48.392386+00	540	Non-Conventional Welding Processes	3		8	1
288	2019-11-24 13:07:49.15385+00	539	Smart Materials, Structures, and Devices	3		8	1
289	2019-11-24 13:07:49.179989+00	538	Advanced Mechanical Vibrations	3		8	1
290	2019-11-24 13:07:49.191964+00	537	Finite Element Methods	3		8	1
291	2019-11-24 13:07:49.204751+00	536	Computer Aided Mechanism Design	3		8	1
292	2019-11-24 13:07:49.230658+00	535	Computational Fluid Dynamics & Heat Transfer	3		8	1
293	2019-11-24 13:07:49.255487+00	534	Instrumentation and Experimental Methods	3		8	1
294	2019-11-24 13:07:49.269289+00	533	Power Plants	3		8	1
295	2019-11-24 13:07:49.295266+00	532	Work System Desing	3		8	1
296	2019-11-24 13:07:49.320172+00	531	Theory of Production Processes-II	3		8	1
297	2019-11-24 13:07:49.343651+00	530	Heat and Mass Transfer	3		8	1
298	2019-11-24 13:07:49.35634+00	529	Machine Design	3		8	1
299	2019-11-24 13:07:49.370684+00	528	 Lab Based Project 	3		8	1
300	2019-11-24 13:07:49.381958+00	527	ENGINEERING ANALYSIS AND DESIGN	3		8	1
301	2019-11-24 13:07:49.394233+00	526	Theory of Production Processes - I	3		8	1
302	2019-11-24 13:07:49.407183+00	525	Fluid Mechanics	3		8	1
303	2019-11-24 13:07:49.41955+00	524	Mechanical Engineering Drawing	3		8	1
304	2019-11-24 13:07:49.43292+00	523	Engineering Thermodynamics	3		8	1
305	2019-11-24 13:07:49.44531+00	522	Programming and Data Structure	3		8	1
306	2019-11-24 13:07:49.457975+00	521	Introduction to Production and Industrial Engineering	3		8	1
307	2019-11-24 13:07:49.470435+00	520	Introduction to Mechanical Engineering	3		8	1
308	2019-11-24 13:07:49.483753+00	519	Advanced Manufacturing Processes	3		8	1
309	2019-11-24 13:07:49.495893+00	518	ADVANCED NUMERICAL ANALYSIS	3		8	1
310	2019-11-24 13:07:49.508846+00	517	SELECTED TOPICS IN ANALYSIS	3		8	1
311	2019-11-24 13:07:49.521052+00	516	SEMINAR	3		8	1
312	2019-11-24 13:07:49.533962+00	515	Seminar	3		8	1
313	2019-11-24 13:07:49.546498+00	514	Orthogonal Polynomials and Special Functions	3		8	1
314	2019-11-24 13:07:49.559392+00	513	Financial Mathematics	3		8	1
315	2019-11-24 13:07:49.571917+00	512	Dynamical Systems	3		8	1
316	2019-11-24 13:07:49.584887+00	511	CONTROL THEORY	3		8	1
317	2019-11-24 13:07:49.597143+00	510	Coding Theory	3		8	1
318	2019-11-24 13:07:49.610122+00	509	Advanced Numerical Analysis	3		8	1
319	2019-11-24 13:07:49.622677+00	508	Mathematical Statistics	3		8	1
320	2019-11-24 13:07:49.635518+00	507	SEMINAR	3		8	1
321	2019-11-24 13:07:49.647767+00	506	OPERATIONS RESEARCH	3		8	1
322	2019-11-24 13:07:49.660743+00	505	FUNCTIONAL ANALYSIS	3		8	1
323	2019-11-24 13:07:49.673174+00	504	Functional Analysis	3		8	1
324	2019-11-24 13:07:49.686719+00	503	Tensors and Differential Geometry	3		8	1
325	2019-11-24 13:07:49.699015+00	502	Fluid Dynamics	3		8	1
326	2019-11-24 13:07:49.711812+00	501	Mathematics	3		8	1
327	2019-11-24 13:07:49.724936+00	500	SOFT COMPUTING	3		8	1
328	2019-11-24 13:07:49.737329+00	499	Complex Analysis	3		8	1
329	2019-11-24 13:07:49.750624+00	498	Computer Programming	3		8	1
330	2019-11-24 13:07:49.76259+00	497	Abstract Algebra	3		8	1
331	2019-11-24 13:07:49.775566+00	496	Topology	3		8	1
332	2019-11-24 13:07:49.78827+00	495	Real Analysis	3		8	1
333	2019-11-24 13:07:49.800943+00	494	Theory of Ordinary Differential Equations	3		8	1
334	2019-11-24 13:07:49.8133+00	493	Complex Analysis-II	3		8	1
335	2019-11-24 13:07:49.826111+00	492	Theory of Partial Differential Equations	3		8	1
336	2019-11-24 13:07:49.83875+00	491	Topology	3		8	1
337	2019-11-24 13:07:49.85149+00	490	Real Analysis-II	3		8	1
338	2019-11-24 13:07:49.87208+00	489	THEORY OF ORDINARY DIFFERENTIAL EQUATIONS	3		8	1
339	2019-11-24 13:07:49.885441+00	488	Technical Communication	3		8	1
340	2019-11-24 13:07:49.897526+00	487	MATHEMATICAL IMAGING TECHNOLOGY	3		8	1
341	2019-11-24 13:07:49.91039+00	486	Linear Programming	3		8	1
342	2019-11-24 13:07:49.922626+00	485	Mathematical Statistics	3		8	1
343	2019-11-24 13:07:49.935634+00	484	Abstract Algebra-I	3		8	1
344	2019-11-24 13:07:49.947962+00	483	DESIGN AND ANALYSIS OF ALGORITHMS	3		8	1
345	2019-11-24 13:07:49.96095+00	482	ORDINARY AND PARTIAL DIFFERENTIAL EQUATIONS	3		8	1
346	2019-11-24 13:07:49.973345+00	481	DISCRETE MATHEMATICS	3		8	1
347	2019-11-24 13:07:49.986224+00	480	Introduction to Computer Programming	3		8	1
348	2019-11-24 13:07:49.998666+00	479	Mathematics-I	3		8	1
349	2019-11-24 13:07:50.011539+00	478	Numerical Methods, Probability and Statistics	3		8	1
350	2019-11-24 13:07:50.023936+00	477	Optimization Techniques	3		8	1
351	2019-11-24 13:07:50.036906+00	476	Probability and Statistics	3		8	1
352	2019-11-24 13:07:50.049127+00	475	MEASURE THEORY	3		8	1
353	2019-11-24 13:07:50.06211+00	474	Statistical Inference	3		8	1
354	2019-11-24 13:07:50.074492+00	473	COMPLEX ANALYSIS-I	3		8	1
355	2019-11-24 13:07:50.087999+00	472	Real Analysis I	3		8	1
356	2019-11-24 13:07:50.099752+00	471	Introduction to Mathematical Sciences	3		8	1
357	2019-11-24 13:07:50.112749+00	470	Probability and Statistics	3		8	1
358	2019-11-24 13:07:50.125216+00	469	Mathematical Methods	3		8	1
359	2019-11-24 13:07:50.154683+00	468	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
360	2019-11-24 13:07:50.166777+00	467	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
361	2019-11-24 13:07:50.179774+00	466	SEMINAR	3		8	1
362	2019-11-24 13:07:50.19218+00	465	Watershed modeling and simulation	3		8	1
363	2019-11-24 13:07:50.205127+00	464	Soil and groundwater contamination modelling	3		8	1
364	2019-11-24 13:07:50.217531+00	463	Experimental hydrology	3		8	1
365	2019-11-24 13:07:50.230435+00	462	Remote sensing and GIS applications	3		8	1
366	2019-11-24 13:07:50.243355+00	461	Environmental quality	3		8	1
367	2019-11-24 13:07:50.255753+00	460	Watershed Behavior and Conservation Practices	3		8	1
368	2019-11-24 13:07:50.268779+00	459	Geophysical investigations	3		8	1
369	2019-11-24 13:07:50.281073+00	458	Groundwater hydrology	3		8	1
370	2019-11-24 13:07:50.293991+00	457	Stochastic hydrology	3		8	1
371	2019-11-24 13:07:50.306359+00	456	Irrigation and drainage engineering	3		8	1
372	2019-11-24 13:07:50.31929+00	455	Engineering Hydrology	3		8	1
373	2019-11-24 13:07:50.331962+00	454	RESEARCH METHODOLOGY IN LANGUAGE & LITERATURE	3		8	1
374	2019-11-24 13:07:50.344904+00	453	RESEARCH METHODOLOGY IN SOCIAL SCIENCES	3		8	1
375	2019-11-24 13:07:50.357318+00	452	UNDERSTANDING PERSONLALITY	3		8	1
376	2019-11-24 13:07:50.369971+00	451	SEMINAR	3		8	1
377	2019-11-24 13:07:50.382411+00	450	Advanced Topics in Growth Theory	3		8	1
378	2019-11-24 13:07:50.395013+00	449	Ecological Economics	3		8	1
379	2019-11-24 13:07:50.410807+00	448	Introduction to Research Methodology	3		8	1
380	2019-11-24 13:07:50.42367+00	447	Issues in Indian Economy	3		8	1
381	2019-11-24 13:07:50.436213+00	446	PUBLIC POLICY; THEORY AND PRACTICE	3		8	1
382	2019-11-24 13:07:50.449174+00	445	ADVANCED ECONOMETRICS	3		8	1
383	2019-11-24 13:07:50.461518+00	444	MONEY, BANKING AND FINANCIAL MARKETS	3		8	1
384	2019-11-24 13:07:50.474296+00	443	DEVELOPMENT ECONOMICS	3		8	1
385	2019-11-24 13:07:50.486886+00	442	MATHEMATICS FOR ECONOMISTS	3		8	1
386	2019-11-24 13:07:50.500206+00	441	MACROECONOMICS I	3		8	1
387	2019-11-24 13:07:50.51247+00	440	MICROECONOMICS I	3		8	1
388	2019-11-24 13:07:50.525447+00	439	HSN-01	3		8	1
389	2019-11-24 13:07:50.59511+00	438	UNDERSTANDING PERSONALITY	3		8	1
390	2019-11-24 13:07:50.608044+00	437	Sociology	3		8	1
391	2019-11-24 13:07:50.620559+00	436	Economics	3		8	1
392	2019-11-24 13:07:50.641472+00	435	Technical Communication	3		8	1
393	2019-11-24 13:07:50.653727+00	434	Society,Culture Built Environment	3		8	1
394	2019-11-24 13:07:50.666516+00	433	Introduction to Psychology	3		8	1
395	2019-11-24 13:07:50.679263+00	432	Communication Skills(Advance)	3		8	1
396	2019-11-24 13:07:50.692162+00	431	Communication Skills(Basic)	3		8	1
397	2019-11-24 13:07:50.704889+00	430	Technical Communication	3		8	1
398	2019-11-24 13:07:50.717456+00	429	Communication skills (Basic)	3		8	1
399	2019-11-24 13:07:50.729788+00	428	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
400	2019-11-24 13:07:50.742718+00	427	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
401	2019-11-24 13:07:50.755133+00	426	SEMINAR	3		8	1
402	2019-11-24 13:07:50.768243+00	425	Analog VLSI Circuit Design	3		8	1
403	2019-11-24 13:07:50.788675+00	424	Digital System Design	3		8	1
404	2019-11-24 13:07:50.801415+00	423	Simulation Lab-1	3		8	1
405	2019-11-24 13:07:50.813756+00	422	Microelectronics Lab-1	3		8	1
406	2019-11-24 13:07:50.826932+00	421	Digital VLSI Circuit Design	3		8	1
407	2019-11-24 13:07:50.839276+00	420	MOS Device Physics	3		8	1
408	2019-11-24 13:07:50.852987+00	419	Microwave and Millimeter Wave Circuits	3		8	1
409	2019-11-24 13:07:50.87355+00	418	Antenna Theory & Design	3		8	1
410	2019-11-24 13:07:51.27596+00	417	Advanced EMFT	3		8	1
411	2019-11-24 13:07:51.709029+00	416	Microwave Engineering	3		8	1
412	2019-11-24 13:07:51.732471+00	415	Microwave Lab	3		8	1
413	2019-11-24 13:07:51.759727+00	414	Telecommunication Networks	3		8	1
414	2019-11-24 13:07:51.778341+00	413	Information and Communication Theory	3		8	1
415	2019-11-24 13:07:51.79129+00	412	Digital Communication Systems	3		8	1
416	2019-11-24 13:07:51.803699+00	411	Laboratory	3		8	1
417	2019-11-24 13:07:51.817578+00	410	Training Seminar	3		8	1
418	2019-11-24 13:07:51.829562+00	409	B.Tech. Project 	3		8	1
419	2019-11-24 13:07:51.842689+00	408	Technical Communication	3		8	1
420	2019-11-24 13:07:51.871552+00	407	IC Application Laboratory	3		8	1
421	2019-11-24 13:07:51.884133+00	406	Fundamentals of Microelectronics	3		8	1
422	2019-11-24 13:07:51.896818+00	405	Microelectronic Devices,Technology and Circuits	3		8	1
423	2019-11-24 13:07:51.909655+00	404	ELECTRONICS NETWORK THEORY	3		8	1
424	2019-11-24 13:07:51.921899+00	403	SIGNALS AND SYSTEMS	3		8	1
425	2019-11-24 13:07:51.93506+00	402	Introduction to Electronics and Communication Engineering	3		8	1
426	2019-11-24 13:07:51.94725+00	401	SIGNALS AND SYSTEMS	3		8	1
427	2019-11-24 13:07:51.968279+00	400	RF System Design and Analysis	3		8	1
428	2019-11-24 13:07:51.981003+00	399	Radar Signal Processing	3		8	1
429	2019-11-24 13:07:51.993626+00	398	Fiber Optic Systems	3		8	1
430	2019-11-24 13:07:52.006084+00	397	Coding Theory and Applications	3		8	1
431	2019-11-24 13:07:52.019181+00	396	Microwave Engineering	3		8	1
432	2019-11-24 13:07:52.039547+00	395	Antenna Theory	3		8	1
433	2019-11-24 13:07:52.052662+00	394	Communication Systems and Techniques	3		8	1
434	2019-11-24 13:07:52.07305+00	393	Digital Electronic Circuits Laboratory	3		8	1
435	2019-11-24 13:07:52.085976+00	392	Engineering Electromagnetics	3		8	1
436	2019-11-24 13:07:52.106553+00	391	Automatic Control Systems	3		8	1
437	2019-11-24 13:07:52.119448+00	390	Principles of Digital Communication	3		8	1
438	2019-11-24 13:07:52.131908+00	389	Fundamental of Electronics	3		8	1
439	2019-11-24 13:07:52.144816+00	388	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
440	2019-11-24 13:07:52.157269+00	387	SEMINAR	3		8	1
441	2019-11-24 13:07:52.170019+00	386	Modeling and Simulation	3		8	1
442	2019-11-24 13:07:52.183324+00	385	Introduction to Robotics	3		8	1
443	2019-11-24 13:07:52.203883+00	384	Smart Grid	3		8	1
444	2019-11-24 13:07:52.216694+00	383	Power System Planning	3		8	1
445	2019-11-24 13:07:52.229202+00	382	Enhanced Power Quality AC-DC Converters	3		8	1
446	2019-11-24 13:07:52.249951+00	381	Advances in Signal and Image Processing	3		8	1
447	2019-11-24 13:07:52.262382+00	380	Advanced System Engineering	3		8	1
448	2019-11-24 13:07:52.275268+00	379	Intelligent Control Techniques	3		8	1
449	2019-11-24 13:07:52.287721+00	378	Advanced Linear Control Systems	3		8	1
450	2019-11-24 13:07:52.300846+00	377	EHV AC Transmission Systems	3		8	1
451	2019-11-24 13:07:52.313114+00	376	Distribution System Analysis and Operation	3		8	1
452	2019-11-24 13:07:52.32594+00	375	Power System Operation and Control	3		8	1
453	2019-11-24 13:07:52.346685+00	374	Computer Aided Power System Analysis	3		8	1
454	2019-11-24 13:07:52.367814+00	373	Advanced Electric Drives	3		8	1
455	2019-11-24 13:07:52.388396+00	372	Analysis of Electrical Machines	3		8	1
456	2019-11-24 13:07:52.401169+00	371	Advanced Power Electronics	3		8	1
457	2019-11-24 13:07:52.413269+00	370	Biomedical Instrumentation	3		8	1
458	2019-11-24 13:07:52.426347+00	369	Digital Signal and Image Processing	3		8	1
459	2019-11-24 13:07:52.438941+00	368	Advanced Industrial and Electronic Instrumentation	3		8	1
460	2019-11-24 13:07:52.451837+00	367	Training Seminar	3		8	1
461	2019-11-24 13:07:52.464129+00	366	B.Tech. Project 	3		8	1
462	2019-11-24 13:07:52.476985+00	365	Technical Communication	3		8	1
463	2019-11-24 13:07:52.48943+00	364	Embedded Systems	3		8	1
464	2019-11-24 13:07:52.510481+00	363	Data Structures	3		8	1
465	2019-11-24 13:07:52.522578+00	362	Signals and Systems	3		8	1
466	2019-11-24 13:07:52.535545+00	361	Artificial Neural Networks 	3		8	1
467	2019-11-24 13:07:52.547727+00	360	Advanced Control Systems	3		8	1
468	2019-11-24 13:07:52.560721+00	359	Power Electronics	3		8	1
469	2019-11-24 13:07:52.573065+00	358	Power System Analysis & Control	3		8	1
470	2019-11-24 13:07:52.586183+00	357	ENGINEERING ANALYSIS AND DESIGN	3		8	1
471	2019-11-24 13:07:52.598469+00	356	DESIGN OF ELECTRONICS CIRCUITS	3		8	1
472	2019-11-24 13:07:52.611356+00	355	DIGITAL ELECTRONICS AND CIRCUITS	3		8	1
473	2019-11-24 13:07:52.623827+00	354	ELECTRICAL MACHINES-I	3		8	1
474	2019-11-24 13:07:52.637284+00	353	Programming in C++	3		8	1
475	2019-11-24 13:07:52.657751+00	352	Network Theory	3		8	1
476	2019-11-24 13:07:52.671742+00	351	Introduction to Electrical Engineering	3		8	1
477	2019-11-24 13:07:52.691882+00	350	Instrumentation laboratory	3		8	1
478	2019-11-24 13:07:52.705476+00	349	Electrical Science	3		8	1
479	2019-11-24 13:07:52.726114+00	348	SEMINAR	3		8	1
480	2019-11-24 13:07:52.738681+00	347	Plate Tectonics	3		8	1
481	2019-11-24 13:07:52.759382+00	346	Well Logging	3		8	1
482	2019-11-24 13:07:52.771988+00	345	Petroleum Geology	3		8	1
483	2019-11-24 13:07:52.785085+00	344	Engineering Geology	3		8	1
484	2019-11-24 13:07:52.805426+00	343	Indian Mineral Deposits	3		8	1
485	2019-11-24 13:07:52.818757+00	342	Isotope Geology	3		8	1
486	2019-11-24 13:07:52.839173+00	341	Seminar	3		8	1
487	2019-11-24 13:07:52.859816+00	340	ADVANCED SEISMIC PROSPECTING	3		8	1
488	2019-11-24 13:07:52.872192+00	339	DYNAMIC SYSTEMS IN EARTH SCIENCES	3		8	1
489	2019-11-24 13:07:52.88536+00	338	Global Environment	3		8	1
490	2019-11-24 13:07:52.905874+00	337	Micropaleontology and Paleoceanography	3		8	1
491	2019-11-24 13:07:52.918939+00	336	ISOTOPE GEOLOGY	3		8	1
492	2019-11-24 13:07:52.939211+00	335	Geophysical Prospecting	3		8	1
493	2019-11-24 13:07:52.952297+00	334	Sedimentology and Stratigraphy	3		8	1
494	2019-11-24 13:07:52.972871+00	333	Comprehensive Viva Voce	3		8	1
495	2019-11-24 13:07:52.985685+00	332	Structural Geology	3		8	1
496	2019-11-24 13:07:53.006189+00	331	Igneous Petrology	3		8	1
497	2019-11-24 13:07:53.019137+00	330	Geochemistry	3		8	1
498	2019-11-24 13:07:53.039645+00	329	Crystallography and Mineralogy	3		8	1
499	2019-11-24 13:07:53.052734+00	328	Numerical Techniques and Computer Programming	3		8	1
500	2019-11-24 13:07:53.064907+00	327	Comprehensive Viva Voce	3		8	1
501	2019-11-24 13:07:53.086148+00	326	Seminar-I	3		8	1
502	2019-11-24 13:07:53.098488+00	325	STRONG MOTION SEISMOGRAPH	3		8	1
503	2019-11-24 13:07:53.111573+00	324	Geophysical Well logging	3		8	1
504	2019-11-24 13:07:53.123839+00	323	Numerical Modelling in Geophysical 	3		8	1
505	2019-11-24 13:07:53.13665+00	322	PETROLEUM GEOLOGY	3		8	1
506	2019-11-24 13:07:53.148923+00	321	HYDROGEOLOGY	3		8	1
507	2019-11-24 13:07:53.162018+00	320	ENGINEERING GEOLOGY	3		8	1
508	2019-11-24 13:07:53.23166+00	319	PRINCIPLES OF GIS	3		8	1
509	2019-11-24 13:07:53.244551+00	318	PRINCIPLES OF REMOTE SENSING	3		8	1
510	2019-11-24 13:07:53.256996+00	317	Technical Communication	3		8	1
511	2019-11-24 13:07:53.269966+00	316	ROCK AND SOIL MECHANICS	3		8	1
512	2019-11-24 13:07:53.290421+00	315	Seismology	3		8	1
513	2019-11-24 13:07:53.303276+00	314	Gravity and Magnetic Prospecting	3		8	1
514	2019-11-24 13:07:53.315873+00	313	Economic Geology	3		8	1
515	2019-11-24 13:07:53.336987+00	312	Metamorphic Petrology	3		8	1
516	2019-11-24 13:07:53.357951+00	311	Structural Geology-II	3		8	1
517	2019-11-24 13:07:53.378595+00	310	GEOPHYSICAL PROSPECTING	3		8	1
518	2019-11-24 13:07:53.39152+00	309	FIELD THEORY	3		8	1
519	2019-11-24 13:07:53.403996+00	308	STRUCTURAL GEOLOGY-I	3		8	1
520	2019-11-24 13:07:53.425075+00	307	PALEONTOLOGY	3		8	1
521	2019-11-24 13:07:53.437654+00	306	BASIC PETROLOGY	3		8	1
522	2019-11-24 13:07:53.458532+00	305	Computer Programming	3		8	1
523	2019-11-24 13:07:53.471003+00	304	Introduction to Earth Sciences	3		8	1
524	2019-11-24 13:07:53.483666+00	303	Electrical Prospecting	3		8	1
525	2019-11-24 13:07:53.496194+00	302	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
526	2019-11-24 13:07:53.509165+00	301	SEMINAR	3		8	1
527	2019-11-24 13:07:53.521752+00	300	Principles of Seismology	3		8	1
528	2019-11-24 13:07:53.534841+00	299	Machine Foundation	3		8	1
529	2019-11-24 13:07:53.555285+00	298	Earthquake Resistant Design of Structures	3		8	1
530	2019-11-24 13:07:53.5761+00	297	Vulnerability and Risk Analysis	3		8	1
531	2019-11-24 13:07:53.591812+00	296	Seismological Modeling and Simulation	3		8	1
532	2019-11-24 13:07:53.604645+00	295	Seismic Hazard Assessment	3		8	1
533	2019-11-24 13:07:53.625608+00	294	Geotechnical Earthquake Engineering	3		8	1
534	2019-11-24 13:07:53.66994+00	663	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
535	2019-11-24 13:07:53.695347+00	293	Numerical Methods for Dynamic Systems	3		8	1
536	2019-11-24 13:07:53.789988+00	292	Finite Element Method	3		8	1
537	2019-11-24 13:07:53.823987+00	662	SEMINAR	3		8	1
538	2019-11-24 13:07:54.051371+00	291	Engineering Seismology	3		8	1
539	2019-11-24 13:07:54.267482+00	661	On Farm Development	3		8	1
540	2019-11-24 13:07:54.692875+00	290	Vibration of Elastic Media	3		8	1
542	2019-11-24 13:07:54.718291+00	289	Theory of Vibrations	3		8	1
544	2019-11-24 13:07:54.743676+00	288	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
546	2019-11-24 13:07:54.769186+00	287	SEMINAR	3		8	1
548	2019-11-24 13:07:54.794397+00	286	Advanced Topics in Software Engineering	3		8	1
550	2019-11-24 13:07:54.819696+00	285	Lab II (Project Lab)	3		8	1
552	2019-11-24 13:07:54.845303+00	284	Lab I (Programming Lab)	3		8	1
554	2019-11-24 13:07:54.870648+00	283	Advanced Computer Networks	3		8	1
556	2019-11-24 13:07:54.895576+00	282	Advanced Operating Systems	3		8	1
558	2019-11-24 13:07:54.921124+00	281	Advanced Algorithms	3		8	1
560	2019-11-24 13:07:54.946312+00	280	Training Seminar	3		8	1
562	2019-11-24 13:07:54.971608+00	279	B.Tech. Project 	3		8	1
564	2019-11-24 13:07:54.997088+00	278	Technical Communication	3		8	1
566	2019-11-24 13:07:55.022222+00	277	Computer Network Laboratory	3		8	1
568	2019-11-24 13:07:55.0478+00	276	Theory of Computation	3		8	1
570	2019-11-24 13:07:55.072918+00	275	Computer Network	3		8	1
572	2019-11-24 13:07:55.098291+00	274	DATA STRUCTURE LABORATORY	3		8	1
574	2019-11-24 13:07:55.123493+00	273	COMPUTER ARCHITECTURE AND MICROPROCESSORS	3		8	1
576	2019-11-24 13:07:55.149709+00	272	Fundamentals of Object Oriented Programming	3		8	1
578	2019-11-24 13:07:55.174812+00	271	Introduction to Computer Science and Engineering	3		8	1
580	2019-11-24 13:07:55.200463+00	270	Logic and Automated Reasoning	3		8	1
582	2019-11-24 13:07:55.225376+00	269	Data Mining and Warehousing	3		8	1
584	2019-11-24 13:07:55.250287+00	268	MACHINE LEARNING	3		8	1
586	2019-11-24 13:07:55.276166+00	267	ARTIFICIAL INTELLIGENCE	3		8	1
588	2019-11-24 13:07:55.30168+00	266	Compiler Design 	3		8	1
590	2019-11-24 13:07:55.326529+00	265	Data Base Management Systems	3		8	1
592	2019-11-24 13:07:55.351634+00	264	OBJECT ORIENTED ANALYSIS AND DESIGN	3		8	1
594	2019-11-24 13:07:55.376915+00	263	Data Structures	3		8	1
596	2019-11-24 13:07:55.402577+00	262	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
598	2019-11-24 13:07:55.427957+00	261	SEMINAR	3		8	1
600	2019-11-24 13:07:55.453835+00	260	Geoinformatics for Landuse  Surveys	3		8	1
602	2019-11-24 13:07:55.479339+00	259	Planning, Design and Construction of Rural Roads	3		8	1
604	2019-11-24 13:07:55.505299+00	258	Pavement Analysis and Design	3		8	1
606	2019-11-24 13:07:55.529718+00	257	Traffic Engineering and Modeling	3		8	1
608	2019-11-24 13:07:55.554978+00	256	Modeling, Simulation and Optimization	3		8	1
610	2019-11-24 13:07:55.58038+00	255	Free Surface Flows	3		8	1
612	2019-11-24 13:07:55.606028+00	254	Advanced Fluid Mechanics	3		8	1
614	2019-11-24 13:07:55.631023+00	253	Advanced Hydrology	3		8	1
616	2019-11-24 13:07:55.656409+00	252	Soil Dynamics and Machine Foundations	3		8	1
618	2019-11-24 13:07:55.68163+00	251	Engineering Behaviour of Rocks	3		8	1
620	2019-11-24 13:07:55.707146+00	250	Advanced Soil Mechanics	3		8	1
622	2019-11-24 13:07:55.732093+00	249	Advanced Numerical Analysis	3		8	1
624	2019-11-24 13:07:55.756982+00	248	FIELD SURVEY CAMP	3		8	1
626	2019-11-24 13:07:55.782606+00	247	Principles of Photogrammetry	3		8	1
628	2019-11-24 13:07:55.808256+00	246	Surveying Measurements and Adjustments	3		8	1
630	2019-11-24 13:07:55.833569+00	245	Environmental Hydraulics	3		8	1
632	2019-11-24 13:07:55.858865+00	244	Water Treatment	3		8	1
634	2019-11-24 13:07:55.884933+00	243	Environmental Modeling and Simulation	3		8	1
636	2019-11-24 13:07:55.910202+00	242	Training Seminar	3		8	1
638	2019-11-24 13:07:55.935433+00	241	Advanced Highway Engineering	3		8	1
640	2019-11-24 13:07:55.96095+00	240	Advanced Water and Wastewater Treatment	3		8	1
642	2019-11-24 13:07:55.986085+00	239	WATER RESOURCE ENGINEERING	3		8	1
644	2019-11-24 13:07:56.011415+00	238	B.Tech. Project 	3		8	1
646	2019-11-24 13:07:56.036778+00	237	Technical Communication	3		8	1
648	2019-11-24 13:07:56.062071+00	236	Design of Reinforced Concrete Elements	3		8	1
650	2019-11-24 13:07:56.087689+00	235	Soil Mechanicas	3		8	1
652	2019-11-24 13:07:56.112945+00	234	Theory of Structures	3		8	1
654	2019-11-24 13:07:56.137998+00	233	ENGINEERING GRAPHICS	3		8	1
656	2019-11-24 13:07:56.163286+00	232	Highway and Traffic Engineering	3		8	1
658	2019-11-24 13:07:56.189157+00	231	STRUCTURAL ANALYSIS-I	3		8	1
660	2019-11-24 13:07:56.213974+00	230	CHANNEL HYDRAULICS	3		8	1
662	2019-11-24 13:07:56.239298+00	229	GEOMATICS ENGINEERING-II	3		8	1
664	2019-11-24 13:07:56.264674+00	228	Urban Mass Transit Systems	3		8	1
666	2019-11-24 13:07:56.289851+00	227	Transportation Planning	3		8	1
668	2019-11-24 13:07:56.50192+00	226	Road Traffic Safety	3		8	1
670	2019-11-24 13:07:57.168564+00	225	Behaviour & Design of Steel Structures (Autumn)	3		8	1
672	2019-11-24 13:07:57.210624+00	224	Industrial and Hazardous Waste Management	3		8	1
674	2019-11-24 13:07:57.23599+00	223	Geometric Design	3		8	1
676	2019-11-24 13:07:57.261309+00	222	Finite Element Analysis	3		8	1
678	2019-11-24 13:07:57.287104+00	221	Structural Dynamics	3		8	1
680	2019-11-24 13:07:57.31242+00	220	Advanced Concrete Design	3		8	1
682	2019-11-24 13:07:57.33774+00	219	Continuum Mechanics	3		8	1
684	2019-11-24 13:07:57.363056+00	218	Matrix Structural Analysis	3		8	1
686	2019-11-24 13:07:57.388445+00	217	Geodesy and GPS Surveying	3		8	1
688	2019-11-24 13:07:57.413747+00	216	Remote Sensing and  Image Processing	3		8	1
690	2019-11-24 13:07:57.439016+00	215	Environmental Chemistry	3		8	1
692	2019-11-24 13:07:57.464337+00	214	Wastewater Treatment	3		8	1
694	2019-11-24 13:07:57.489744+00	213	Design of Steel Elements	3		8	1
696	2019-11-24 13:07:57.515222+00	212	Railway Engineering and Airport Planning	3		8	1
698	2019-11-24 13:07:57.540271+00	211	Design of Steel Elements	3		8	1
700	2019-11-24 13:07:57.565586+00	210	Waste Water Engineering	3		8	1
702	2019-11-24 13:07:57.590914+00	209	Geomatics Engineering – I	3		8	1
704	2019-11-24 13:07:57.616407+00	208	Introduction to Environmental Studies	3		8	1
706	2019-11-24 13:07:57.641549+00	207	Numerical Methods and Computer Programming	3		8	1
708	2019-11-24 13:07:57.667174+00	206	Solid Mechanics	3		8	1
710	2019-11-24 13:07:57.692426+00	205	Introduction to Civil Engineering	3		8	1
712	2019-11-24 13:07:57.717627+00	204	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
714	2019-11-24 13:07:57.742974+00	203	SEMINAR	3		8	1
716	2019-11-24 13:07:57.768488+00	202	Training Seminar	3		8	1
541	2019-11-24 13:07:54.705414+00	660	Principles and Practices of Irrigation	3		8	1
543	2019-11-24 13:07:54.730557+00	659	Design of Irrigation Structures and Drainage Works	3		8	1
545	2019-11-24 13:07:54.757147+00	658	Construction Planning and Management	3		8	1
547	2019-11-24 13:07:54.781515+00	657	Design of Hydro Mechanical Equipment	3		8	1
549	2019-11-24 13:07:54.806863+00	656	Power System Protection Application	3		8	1
551	2019-11-24 13:07:54.831964+00	655	Hydropower System Planning	3		8	1
553	2019-11-24 13:07:54.857563+00	654	Hydro Generating Equipment	3		8	1
555	2019-11-24 13:07:54.883062+00	653	Applied Hydrology	3		8	1
557	2019-11-24 13:07:54.908285+00	652	Water Resources Planning and Management	3		8	1
559	2019-11-24 13:07:54.933816+00	651	Design of Water Resources Structures	3		8	1
561	2019-11-24 13:07:54.958847+00	650	System Design Techniques	3		8	1
563	2019-11-24 13:07:54.984983+00	649	MATHEMATICAL AND COMPUTATIONAL TECHNIQUES	3		8	1
565	2019-11-24 13:07:55.009856+00	648	Experimental Techniques	3		8	1
567	2019-11-24 13:07:55.035171+00	647	Laboratory Work in Photonics	3		8	1
569	2019-11-24 13:07:55.060467+00	646	Semiconductor Device Physics	3		8	1
571	2019-11-24 13:07:55.08579+00	645	Computational Techniques and Programming	3		8	1
573	2019-11-24 13:07:55.111147+00	644	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
575	2019-11-24 13:07:55.137464+00	643	SEMINAR	3		8	1
577	2019-11-24 13:07:55.162422+00	642	SEMINAR	3		8	1
579	2019-11-24 13:07:55.187842+00	641	Numerical Analysis & Computer Programming	3		8	1
581	2019-11-24 13:07:55.213063+00	640	Semiconductor Photonics	3		8	1
583	2019-11-24 13:07:55.237941+00	639	Quantum Theory of Solids	3		8	1
585	2019-11-24 13:07:55.263092+00	638	A Primer in Quantum Field Theory	3		8	1
587	2019-11-24 13:07:55.289177+00	637	Advanced Characterization Techniques	3		8	1
589	2019-11-24 13:07:55.314045+00	636	Advanced Nuclear Physics	3		8	1
591	2019-11-24 13:07:55.339152+00	635	Advanced Laser Physics	3		8	1
593	2019-11-24 13:07:55.364668+00	634	Advanced Condensed Matter Physics	3		8	1
595	2019-11-24 13:07:55.390412+00	633	DISSERTATION STAGE-I	3		8	1
597	2019-11-24 13:07:55.416127+00	632	SEMICONDUCTOR DEVICES AND APPLICATIONS	3		8	1
599	2019-11-24 13:07:55.440928+00	631	Classical Mechanics	3		8	1
601	2019-11-24 13:07:55.466165+00	630	Mathematical Physics	3		8	1
603	2019-11-24 13:07:55.491474+00	629	Quantum Mechanics – I	3		8	1
605	2019-11-24 13:07:55.516737+00	628	Training Seminar	3		8	1
607	2019-11-24 13:07:55.5421+00	627	B.Tech. Project	3		8	1
609	2019-11-24 13:07:55.567822+00	626	Nuclear Astrophysics	3		8	1
611	2019-11-24 13:07:55.592834+00	625	Techincal Communication	3		8	1
613	2019-11-24 13:07:55.618559+00	624	Laser & Photonics	3		8	1
615	2019-11-24 13:07:55.643539+00	623	Signals and Systems	3		8	1
617	2019-11-24 13:07:55.668884+00	622	Numerical Analysis and Computational Physics	3		8	1
619	2019-11-24 13:07:55.694349+00	621	Applied Instrumentation	3		8	1
621	2019-11-24 13:07:55.719364+00	620	Lab-based Project	3		8	1
623	2019-11-24 13:07:55.7442+00	619	Microprocessors and Peripheral Devices	3		8	1
625	2019-11-24 13:07:55.76971+00	618	Mathematical Physics	3		8	1
627	2019-11-24 13:07:55.795335+00	617	Mechanics and Relativity	3		8	1
629	2019-11-24 13:07:55.820981+00	616	Atomic Molecular and Laser Physics	3		8	1
631	2019-11-24 13:07:55.845928+00	615	Computer Programming	3		8	1
633	2019-11-24 13:07:55.871694+00	614	Introduction to Physical Science	3		8	1
635	2019-11-24 13:07:55.897314+00	613	Modern Physics	3		8	1
637	2019-11-24 13:07:55.923094+00	612	QUARK GLUON PLASMA & FINITE TEMPERATURE FIELD THEORY	3		8	1
639	2019-11-24 13:07:55.948419+00	611	Optical Electronics	3		8	1
641	2019-11-24 13:07:55.973706+00	610	Semiconductor Materials and Devices	3		8	1
643	2019-11-24 13:07:55.999205+00	609	Laboratory Work	3		8	1
645	2019-11-24 13:07:56.024376+00	608	Weather Forecasting	3		8	1
647	2019-11-24 13:07:56.04972+00	607	Advanced Atmospheric Physics	3		8	1
649	2019-11-24 13:07:56.075039+00	606	Physics of Earth’s Atmosphere	3		8	1
651	2019-11-24 13:07:56.100344+00	605	Classical Electrodynamics	3		8	1
653	2019-11-24 13:07:56.125692+00	604	Laboratory Work	3		8	1
655	2019-11-24 13:07:56.15115+00	603	QUANTUM INFORMATION AND COMPUTING	3		8	1
657	2019-11-24 13:07:56.176371+00	602	Plasma Physics and Applications	3		8	1
659	2019-11-24 13:07:56.201852+00	601	Applied Optics	3		8	1
661	2019-11-24 13:07:56.227103+00	600	Quantum Physics	3		8	1
663	2019-11-24 13:07:56.252374+00	599	Engineering Analysis Design	3		8	1
665	2019-11-24 13:07:56.27763+00	598	Quantum Mechanics and Statistical Mechanics	3		8	1
667	2019-11-24 13:07:56.302994+00	597	Electrodynamics and Optics	3		8	1
669	2019-11-24 13:07:57.150393+00	596	Applied Physics	3		8	1
671	2019-11-24 13:07:57.182029+00	595	Electromagnetic Field Theory	3		8	1
673	2019-11-24 13:07:57.223507+00	594	Mechanics	3		8	1
675	2019-11-24 13:07:57.249255+00	593	Advanced Atmospheric Physics	3		8	1
677	2019-11-24 13:07:57.274215+00	592	Elements of Nuclear and  Particle Physics	3		8	1
679	2019-11-24 13:07:57.29946+00	591	Physics of Earth’s Atmosphere	3		8	1
681	2019-11-24 13:07:57.325007+00	590	Computational Physics	3		8	1
683	2019-11-24 13:07:57.350457+00	589	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
685	2019-11-24 13:07:57.375475+00	588	SEMINAR	3		8	1
687	2019-11-24 13:07:57.400928+00	587	Converting Processes for Packaging	3		8	1
689	2019-11-24 13:07:57.426099+00	586	Printing Technology	3		8	1
691	2019-11-24 13:07:57.451596+00	585	Packaging Materials	3		8	1
693	2019-11-24 13:07:57.477086+00	584	Packaging Principles, Processes and Sustainability	3		8	1
695	2019-11-24 13:07:57.502084+00	583	Process Instrumentation  and Control	3		8	1
697	2019-11-24 13:07:57.527381+00	582	Advanced Numerical Methods and Statistics	3		8	1
699	2019-11-24 13:07:57.552732+00	581	Paper Proprieties and Stock Preparation	3		8	1
701	2019-11-24 13:07:57.578068+00	580	Chemical Recovery Process	3		8	1
703	2019-11-24 13:07:57.6037+00	579	Pulping	3		8	1
705	2019-11-24 13:07:57.628894+00	578	Printing Technology	3		8	1
707	2019-11-24 13:07:57.653824+00	577	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
709	2019-11-24 13:07:57.679306+00	576	SEMINAR	3		8	1
711	2019-11-24 13:07:57.704654+00	575	Numerical Methods in Manufacturing	3		8	1
713	2019-11-24 13:07:57.730009+00	574	Non-Traditional Machining Processes	3		8	1
715	2019-11-24 13:07:57.755247+00	573	Materials Management	3		8	1
717	2019-11-24 13:07:57.781067+00	572	Machine Tool Design and Numerical Control	3		8	1
719	2019-11-24 13:07:57.806394+00	571	Design for Manufacturability	3		8	1
721	2019-11-24 13:07:57.83186+00	570	Advanced Manufacturing Processes	3		8	1
723	2019-11-24 13:07:57.856866+00	569	Quality Management	3		8	1
725	2019-11-24 13:07:57.881773+00	568	Operations Management	3		8	1
727	2019-11-24 13:07:57.907157+00	567	Computer Aided Design	3		8	1
729	2019-11-24 13:07:57.933371+00	566	Advanced Mechanics of Solids	3		8	1
731	2019-11-24 13:07:57.9588+00	565	Dynamics of Mechanical Systems	3		8	1
733	2019-11-24 13:07:57.984276+00	564	Micro and Nano Scale Thermal Engineering	3		8	1
735	2019-11-24 13:07:58.009637+00	563	Hydro-dynamic Machines	3		8	1
737	2019-11-24 13:07:58.054568+00	562	Solar Energy	3		8	1
739	2019-11-24 13:07:58.085517+00	561	Advanced Heat Transfer	3		8	1
741	2019-11-24 13:07:58.11085+00	560	Advanced Fluid Mechanics	3		8	1
743	2019-11-24 13:07:58.136202+00	559	Advanced Thermodynamics	3		8	1
745	2019-11-24 13:07:58.161477+00	558	Modeling and Simulation	3		8	1
747	2019-11-24 13:07:58.187285+00	557	Modeling and Simulation	3		8	1
749	2019-11-24 13:07:58.212083+00	556	Robotics and Control	3		8	1
751	2019-11-24 13:07:58.237541+00	555	Training Seminar	3		8	1
753	2019-11-24 13:07:58.262743+00	554	B.Tech. Project 	3		8	1
755	2019-11-24 13:07:58.288288+00	553	Technical Communication	3		8	1
757	2019-11-24 13:07:58.313653+00	552	Refrigeration and Air-Conditioning	3		8	1
759	2019-11-24 13:07:58.338749+00	551	Industrial Management	3		8	1
761	2019-11-24 13:07:58.364042+00	550	Vibration  and Noise	3		8	1
763	2019-11-24 13:07:58.389468+00	549	Operations Research	3		8	1
765	2019-11-24 13:07:58.414619+00	548	Principles of Industrial Enigneering	3		8	1
767	2019-11-24 13:07:58.440163+00	547	Dynamics of Machines	3		8	1
769	2019-11-24 13:07:58.465458+00	546	THEORY OF MACHINES	3		8	1
771	2019-11-24 13:07:58.49057+00	545	Energy Conversion	3		8	1
773	2019-11-24 13:07:58.515925+00	544	THERMAL ENGINEERING	3		8	1
775	2019-11-24 13:07:58.541177+00	543	FLUID MECHANICS	3		8	1
777	2019-11-24 13:07:58.566499+00	542	MANUFACTURING TECHNOLOGY-II	3		8	1
779	2019-11-24 13:07:58.591813+00	541	KINEMATICS OF MACHINES	3		8	1
781	2019-11-24 13:07:58.617228+00	540	Non-Conventional Welding Processes	3		8	1
783	2019-11-24 13:07:58.642458+00	539	Smart Materials, Structures, and Devices	3		8	1
785	2019-11-24 13:07:58.668119+00	538	Advanced Mechanical Vibrations	3		8	1
787	2019-11-24 13:07:58.693852+00	537	Finite Element Methods	3		8	1
789	2019-11-24 13:07:58.719648+00	536	Computer Aided Mechanism Design	3		8	1
791	2019-11-24 13:07:58.745185+00	535	Computational Fluid Dynamics & Heat Transfer	3		8	1
793	2019-11-24 13:07:58.770611+00	534	Instrumentation and Experimental Methods	3		8	1
795	2019-11-24 13:07:58.999012+00	533	Power Plants	3		8	1
797	2019-11-24 13:07:59.575428+00	532	Work System Desing	3		8	1
799	2019-11-24 13:07:59.601018+00	531	Theory of Production Processes-II	3		8	1
801	2019-11-24 13:07:59.625635+00	530	Heat and Mass Transfer	3		8	1
803	2019-11-24 13:07:59.65129+00	529	Machine Design	3		8	1
805	2019-11-24 13:07:59.676505+00	528	 Lab Based Project 	3		8	1
807	2019-11-24 13:07:59.701738+00	527	ENGINEERING ANALYSIS AND DESIGN	3		8	1
809	2019-11-24 13:07:59.727162+00	526	Theory of Production Processes - I	3		8	1
811	2019-11-24 13:07:59.75235+00	525	Fluid Mechanics	3		8	1
813	2019-11-24 13:07:59.77759+00	524	Mechanical Engineering Drawing	3		8	1
815	2019-11-24 13:07:59.803215+00	523	Engineering Thermodynamics	3		8	1
817	2019-11-24 13:07:59.828205+00	522	Programming and Data Structure	3		8	1
819	2019-11-24 13:07:59.853468+00	521	Introduction to Production and Industrial Engineering	3		8	1
821	2019-11-24 13:07:59.87877+00	520	Introduction to Mechanical Engineering	3		8	1
823	2019-11-24 13:07:59.905647+00	519	Advanced Manufacturing Processes	3		8	1
825	2019-11-24 13:07:59.958036+00	518	ADVANCED NUMERICAL ANALYSIS	3		8	1
827	2019-11-24 13:07:59.979477+00	517	SELECTED TOPICS IN ANALYSIS	3		8	1
829	2019-11-24 13:08:00.005973+00	516	SEMINAR	3		8	1
831	2019-11-24 13:08:00.030024+00	515	Seminar	3		8	1
833	2019-11-24 13:08:00.055816+00	514	Orthogonal Polynomials and Special Functions	3		8	1
835	2019-11-24 13:08:00.081122+00	513	Financial Mathematics	3		8	1
837	2019-11-24 13:08:00.106639+00	512	Dynamical Systems	3		8	1
839	2019-11-24 13:08:00.132089+00	511	CONTROL THEORY	3		8	1
841	2019-11-24 13:08:00.15712+00	510	Coding Theory	3		8	1
843	2019-11-24 13:08:00.182265+00	509	Advanced Numerical Analysis	3		8	1
845	2019-11-24 13:08:00.207581+00	508	Mathematical Statistics	3		8	1
847	2019-11-24 13:08:00.233372+00	507	SEMINAR	3		8	1
849	2019-11-24 13:08:00.258306+00	506	OPERATIONS RESEARCH	3		8	1
851	2019-11-24 13:08:00.283419+00	505	FUNCTIONAL ANALYSIS	3		8	1
853	2019-11-24 13:08:00.309021+00	504	Functional Analysis	3		8	1
855	2019-11-24 13:08:00.334556+00	503	Tensors and Differential Geometry	3		8	1
857	2019-11-24 13:08:00.359059+00	502	Fluid Dynamics	3		8	1
859	2019-11-24 13:08:00.384649+00	501	Mathematics	3		8	1
861	2019-11-24 13:08:00.409844+00	500	SOFT COMPUTING	3		8	1
863	2019-11-24 13:08:00.435534+00	499	Complex Analysis	3		8	1
865	2019-11-24 13:08:00.461131+00	498	Computer Programming	3		8	1
867	2019-11-24 13:08:00.486439+00	497	Abstract Algebra	3		8	1
869	2019-11-24 13:08:00.512034+00	496	Topology	3		8	1
871	2019-11-24 13:08:00.537507+00	495	Real Analysis	3		8	1
873	2019-11-24 13:08:00.562611+00	494	Theory of Ordinary Differential Equations	3		8	1
875	2019-11-24 13:08:00.588031+00	493	Complex Analysis-II	3		8	1
877	2019-11-24 13:08:00.613385+00	492	Theory of Partial Differential Equations	3		8	1
879	2019-11-24 13:08:00.638564+00	491	Topology	3		8	1
881	2019-11-24 13:08:00.664484+00	490	Real Analysis-II	3		8	1
883	2019-11-24 13:08:00.68986+00	489	THEORY OF ORDINARY DIFFERENTIAL EQUATIONS	3		8	1
885	2019-11-24 13:08:00.715046+00	488	Technical Communication	3		8	1
887	2019-11-24 13:08:00.74054+00	487	MATHEMATICAL IMAGING TECHNOLOGY	3		8	1
889	2019-11-24 13:08:00.766047+00	486	Linear Programming	3		8	1
891	2019-11-24 13:08:00.791264+00	485	Mathematical Statistics	3		8	1
893	2019-11-24 13:08:00.816858+00	484	Abstract Algebra-I	3		8	1
895	2019-11-24 13:08:00.849989+00	483	DESIGN AND ANALYSIS OF ALGORITHMS	3		8	1
897	2019-11-24 13:08:00.875273+00	482	ORDINARY AND PARTIAL DIFFERENTIAL EQUATIONS	3		8	1
899	2019-11-24 13:08:00.900988+00	481	DISCRETE MATHEMATICS	3		8	1
718	2019-11-24 13:07:57.79373+00	201	B.Tech. Project 	3		8	1
720	2019-11-24 13:07:57.818837+00	200	Technical Communication	3		8	1
722	2019-11-24 13:07:57.8442+00	199	Process Integration	3		8	1
724	2019-11-24 13:07:57.869103+00	198	Optimization of Chemical Enigneering Processes	3		8	1
726	2019-11-24 13:07:57.894334+00	197	Process Utilities and Safety 	3		8	1
728	2019-11-24 13:07:57.91974+00	196	Process Equipment Design*	3		8	1
730	2019-11-24 13:07:57.945678+00	195	Process Dynamics and Control	3		8	1
732	2019-11-24 13:07:57.971269+00	194	Fluid and Fluid Particle Mechanics	3		8	1
734	2019-11-24 13:07:57.996735+00	193	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
736	2019-11-24 13:07:58.022235+00	192	Chemical Technology	3		8	1
738	2019-11-24 13:07:58.072676+00	191	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
740	2019-11-24 13:07:58.098013+00	190	MECHANICAL OPERATION	3		8	1
742	2019-11-24 13:07:58.123245+00	189	HEAT TRANSFER	3		8	1
744	2019-11-24 13:07:58.148444+00	188	SEMINAR	3		8	1
746	2019-11-24 13:07:58.173877+00	187	COMPUTATIONAL FLUID DYNAMICS	3		8	1
748	2019-11-24 13:07:58.199482+00	186	Biochemical Engineering	3		8	1
750	2019-11-24 13:07:58.224826+00	185	Advanced Reaction Engineering	3		8	1
752	2019-11-24 13:07:58.250528+00	184	Advanced Transport Phenomena	3		8	1
754	2019-11-24 13:07:58.275684+00	183	Mathematical Methods in Chemical Engineering 	3		8	1
756	2019-11-24 13:07:58.30112+00	182	Waste to Energy	3		8	1
758	2019-11-24 13:07:58.326308+00	181	Polymer Physics and Rheology*	3		8	1
760	2019-11-24 13:07:58.351585+00	180	Fluidization Engineering	3		8	1
762	2019-11-24 13:07:58.376941+00	179	Computer Application in Chemical Engineering	3		8	1
764	2019-11-24 13:07:58.402316+00	178	Enginering Analysis and Process Modeling	3		8	1
766	2019-11-24 13:07:58.427542+00	177	Mass Transfer-II	3		8	1
768	2019-11-24 13:07:58.453136+00	176	Mass Transfer -I	3		8	1
770	2019-11-24 13:07:58.478161+00	175	Computer Programming and Numerical Methods	3		8	1
772	2019-11-24 13:07:58.503525+00	174	Material and Energy Balance	3		8	1
774	2019-11-24 13:07:58.528875+00	173	Introduction to Chemical  Engineering	3		8	1
776	2019-11-24 13:07:58.554547+00	172	Advanced Thermodynamics and Molecular Simulations	3		8	1
778	2019-11-24 13:07:58.579397+00	171	DISSERTATION STAGE I	3		8	1
780	2019-11-24 13:07:58.604885+00	170	SEMINAR	3		8	1
782	2019-11-24 13:07:58.6301+00	169	ADVANCED TRANSPORT PROCESS	3		8	1
784	2019-11-24 13:07:58.655453+00	168	RECOMBINANT DNA TECHNOLOGY	3		8	1
786	2019-11-24 13:07:58.68177+00	167	REACTION KINETICS AND REACTOR DESIGN	3		8	1
788	2019-11-24 13:07:58.706673+00	166	MICROBIOLOGY AND BIOCHEMISTRY	3		8	1
790	2019-11-24 13:07:58.732422+00	165	Chemical Genetics and Drug Discovery	3		8	1
792	2019-11-24 13:07:58.757377+00	164	Structural Biology	3		8	1
794	2019-11-24 13:07:58.783133+00	163	Genomics and Proteomics	3		8	1
796	2019-11-24 13:07:59.181958+00	162	Vaccine Development & Production	3		8	1
798	2019-11-24 13:07:59.587455+00	161	Cell & Tissue Culture Technology	3		8	1
800	2019-11-24 13:07:59.612813+00	160	Biotechnology Laboratory – III	3		8	1
802	2019-11-24 13:07:59.638094+00	159	Seminar	3		8	1
804	2019-11-24 13:07:59.663363+00	158	Genetic Engineering	3		8	1
806	2019-11-24 13:07:59.688737+00	157	Biophysical Techniques	3		8	1
808	2019-11-24 13:07:59.713985+00	156	DOWNSTREAM PROCESSING	3		8	1
810	2019-11-24 13:07:59.73942+00	155	BIOREACTION ENGINEERING 	3		8	1
812	2019-11-24 13:07:59.764714+00	154	Technical  Communication	3		8	1
814	2019-11-24 13:07:59.789941+00	153	Cell & Developmental Biology	3		8	1
816	2019-11-24 13:07:59.815262+00	152	Genetics & Molecular Biology	3		8	1
818	2019-11-24 13:07:59.840636+00	151	Applied Microbiology	3		8	1
820	2019-11-24 13:07:59.866184+00	150	Biotechnology Laboratory – I	3		8	1
822	2019-11-24 13:07:59.891252+00	149	Biochemistry	3		8	1
824	2019-11-24 13:07:59.94149+00	148	Training Seminar	3		8	1
826	2019-11-24 13:07:59.967597+00	147	Drug Designing	3		8	1
828	2019-11-24 13:07:59.991665+00	146	Protein Engineering	3		8	1
830	2019-11-24 13:08:00.017366+00	145	Genomics and Proteomics	3		8	1
832	2019-11-24 13:08:00.043327+00	144	B.Tech. Project 	3		8	1
834	2019-11-24 13:08:00.068857+00	143	Technical Communication	3		8	1
836	2019-11-24 13:08:00.094102+00	142	CELL AND TISSUE ENGINEERING	3		8	1
838	2019-11-24 13:08:00.119565+00	141	IMMUNOTECHNOLOGY	3		8	1
840	2019-11-24 13:08:00.144961+00	140	GENETICS AND MOLECULAR BIOLOGY	3		8	1
842	2019-11-24 13:08:00.170575+00	139	Computer Programming	3		8	1
844	2019-11-24 13:08:00.195252+00	138	Introduction to Biotechnology	3		8	1
846	2019-11-24 13:08:00.220552+00	137	Molecular Biophysics	3		8	1
848	2019-11-24 13:08:00.246016+00	136	Animal Biotechnology	3		8	1
850	2019-11-24 13:08:00.271094+00	135	Plant Biotechnology	3		8	1
852	2019-11-24 13:08:00.296492+00	134	Bioseparation  Engineering	3		8	1
854	2019-11-24 13:08:00.321727+00	133	Bioprocess Engineering	3		8	1
856	2019-11-24 13:08:00.346638+00	132	Chemical Kinetics and Reactor Design	3		8	1
858	2019-11-24 13:08:00.372489+00	131	BIOINFORMATICS	3		8	1
860	2019-11-24 13:08:00.397391+00	130	MICROBIOLOGY	3		8	1
862	2019-11-24 13:08:00.423024+00	129	Professional Training	3		8	1
864	2019-11-24 13:08:00.448738+00	128	Planning  Studio-III	3		8	1
866	2019-11-24 13:08:00.473738+00	127	DISSERTATION STAGE-I	3		8	1
868	2019-11-24 13:08:00.499173+00	126	Professional Training	3		8	1
870	2019-11-24 13:08:00.524424+00	125	Design Studio-III	3		8	1
872	2019-11-24 13:08:00.549901+00	124	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
874	2019-11-24 13:08:00.574965+00	123	Housing	3		8	1
876	2019-11-24 13:08:00.600762+00	122	Planning Theory and Techniques	3		8	1
878	2019-11-24 13:08:00.625666+00	121	Ecology and Sustainable Development	3		8	1
880	2019-11-24 13:08:00.650955+00	120	Infrastructure Planning	3		8	1
882	2019-11-24 13:08:00.677084+00	119	Socio Economics, Demography and Quantitative Techniques	3		8	1
884	2019-11-24 13:08:00.702245+00	118	Planning Studio-I	3		8	1
886	2019-11-24 13:08:00.727516+00	117	Computer Applications in Architecture	3		8	1
888	2019-11-24 13:08:00.752998+00	116	Advanced Building Technologies	3		8	1
890	2019-11-24 13:08:00.778228+00	115	Urban Design	3		8	1
892	2019-11-24 13:08:00.80356+00	114	Contemporary Architecture- Theories and Trends	3		8	1
894	2019-11-24 13:08:00.828975+00	113	Design Studio-I	3		8	1
896	2019-11-24 13:08:00.8622+00	112	Live Project/Studio/Seminar-II	3		8	1
898	2019-11-24 13:08:00.888228+00	111	Vastushastra	3		8	1
900	2019-11-24 13:08:00.91297+00	110	Hill Architecture	3		8	1
902	2019-11-24 13:08:00.938433+00	109	Urban  Planning	3		8	1
904	2019-11-24 13:08:00.963577+00	108	Thesis Project I	3		8	1
906	2019-11-24 13:08:00.989421+00	107	Architectural Design-VII	3		8	1
908	2019-11-24 13:08:01.015636+00	106	Live Project/ Studio/ Seminar-I	3		8	1
910	2019-11-24 13:08:01.040094+00	105	Ekistics 	3		8	1
912	2019-11-24 13:08:01.122855+00	104	Working Drawing	3		8	1
914	2019-11-24 13:08:01.14787+00	103	Sustainable Architecture	3		8	1
916	2019-11-24 13:08:01.173354+00	102	Urban Design	3		8	1
918	2019-11-24 13:08:01.198431+00	101	Architectural Design-VI	3		8	1
920	2019-11-24 13:08:01.224007+00	100	MODERN INDIAN ARCHITECTURE	3		8	1
922	2019-11-24 13:08:01.249822+00	99	Interior Design 	3		8	1
924	2019-11-24 13:08:01.27444+00	98	Computer Applications in Architecture	3		8	1
926	2019-11-24 13:08:01.60747+00	97	Building Construction-IV	3		8	1
928	2019-11-24 13:08:02.054652+00	96	Architectural Design-IV	3		8	1
930	2019-11-24 13:08:02.194271+00	95	MEASURED DRAWING CAMP	3		8	1
932	2019-11-24 13:08:02.219762+00	94	PRICIPLES OF ARCHITECTURE	3		8	1
934	2019-11-24 13:08:02.244909+00	93	STRUCTURE AND ARCHITECTURE	3		8	1
936	2019-11-24 13:08:02.27068+00	92	QUANTITY, PRICING AND SPECIFICATIONS	3		8	1
938	2019-11-24 13:08:02.29605+00	91	HISTORY OF ARCHITECTUTRE I	3		8	1
940	2019-11-24 13:08:02.32142+00	90	BUILDING CONSTRUCTION II	3		8	1
942	2019-11-24 13:08:02.346741+00	89	Architectural Design-III	3		8	1
944	2019-11-24 13:08:02.371922+00	88	ARCHITECTURAL DESIGN II	3		8	1
946	2019-11-24 13:08:02.397356+00	87	Basic Design and Creative Workshop I	3		8	1
948	2019-11-24 13:08:02.422658+00	86	Architectural Graphics I	3		8	1
950	2019-11-24 13:08:02.448099+00	85	Visual Art I	3		8	1
952	2019-11-24 13:08:02.485352+00	84	Introduction to Architecture	3		8	1
954	2019-11-24 13:08:02.509977+00	83	SEMINAR	3		8	1
956	2019-11-24 13:08:02.535474+00	82	Regional Planning	3		8	1
958	2019-11-24 13:08:02.561047+00	81	Planning Legislation and Governance	3		8	1
960	2019-11-24 13:08:02.586641+00	80	Modern World Architecture	3		8	1
962	2019-11-24 13:08:02.620038+00	79	SEMINAR	3		8	1
964	2019-11-24 13:08:02.645351+00	78	Advanced Characterization Techniques	3		8	1
901	2019-11-24 13:08:00.925815+00	480	Introduction to Computer Programming	3		8	1
903	2019-11-24 13:08:00.95169+00	479	Mathematics-I	3		8	1
905	2019-11-24 13:08:00.976522+00	478	Numerical Methods, Probability and Statistics	3		8	1
907	2019-11-24 13:08:01.001921+00	477	Optimization Techniques	3		8	1
909	2019-11-24 13:08:01.027173+00	476	Probability and Statistics	3		8	1
911	2019-11-24 13:08:01.052243+00	475	MEASURE THEORY	3		8	1
913	2019-11-24 13:08:01.134784+00	474	Statistical Inference	3		8	1
915	2019-11-24 13:08:01.160324+00	473	COMPLEX ANALYSIS-I	3		8	1
917	2019-11-24 13:08:01.185756+00	472	Real Analysis I	3		8	1
919	2019-11-24 13:08:01.210956+00	471	Introduction to Mathematical Sciences	3		8	1
921	2019-11-24 13:08:01.23676+00	470	Probability and Statistics	3		8	1
923	2019-11-24 13:08:01.261592+00	469	Mathematical Methods	3		8	1
925	2019-11-24 13:08:01.441161+00	468	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
927	2019-11-24 13:08:02.017536+00	467	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
929	2019-11-24 13:08:02.124324+00	466	SEMINAR	3		8	1
931	2019-11-24 13:08:02.207299+00	465	Watershed modeling and simulation	3		8	1
933	2019-11-24 13:08:02.23309+00	464	Soil and groundwater contamination modelling	3		8	1
935	2019-11-24 13:08:02.25782+00	463	Experimental hydrology	3		8	1
937	2019-11-24 13:08:02.28337+00	462	Remote sensing and GIS applications	3		8	1
939	2019-11-24 13:08:02.308429+00	461	Environmental quality	3		8	1
941	2019-11-24 13:08:02.333814+00	460	Watershed Behavior and Conservation Practices	3		8	1
943	2019-11-24 13:08:02.359278+00	459	Geophysical investigations	3		8	1
945	2019-11-24 13:08:02.384439+00	458	Groundwater hydrology	3		8	1
947	2019-11-24 13:08:02.409744+00	457	Stochastic hydrology	3		8	1
949	2019-11-24 13:08:02.435098+00	456	Irrigation and drainage engineering	3		8	1
951	2019-11-24 13:08:02.455979+00	455	Engineering Hydrology	3		8	1
953	2019-11-24 13:08:02.497123+00	454	RESEARCH METHODOLOGY IN LANGUAGE & LITERATURE	3		8	1
955	2019-11-24 13:08:02.522812+00	453	RESEARCH METHODOLOGY IN SOCIAL SCIENCES	3		8	1
957	2019-11-24 13:08:02.547773+00	452	UNDERSTANDING PERSONLALITY	3		8	1
959	2019-11-24 13:08:02.573384+00	451	SEMINAR	3		8	1
961	2019-11-24 13:08:02.608011+00	450	Advanced Topics in Growth Theory	3		8	1
963	2019-11-24 13:08:02.632739+00	449	Ecological Economics	3		8	1
965	2019-11-24 13:08:02.657618+00	448	Introduction to Research Methodology	3		8	1
966	2019-11-24 13:08:02.691196+00	447	Issues in Indian Economy	3		8	1
967	2019-11-24 13:08:02.709227+00	446	PUBLIC POLICY; THEORY AND PRACTICE	3		8	1
968	2019-11-24 13:08:02.726634+00	445	ADVANCED ECONOMETRICS	3		8	1
969	2019-11-24 13:08:02.737809+00	444	MONEY, BANKING AND FINANCIAL MARKETS	3		8	1
970	2019-11-24 13:08:02.749872+00	443	DEVELOPMENT ECONOMICS	3		8	1
971	2019-11-24 13:08:02.762279+00	442	MATHEMATICS FOR ECONOMISTS	3		8	1
972	2019-11-24 13:08:02.774723+00	441	MACROECONOMICS I	3		8	1
973	2019-11-24 13:08:02.800504+00	440	MICROECONOMICS I	3		8	1
974	2019-11-24 13:08:02.812962+00	439	HSN-01	3		8	1
975	2019-11-24 13:08:02.825781+00	438	UNDERSTANDING PERSONALITY	3		8	1
976	2019-11-24 13:08:02.838665+00	437	Sociology	3		8	1
977	2019-11-24 13:08:02.851325+00	436	Economics	3		8	1
978	2019-11-24 13:08:02.864822+00	435	Technical Communication	3		8	1
979	2019-11-24 13:08:02.877199+00	434	Society,Culture Built Environment	3		8	1
980	2019-11-24 13:08:02.890055+00	433	Introduction to Psychology	3		8	1
981	2019-11-24 13:08:02.902615+00	432	Communication Skills(Advance)	3		8	1
982	2019-11-24 13:08:02.915574+00	431	Communication Skills(Basic)	3		8	1
983	2019-11-24 13:08:02.927733+00	430	Technical Communication	3		8	1
984	2019-11-24 13:08:02.940862+00	429	Communication skills (Basic)	3		8	1
985	2019-11-24 13:08:02.953561+00	428	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
986	2019-11-24 13:08:02.966248+00	427	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
987	2019-11-24 13:08:02.978872+00	426	SEMINAR	3		8	1
988	2019-11-24 13:08:02.991499+00	425	Analog VLSI Circuit Design	3		8	1
989	2019-11-24 13:08:03.004722+00	424	Digital System Design	3		8	1
990	2019-11-24 13:08:03.017214+00	423	Simulation Lab-1	3		8	1
991	2019-11-24 13:08:03.029686+00	422	Microelectronics Lab-1	3		8	1
992	2019-11-24 13:08:03.046759+00	421	Digital VLSI Circuit Design	3		8	1
993	2019-11-24 13:08:03.072009+00	420	MOS Device Physics	3		8	1
994	2019-11-24 13:08:03.084759+00	419	Microwave and Millimeter Wave Circuits	3		8	1
995	2019-11-24 13:08:03.097383+00	418	Antenna Theory & Design	3		8	1
996	2019-11-24 13:08:03.109706+00	417	Advanced EMFT	3		8	1
997	2019-11-24 13:08:03.122641+00	416	Microwave Engineering	3		8	1
998	2019-11-24 13:08:03.134983+00	415	Microwave Lab	3		8	1
999	2019-11-24 13:08:03.148149+00	414	Telecommunication Networks	3		8	1
1000	2019-11-24 13:08:03.160403+00	413	Information and Communication Theory	3		8	1
1001	2019-11-24 13:08:03.173097+00	412	Digital Communication Systems	3		8	1
1002	2019-11-24 13:08:03.18557+00	411	Laboratory	3		8	1
1003	2019-11-24 13:08:03.198115+00	410	Training Seminar	3		8	1
1004	2019-11-24 13:08:03.21077+00	409	B.Tech. Project 	3		8	1
1005	2019-11-24 13:08:03.231997+00	408	Technical Communication	3		8	1
1006	2019-11-24 13:08:03.244286+00	407	IC Application Laboratory	3		8	1
1007	2019-11-24 13:08:03.256948+00	406	Fundamentals of Microelectronics	3		8	1
1008	2019-11-24 13:08:03.269839+00	405	Microelectronic Devices,Technology and Circuits	3		8	1
1009	2019-11-24 13:08:03.282293+00	404	ELECTRONICS NETWORK THEORY	3		8	1
1010	2019-11-24 13:08:03.294631+00	403	SIGNALS AND SYSTEMS	3		8	1
1011	2019-11-24 13:08:03.307544+00	402	Introduction to Electronics and Communication Engineering	3		8	1
1012	2019-11-24 13:08:03.320369+00	401	SIGNALS AND SYSTEMS	3		8	1
1013	2019-11-24 13:08:03.333216+00	400	RF System Design and Analysis	3		8	1
1014	2019-11-24 13:08:03.345213+00	399	Radar Signal Processing	3		8	1
1015	2019-11-24 13:08:03.35814+00	398	Fiber Optic Systems	3		8	1
1016	2019-11-24 13:08:03.370619+00	397	Coding Theory and Applications	3		8	1
1017	2019-11-24 13:08:03.383935+00	396	Microwave Engineering	3		8	1
1018	2019-11-24 13:08:03.395956+00	395	Antenna Theory	3		8	1
1019	2019-11-24 13:08:03.408979+00	394	Communication Systems and Techniques	3		8	1
1020	2019-11-24 13:08:03.421654+00	393	Digital Electronic Circuits Laboratory	3		8	1
1021	2019-11-24 13:08:03.434823+00	392	Engineering Electromagnetics	3		8	1
1022	2019-11-24 13:08:03.447438+00	391	Automatic Control Systems	3		8	1
1023	2019-11-24 13:08:03.459896+00	390	Principles of Digital Communication	3		8	1
1024	2019-11-24 13:08:03.472851+00	389	Fundamental of Electronics	3		8	1
1025	2019-11-24 13:08:03.485474+00	388	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1026	2019-11-24 13:08:03.498195+00	387	SEMINAR	3		8	1
1027	2019-11-24 13:08:03.510354+00	386	Modeling and Simulation	3		8	1
1028	2019-11-24 13:08:03.523454+00	385	Introduction to Robotics	3		8	1
1029	2019-11-24 13:08:03.543958+00	384	Smart Grid	3		8	1
1030	2019-11-24 13:08:03.557028+00	383	Power System Planning	3		8	1
1031	2019-11-24 13:08:03.569287+00	382	Enhanced Power Quality AC-DC Converters	3		8	1
1032	2019-11-24 13:08:03.582086+00	381	Advances in Signal and Image Processing	3		8	1
1033	2019-11-24 13:08:03.594662+00	380	Advanced System Engineering	3		8	1
1034	2019-11-24 13:08:03.608351+00	379	Intelligent Control Techniques	3		8	1
1035	2019-11-24 13:08:03.621037+00	378	Advanced Linear Control Systems	3		8	1
1036	2019-11-24 13:08:03.633771+00	377	EHV AC Transmission Systems	3		8	1
1037	2019-11-24 13:08:03.645933+00	376	Distribution System Analysis and Operation	3		8	1
1038	2019-11-24 13:08:03.658983+00	375	Power System Operation and Control	3		8	1
1039	2019-11-24 13:08:03.671303+00	374	Computer Aided Power System Analysis	3		8	1
1040	2019-11-24 13:08:03.684552+00	373	Advanced Electric Drives	3		8	1
1041	2019-11-24 13:08:03.696763+00	372	Analysis of Electrical Machines	3		8	1
1042	2019-11-24 13:08:03.709605+00	371	Advanced Power Electronics	3		8	1
1043	2019-11-24 13:08:03.721828+00	370	Biomedical Instrumentation	3		8	1
1044	2019-11-24 13:08:03.734805+00	369	Digital Signal and Image Processing	3		8	1
1045	2019-11-24 13:08:03.747192+00	368	Advanced Industrial and Electronic Instrumentation	3		8	1
1046	2019-11-24 13:08:03.760142+00	367	Training Seminar	3		8	1
1047	2019-11-24 13:08:03.772566+00	366	B.Tech. Project 	3		8	1
1048	2019-11-24 13:08:03.801897+00	365	Technical Communication	3		8	1
1049	2019-11-24 13:08:03.814219+00	364	Embedded Systems	3		8	1
1050	2019-11-24 13:08:03.827307+00	363	Data Structures	3		8	1
1051	2019-11-24 13:08:03.860713+00	362	Signals and Systems	3		8	1
1052	2019-11-24 13:08:04.068118+00	361	Artificial Neural Networks 	3		8	1
1053	2019-11-24 13:08:04.265941+00	360	Advanced Control Systems	3		8	1
1054	2019-11-24 13:08:04.685469+00	359	Power Electronics	3		8	1
1055	2019-11-24 13:08:04.698599+00	358	Power System Analysis & Control	3		8	1
1056	2019-11-24 13:08:04.710803+00	357	ENGINEERING ANALYSIS AND DESIGN	3		8	1
1057	2019-11-24 13:08:04.723807+00	356	DESIGN OF ELECTRONICS CIRCUITS	3		8	1
1058	2019-11-24 13:08:04.793367+00	355	DIGITAL ELECTRONICS AND CIRCUITS	3		8	1
1059	2019-11-24 13:08:04.806293+00	354	ELECTRICAL MACHINES-I	3		8	1
1060	2019-11-24 13:08:04.818748+00	353	Programming in C++	3		8	1
1061	2019-11-24 13:08:04.83178+00	352	Network Theory	3		8	1
1062	2019-11-24 13:08:04.844054+00	351	Introduction to Electrical Engineering	3		8	1
1063	2019-11-24 13:08:04.85695+00	350	Instrumentation laboratory	3		8	1
1064	2019-11-24 13:08:04.869568+00	349	Electrical Science	3		8	1
1065	2019-11-24 13:08:04.882486+00	348	SEMINAR	3		8	1
1066	2019-11-24 13:08:04.89464+00	347	Plate Tectonics	3		8	1
1067	2019-11-24 13:08:04.907869+00	346	Well Logging	3		8	1
1068	2019-11-24 13:08:04.920351+00	345	Petroleum Geology	3		8	1
1069	2019-11-24 13:08:04.933339+00	344	Engineering Geology	3		8	1
1070	2019-11-24 13:08:04.953414+00	343	Indian Mineral Deposits	3		8	1
1071	2019-11-24 13:08:04.96705+00	342	Isotope Geology	3		8	1
1072	2019-11-24 13:08:04.986496+00	341	Seminar	3		8	1
1073	2019-11-24 13:08:05.000373+00	340	ADVANCED SEISMIC PROSPECTING	3		8	1
1074	2019-11-24 13:08:05.012252+00	339	DYNAMIC SYSTEMS IN EARTH SCIENCES	3		8	1
1075	2019-11-24 13:08:05.025262+00	338	Global Environment	3		8	1
1076	2019-11-24 13:08:05.038345+00	337	Micropaleontology and Paleoceanography	3		8	1
1077	2019-11-24 13:08:05.05084+00	336	ISOTOPE GEOLOGY	3		8	1
1078	2019-11-24 13:08:05.071027+00	335	Geophysical Prospecting	3		8	1
1079	2019-11-24 13:08:05.08407+00	334	Sedimentology and Stratigraphy	3		8	1
1080	2019-11-24 13:08:05.096341+00	333	Comprehensive Viva Voce	3		8	1
1081	2019-11-24 13:08:05.109334+00	332	Structural Geology	3		8	1
1082	2019-11-24 13:08:05.121475+00	331	Igneous Petrology	3		8	1
1083	2019-11-24 13:08:05.134471+00	330	Geochemistry	3		8	1
1084	2019-11-24 13:08:05.146985+00	329	Crystallography and Mineralogy	3		8	1
1085	2019-11-24 13:08:05.159896+00	328	Numerical Techniques and Computer Programming	3		8	1
1086	2019-11-24 13:08:05.172292+00	327	Comprehensive Viva Voce	3		8	1
1087	2019-11-24 13:08:05.185157+00	326	Seminar-I	3		8	1
1088	2019-11-24 13:08:05.1975+00	325	STRONG MOTION SEISMOGRAPH	3		8	1
1089	2019-11-24 13:08:05.21058+00	324	Geophysical Well logging	3		8	1
1090	2019-11-24 13:08:05.223471+00	323	Numerical Modelling in Geophysical 	3		8	1
1091	2019-11-24 13:08:05.236041+00	322	PETROLEUM GEOLOGY	3		8	1
1092	2019-11-24 13:08:05.248782+00	321	HYDROGEOLOGY	3		8	1
1093	2019-11-24 13:08:05.261222+00	320	ENGINEERING GEOLOGY	3		8	1
1094	2019-11-24 13:08:05.274338+00	319	PRINCIPLES OF GIS	3		8	1
1095	2019-11-24 13:08:05.287053+00	318	PRINCIPLES OF REMOTE SENSING	3		8	1
1096	2019-11-24 13:08:05.299866+00	317	Technical Communication	3		8	1
1097	2019-11-24 13:08:05.311381+00	316	ROCK AND SOIL MECHANICS	3		8	1
1098	2019-11-24 13:08:05.324364+00	315	Seismology	3		8	1
1099	2019-11-24 13:08:05.337047+00	314	Gravity and Magnetic Prospecting	3		8	1
1100	2019-11-24 13:08:05.349741+00	313	Economic Geology	3		8	1
1101	2019-11-24 13:08:05.427739+00	312	Metamorphic Petrology	3		8	1
1102	2019-11-24 13:08:05.440705+00	311	Structural Geology-II	3		8	1
1103	2019-11-24 13:08:05.457002+00	310	GEOPHYSICAL PROSPECTING	3		8	1
1104	2019-11-24 13:08:05.470105+00	309	FIELD THEORY	3		8	1
1105	2019-11-24 13:08:05.48193+00	308	STRUCTURAL GEOLOGY-I	3		8	1
1106	2019-11-24 13:08:05.49485+00	307	PALEONTOLOGY	3		8	1
1107	2019-11-24 13:08:05.507334+00	306	BASIC PETROLOGY	3		8	1
1108	2019-11-24 13:08:05.520859+00	305	Computer Programming	3		8	1
1109	2019-11-24 13:08:05.533178+00	304	Introduction to Earth Sciences	3		8	1
1110	2019-11-24 13:08:05.545616+00	303	Electrical Prospecting	3		8	1
1111	2019-11-24 13:08:05.558121+00	302	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1112	2019-11-24 13:08:05.571132+00	301	SEMINAR	3		8	1
1113	2019-11-24 13:08:05.583705+00	300	Principles of Seismology	3		8	1
1114	2019-11-24 13:08:05.596291+00	299	Machine Foundation	3		8	1
1115	2019-11-24 13:08:05.608735+00	298	Earthquake Resistant Design of Structures	3		8	1
1116	2019-11-24 13:08:05.621752+00	297	Vulnerability and Risk Analysis	3		8	1
1117	2019-11-24 13:08:05.634008+00	296	Seismological Modeling and Simulation	3		8	1
1118	2019-11-24 13:08:05.646694+00	295	Seismic Hazard Assessment	3		8	1
1119	2019-11-24 13:08:05.659263+00	294	Geotechnical Earthquake Engineering	3		8	1
1120	2019-11-24 13:08:05.672194+00	293	Numerical Methods for Dynamic Systems	3		8	1
1121	2019-11-24 13:08:05.684929+00	292	Finite Element Method	3		8	1
1122	2019-11-24 13:08:05.697599+00	291	Engineering Seismology	3		8	1
1123	2019-11-24 13:08:05.709762+00	290	Vibration of Elastic Media	3		8	1
1124	2019-11-24 13:08:05.722938+00	289	Theory of Vibrations	3		8	1
1125	2019-11-24 13:08:05.735304+00	288	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1126	2019-11-24 13:08:05.748404+00	287	SEMINAR	3		8	1
1127	2019-11-24 13:08:05.761017+00	286	Advanced Topics in Software Engineering	3		8	1
1128	2019-11-24 13:08:05.773678+00	285	Lab II (Project Lab)	3		8	1
1129	2019-11-24 13:08:05.785878+00	284	Lab I (Programming Lab)	3		8	1
1130	2019-11-24 13:08:05.798815+00	283	Advanced Computer Networks	3		8	1
1131	2019-11-24 13:08:05.811397+00	282	Advanced Operating Systems	3		8	1
1132	2019-11-24 13:08:05.833376+00	281	Advanced Algorithms	3		8	1
1133	2019-11-24 13:08:05.845629+00	280	Training Seminar	3		8	1
1134	2019-11-24 13:08:05.858258+00	279	B.Tech. Project 	3		8	1
1135	2019-11-24 13:08:05.870671+00	278	Technical Communication	3		8	1
1136	2019-11-24 13:08:05.883624+00	277	Computer Network Laboratory	3		8	1
1137	2019-11-24 13:08:05.896011+00	276	Theory of Computation	3		8	1
1138	2019-11-24 13:08:05.909001+00	275	Computer Network	3		8	1
1139	2019-11-24 13:08:05.921483+00	274	DATA STRUCTURE LABORATORY	3		8	1
1140	2019-11-24 13:08:05.934415+00	273	COMPUTER ARCHITECTURE AND MICROPROCESSORS	3		8	1
1141	2019-11-24 13:08:05.947169+00	272	Fundamentals of Object Oriented Programming	3		8	1
1142	2019-11-24 13:08:05.959513+00	271	Introduction to Computer Science and Engineering	3		8	1
1143	2019-11-24 13:08:05.972442+00	270	Logic and Automated Reasoning	3		8	1
1144	2019-11-24 13:08:05.984811+00	269	Data Mining and Warehousing	3		8	1
1145	2019-11-24 13:08:05.997911+00	268	MACHINE LEARNING	3		8	1
1146	2019-11-24 13:08:06.010261+00	267	ARTIFICIAL INTELLIGENCE	3		8	1
1147	2019-11-24 13:08:06.023181+00	266	Compiler Design 	3		8	1
1148	2019-11-24 13:08:06.035389+00	265	Data Base Management Systems	3		8	1
1149	2019-11-24 13:08:06.048338+00	264	OBJECT ORIENTED ANALYSIS AND DESIGN	3		8	1
1150	2019-11-24 13:08:06.060891+00	263	Data Structures	3		8	1
1151	2019-11-24 13:08:06.07365+00	262	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1152	2019-11-24 13:08:06.086381+00	261	SEMINAR	3		8	1
1153	2019-11-24 13:08:06.099213+00	260	Geoinformatics for Landuse  Surveys	3		8	1
1154	2019-11-24 13:08:06.111475+00	259	Planning, Design and Construction of Rural Roads	3		8	1
1155	2019-11-24 13:08:06.124357+00	258	Pavement Analysis and Design	3		8	1
1156	2019-11-24 13:08:06.136893+00	257	Traffic Engineering and Modeling	3		8	1
1157	2019-11-24 13:08:06.149894+00	256	Modeling, Simulation and Optimization	3		8	1
1158	2019-11-24 13:08:06.162094+00	255	Free Surface Flows	3		8	1
1159	2019-11-24 13:08:06.175014+00	254	Advanced Fluid Mechanics	3		8	1
1160	2019-11-24 13:08:06.187699+00	253	Advanced Hydrology	3		8	1
1161	2019-11-24 13:08:06.200426+00	252	Soil Dynamics and Machine Foundations	3		8	1
1162	2019-11-24 13:08:06.212837+00	251	Engineering Behaviour of Rocks	3		8	1
1163	2019-11-24 13:08:06.225744+00	250	Advanced Soil Mechanics	3		8	1
1164	2019-11-24 13:08:06.238094+00	249	Advanced Numerical Analysis	3		8	1
1165	2019-11-24 13:08:06.251266+00	248	FIELD SURVEY CAMP	3		8	1
1166	2019-11-24 13:08:06.263581+00	247	Principles of Photogrammetry	3		8	1
1167	2019-11-24 13:08:06.276296+00	246	Surveying Measurements and Adjustments	3		8	1
1168	2019-11-24 13:08:06.288809+00	245	Environmental Hydraulics	3		8	1
1169	2019-11-24 13:08:06.301659+00	244	Water Treatment	3		8	1
1170	2019-11-24 13:08:06.314062+00	243	Environmental Modeling and Simulation	3		8	1
1171	2019-11-24 13:08:06.326805+00	242	Training Seminar	3		8	1
1172	2019-11-24 13:08:06.339366+00	241	Advanced Highway Engineering	3		8	1
1173	2019-11-24 13:08:06.352202+00	240	Advanced Water and Wastewater Treatment	3		8	1
1174	2019-11-24 13:08:06.364827+00	239	WATER RESOURCE ENGINEERING	3		8	1
1175	2019-11-24 13:08:06.377142+00	238	B.Tech. Project 	3		8	1
1176	2019-11-24 13:08:06.389451+00	237	Technical Communication	3		8	1
1177	2019-11-24 13:08:06.402295+00	236	Design of Reinforced Concrete Elements	3		8	1
1178	2019-11-24 13:08:06.415322+00	235	Soil Mechanicas	3		8	1
1179	2019-11-24 13:08:06.428102+00	234	Theory of Structures	3		8	1
1180	2019-11-24 13:08:06.44116+00	233	ENGINEERING GRAPHICS	3		8	1
1181	2019-11-24 13:08:06.453862+00	232	Highway and Traffic Engineering	3		8	1
1182	2019-11-24 13:08:06.64542+00	231	STRUCTURAL ANALYSIS-I	3		8	1
1183	2019-11-24 13:08:06.82784+00	230	CHANNEL HYDRAULICS	3		8	1
1184	2019-11-24 13:08:07.271047+00	229	GEOMATICS ENGINEERING-II	3		8	1
1185	2019-11-24 13:08:07.283862+00	228	Urban Mass Transit Systems	3		8	1
1186	2019-11-24 13:08:07.296185+00	227	Transportation Planning	3		8	1
1187	2019-11-24 13:08:07.308976+00	226	Road Traffic Safety	3		8	1
1188	2019-11-24 13:08:07.321567+00	225	Behaviour & Design of Steel Structures (Autumn)	3		8	1
1189	2019-11-24 13:08:07.334766+00	224	Industrial and Hazardous Waste Management	3		8	1
1190	2019-11-24 13:08:07.346944+00	223	Geometric Design	3		8	1
1191	2019-11-24 13:08:07.359887+00	222	Finite Element Analysis	3		8	1
1192	2019-11-24 13:08:07.372101+00	221	Structural Dynamics	3		8	1
1193	2019-11-24 13:08:07.38513+00	220	Advanced Concrete Design	3		8	1
1194	2019-11-24 13:08:07.397529+00	219	Continuum Mechanics	3		8	1
1195	2019-11-24 13:08:07.410523+00	218	Matrix Structural Analysis	3		8	1
1196	2019-11-24 13:08:07.422639+00	217	Geodesy and GPS Surveying	3		8	1
1197	2019-11-24 13:08:07.435335+00	216	Remote Sensing and  Image Processing	3		8	1
1198	2019-11-24 13:08:07.447549+00	215	Environmental Chemistry	3		8	1
1199	2019-11-24 13:08:07.46094+00	214	Wastewater Treatment	3		8	1
1200	2019-11-24 13:08:07.473162+00	213	Design of Steel Elements	3		8	1
1201	2019-11-24 13:08:07.485966+00	212	Railway Engineering and Airport Planning	3		8	1
1202	2019-11-24 13:08:07.498527+00	211	Design of Steel Elements	3		8	1
1203	2019-11-24 13:08:07.512319+00	210	Waste Water Engineering	3		8	1
1204	2019-11-24 13:08:07.524865+00	209	Geomatics Engineering – I	3		8	1
1205	2019-11-24 13:08:07.537823+00	208	Introduction to Environmental Studies	3		8	1
1206	2019-11-24 13:08:07.550765+00	207	Numerical Methods and Computer Programming	3		8	1
1207	2019-11-24 13:08:07.562874+00	206	Solid Mechanics	3		8	1
1208	2019-11-24 13:08:07.576047+00	205	Introduction to Civil Engineering	3		8	1
1209	2019-11-24 13:08:07.596542+00	204	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1210	2019-11-24 13:08:07.609467+00	203	SEMINAR	3		8	1
1211	2019-11-24 13:08:07.621831+00	202	Training Seminar	3		8	1
1212	2019-11-24 13:08:07.634921+00	201	B.Tech. Project 	3		8	1
1213	2019-11-24 13:08:07.64704+00	200	Technical Communication	3		8	1
1214	2019-11-24 13:08:07.660054+00	199	Process Integration	3		8	1
1215	2019-11-24 13:08:07.672184+00	198	Optimization of Chemical Enigneering Processes	3		8	1
1216	2019-11-24 13:08:07.68529+00	197	Process Utilities and Safety 	3		8	1
1217	2019-11-24 13:08:07.697815+00	196	Process Equipment Design*	3		8	1
1218	2019-11-24 13:08:07.710677+00	195	Process Dynamics and Control	3		8	1
1219	2019-11-24 13:08:07.723085+00	194	Fluid and Fluid Particle Mechanics	3		8	1
1220	2019-11-24 13:08:07.744176+00	193	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
1221	2019-11-24 13:08:07.764959+00	192	Chemical Technology	3		8	1
1222	2019-11-24 13:08:07.782597+00	191	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
1223	2019-11-24 13:08:07.846993+00	190	MECHANICAL OPERATION	3		8	1
1224	2019-11-24 13:08:07.91733+00	189	HEAT TRANSFER	3		8	1
1225	2019-11-24 13:08:07.929707+00	188	SEMINAR	3		8	1
1226	2019-11-24 13:08:08.00014+00	187	COMPUTATIONAL FLUID DYNAMICS	3		8	1
1227	2019-11-24 13:08:08.012565+00	186	Biochemical Engineering	3		8	1
1228	2019-11-24 13:08:08.02498+00	185	Advanced Reaction Engineering	3		8	1
1229	2019-11-24 13:08:08.03792+00	184	Advanced Transport Phenomena	3		8	1
1230	2019-11-24 13:08:08.073009+00	183	Mathematical Methods in Chemical Engineering 	3		8	1
1231	2019-11-24 13:08:08.084554+00	182	Waste to Energy	3		8	1
1232	2019-11-24 13:08:08.096824+00	181	Polymer Physics and Rheology*	3		8	1
1233	2019-11-24 13:08:08.109779+00	180	Fluidization Engineering	3		8	1
1234	2019-11-24 13:08:08.122155+00	179	Computer Application in Chemical Engineering	3		8	1
1235	2019-11-24 13:08:08.135005+00	178	Enginering Analysis and Process Modeling	3		8	1
1236	2019-11-24 13:08:08.147407+00	177	Mass Transfer-II	3		8	1
1237	2019-11-24 13:08:08.160383+00	176	Mass Transfer -I	3		8	1
1238	2019-11-24 13:08:08.172926+00	175	Computer Programming and Numerical Methods	3		8	1
1239	2019-11-24 13:08:08.201996+00	174	Material and Energy Balance	3		8	1
1240	2019-11-24 13:08:08.272136+00	173	Introduction to Chemical  Engineering	3		8	1
1241	2019-11-24 13:08:08.342307+00	172	Advanced Thermodynamics and Molecular Simulations	3		8	1
1242	2019-11-24 13:08:08.412651+00	171	DISSERTATION STAGE I	3		8	1
1243	2019-11-24 13:08:08.425033+00	170	SEMINAR	3		8	1
1244	2019-11-24 13:08:08.437937+00	169	ADVANCED TRANSPORT PROCESS	3		8	1
1245	2019-11-24 13:08:08.507009+00	168	RECOMBINANT DNA TECHNOLOGY	3		8	1
1246	2019-11-24 13:08:08.519884+00	167	REACTION KINETICS AND REACTOR DESIGN	3		8	1
1247	2019-11-24 13:08:08.532471+00	166	MICROBIOLOGY AND BIOCHEMISTRY	3		8	1
1248	2019-11-24 13:08:08.545649+00	165	Chemical Genetics and Drug Discovery	3		8	1
1249	2019-11-24 13:08:08.558166+00	164	Structural Biology	3		8	1
1250	2019-11-24 13:08:08.571258+00	163	Genomics and Proteomics	3		8	1
1251	2019-11-24 13:08:08.583609+00	162	Vaccine Development & Production	3		8	1
1252	2019-11-24 13:08:08.596313+00	161	Cell & Tissue Culture Technology	3		8	1
1253	2019-11-24 13:08:08.608915+00	160	Biotechnology Laboratory – III	3		8	1
1254	2019-11-24 13:08:08.621691+00	159	Seminar	3		8	1
1255	2019-11-24 13:08:08.637698+00	158	Genetic Engineering	3		8	1
1256	2019-11-24 13:08:08.650746+00	157	Biophysical Techniques	3		8	1
1257	2019-11-24 13:08:08.663005+00	156	DOWNSTREAM PROCESSING	3		8	1
1258	2019-11-24 13:08:08.675928+00	155	BIOREACTION ENGINEERING 	3		8	1
1259	2019-11-24 13:08:08.688367+00	154	Technical  Communication	3		8	1
1260	2019-11-24 13:08:08.701169+00	153	Cell & Developmental Biology	3		8	1
1261	2019-11-24 13:08:08.713637+00	152	Genetics & Molecular Biology	3		8	1
1262	2019-11-24 13:08:08.72665+00	151	Applied Microbiology	3		8	1
1263	2019-11-24 13:08:08.738908+00	150	Biotechnology Laboratory – I	3		8	1
1264	2019-11-24 13:08:08.75197+00	149	Biochemistry	3		8	1
1265	2019-11-24 13:08:08.764477+00	148	Training Seminar	3		8	1
1266	2019-11-24 13:08:08.777487+00	147	Drug Designing	3		8	1
1267	2019-11-24 13:08:08.78955+00	146	Protein Engineering	3		8	1
1268	2019-11-24 13:08:08.802613+00	145	Genomics and Proteomics	3		8	1
1269	2019-11-24 13:08:08.815034+00	144	B.Tech. Project 	3		8	1
1270	2019-11-24 13:08:08.828005+00	143	Technical Communication	3		8	1
1271	2019-11-24 13:08:08.840162+00	142	CELL AND TISSUE ENGINEERING	3		8	1
1272	2019-11-24 13:08:08.853341+00	141	IMMUNOTECHNOLOGY	3		8	1
1273	2019-11-24 13:08:08.865491+00	140	GENETICS AND MOLECULAR BIOLOGY	3		8	1
1274	2019-11-24 13:08:08.878405+00	139	Computer Programming	3		8	1
1275	2019-11-24 13:08:08.890835+00	138	Introduction to Biotechnology	3		8	1
1276	2019-11-24 13:08:08.903954+00	137	Molecular Biophysics	3		8	1
1277	2019-11-24 13:08:08.916225+00	136	Animal Biotechnology	3		8	1
1278	2019-11-24 13:08:08.937719+00	135	Plant Biotechnology	3		8	1
1279	2019-11-24 13:08:08.949664+00	134	Bioseparation  Engineering	3		8	1
1280	2019-11-24 13:08:08.962668+00	133	Bioprocess Engineering	3		8	1
1281	2019-11-24 13:08:08.974972+00	132	Chemical Kinetics and Reactor Design	3		8	1
1282	2019-11-24 13:08:08.98791+00	131	BIOINFORMATICS	3		8	1
1283	2019-11-24 13:08:09.000218+00	130	MICROBIOLOGY	3		8	1
1284	2019-11-24 13:08:09.022016+00	129	Professional Training	3		8	1
1285	2019-11-24 13:08:09.034392+00	128	Planning  Studio-III	3		8	1
1286	2019-11-24 13:08:09.047572+00	127	DISSERTATION STAGE-I	3		8	1
1287	2019-11-24 13:08:09.059941+00	126	Professional Training	3		8	1
1288	2019-11-24 13:08:09.072942+00	125	Design Studio-III	3		8	1
1289	2019-11-24 13:08:09.085329+00	124	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1290	2019-11-24 13:08:09.098188+00	123	Housing	3		8	1
1291	2019-11-24 13:08:09.110506+00	122	Planning Theory and Techniques	3		8	1
1292	2019-11-24 13:08:09.123549+00	121	Ecology and Sustainable Development	3		8	1
1293	2019-11-24 13:08:09.136462+00	120	Infrastructure Planning	3		8	1
1386	2020-02-19 12:19:53.74024+00	25	cmnzmcxz,	3		11	1
1294	2019-11-24 13:08:09.148896+00	119	Socio Economics, Demography and Quantitative Techniques	3		8	1
1295	2019-11-24 13:08:09.161782+00	118	Planning Studio-I	3		8	1
1296	2019-11-24 13:08:09.174142+00	117	Computer Applications in Architecture	3		8	1
1297	2019-11-24 13:08:09.187141+00	116	Advanced Building Technologies	3		8	1
1298	2019-11-24 13:08:09.222788+00	115	Urban Design	3		8	1
1299	2019-11-24 13:08:09.257102+00	114	Contemporary Architecture- Theories and Trends	3		8	1
1300	2019-11-24 13:08:09.280778+00	113	Design Studio-I	3		8	1
1301	2019-11-24 13:08:09.627571+00	112	Live Project/Studio/Seminar-II	3		8	1
1302	2019-11-24 13:08:10.045431+00	111	Vastushastra	3		8	1
1303	2019-11-24 13:08:10.115512+00	110	Hill Architecture	3		8	1
1304	2019-11-24 13:08:10.184901+00	109	Urban  Planning	3		8	1
1305	2019-11-24 13:08:10.221108+00	108	Thesis Project I	3		8	1
1306	2019-11-24 13:08:10.240537+00	107	Architectural Design-VII	3		8	1
1307	2019-11-24 13:08:10.25248+00	106	Live Project/ Studio/ Seminar-I	3		8	1
1308	2019-11-24 13:08:10.265411+00	105	Ekistics 	3		8	1
1309	2019-11-24 13:08:10.278274+00	104	Working Drawing	3		8	1
1310	2019-11-24 13:08:10.290916+00	103	Sustainable Architecture	3		8	1
1311	2019-11-24 13:08:10.32835+00	102	Urban Design	3		8	1
1312	2019-11-24 13:08:10.341063+00	101	Architectural Design-VI	3		8	1
1313	2019-11-24 13:08:10.353748+00	100	MODERN INDIAN ARCHITECTURE	3		8	1
1314	2019-11-24 13:08:10.366016+00	99	Interior Design 	3		8	1
1315	2019-11-24 13:08:10.395382+00	98	Computer Applications in Architecture	3		8	1
1316	2019-11-24 13:08:10.407945+00	97	Building Construction-IV	3		8	1
1317	2019-11-24 13:08:10.420985+00	96	Architectural Design-IV	3		8	1
1318	2019-11-24 13:08:10.43338+00	95	MEASURED DRAWING CAMP	3		8	1
1319	2019-11-24 13:08:10.446084+00	94	PRICIPLES OF ARCHITECTURE	3		8	1
1320	2019-11-24 13:08:10.458439+00	93	STRUCTURE AND ARCHITECTURE	3		8	1
1321	2019-11-24 13:08:10.471552+00	92	QUANTITY, PRICING AND SPECIFICATIONS	3		8	1
1322	2019-11-24 13:08:10.48394+00	91	HISTORY OF ARCHITECTUTRE I	3		8	1
1323	2019-11-24 13:08:10.496696+00	90	BUILDING CONSTRUCTION II	3		8	1
1324	2019-11-24 13:08:10.509316+00	89	Architectural Design-III	3		8	1
1325	2019-11-24 13:08:10.522098+00	88	ARCHITECTURAL DESIGN II	3		8	1
1326	2019-11-24 13:08:10.534554+00	87	Basic Design and Creative Workshop I	3		8	1
1327	2019-11-24 13:08:10.547507+00	86	Architectural Graphics I	3		8	1
1328	2019-11-24 13:08:10.559557+00	85	Visual Art I	3		8	1
1329	2019-11-24 13:08:10.572376+00	84	Introduction to Architecture	3		8	1
1330	2019-11-24 13:08:10.584672+00	83	SEMINAR	3		8	1
1331	2019-11-24 13:08:10.597299+00	82	Regional Planning	3		8	1
1332	2019-11-24 13:08:10.609656+00	81	Planning Legislation and Governance	3		8	1
1333	2019-11-24 13:08:10.622761+00	80	Modern World Architecture	3		8	1
1334	2019-11-24 13:08:10.63542+00	79	SEMINAR	3		8	1
1335	2019-11-24 13:08:10.648338+00	78	Advanced Characterization Techniques	3		8	1
1336	2019-11-24 13:08:41.54875+00	94	Water Resources Development and Management	3		7	1
1337	2019-11-24 13:08:41.972006+00	93	Physics	3		7	1
1338	2019-11-24 13:08:41.996545+00	92	Polymer and Process Engineering	3		7	1
1339	2019-11-24 13:08:42.039213+00	91	Paper Technology	3		7	1
1340	2019-11-24 13:08:42.051158+00	90	Metallurgical and Materials Engineering	3		7	1
1341	2019-11-24 13:08:42.062923+00	89	Mechanical and Industrial Engineering	3		7	1
1342	2019-11-24 13:08:42.07576+00	88	Mathematics	3		7	1
1343	2019-11-24 13:08:42.088499+00	87	Management Studies	3		7	1
1344	2019-11-24 13:08:42.101074+00	86	Hydrology	3		7	1
1345	2019-11-24 13:08:42.114043+00	85	Humanities and Social Sciences	3		7	1
1346	2019-11-24 13:08:42.139229+00	84	Electronics and Communication Engineering	3		7	1
1347	2019-11-24 13:08:42.152155+00	83	Electrical Engineering	3		7	1
1348	2019-11-24 13:08:42.165021+00	82	Earth Sciences	3		7	1
1349	2019-11-24 13:08:42.177501+00	81	Earthquake	3		7	1
1350	2019-11-24 13:08:42.189896+00	80	Computer Science and Engineering	3		7	1
1351	2019-11-24 13:08:42.203082+00	79	Civil Engineering	3		7	1
1352	2019-11-24 13:08:42.215442+00	78	Chemistry	3		7	1
1353	2019-11-24 13:08:42.229093+00	77	Chemical Engineering	3		7	1
1354	2019-11-24 13:08:42.24134+00	76	Biotechnology	3		7	1
1355	2019-11-24 13:08:42.254229+00	75	Architecture and Planning	3		7	1
1356	2019-11-24 13:08:42.266802+00	74	Applied Science and Engineering	3		7	1
1357	2019-11-24 13:08:42.279485+00	73	Hydro and Renewable Energy	3		7	1
1358	2019-11-24 13:48:10.657609+00	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1359	2019-11-24 13:48:16.406004+00	25	ECN-212 quiz 2 solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1360	2019-11-26 18:15:40.120774+00	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["finalized"]}}]	10	1
1361	2019-11-26 18:15:46.701918+00	25	ECN-212 quiz 2 solution.PDF	2	[{"changed": {"fields": ["finalized"]}}]	10	1
1362	2019-12-26 09:25:27.993648+00	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1363	2019-12-26 09:25:35.352011+00	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1364	2019-12-26 09:25:42.861594+00	25	ECN-212 quiz 2 solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1365	2019-12-28 09:29:01.392535+00	1	Ayan	1	[{"added": {}}]	12	1
1366	2019-12-28 09:39:58.228991+00	1	Ayan	2	[{"changed": {"fields": ["department"]}}]	12	1
1367	2019-12-28 10:02:21.365372+00	1	R.C.Hibberler	2	[{"changed": {"fields": ["filetype"]}}]	11	1
1368	2019-12-28 10:25:05.086939+00	2	Advik	1	[{"added": {}}]	12	1
1369	2020-01-22 16:55:09.879734+00	26	ECN-212 End term solution.PDF	2	[]	10	1
1370	2020-02-17 10:11:30.05166+00	1	Ayan	3		12	1
1371	2020-02-17 10:11:37.783429+00	2	Advik	3		12	1
1372	2020-02-17 10:12:39.419559+00	5	darkrider	3		12	1
1373	2020-02-17 18:16:42.689288+00	5	Tutorial 1	1	[{"added": {}}]	11	1
1374	2020-02-17 18:52:09.765697+00	5	Tutorial 1	3		11	1
1375	2020-02-17 19:03:21.018189+00	6	Tutorial 1	1	[{"added": {}}]	11	1
1376	2020-02-19 12:19:53.44127+00	35	mcdnms	3		11	1
1377	2020-02-19 12:19:53.614522+00	34	ddsfsd	3		11	1
1378	2020-02-19 12:19:53.626865+00	33	czxc	3		11	1
1379	2020-02-19 12:19:53.639017+00	32	saSAAD	3		11	1
1380	2020-02-19 12:19:53.651912+00	31	mflemflksd	3		11	1
1381	2020-02-19 12:19:53.677266+00	30	dsads	3		11	1
1382	2020-02-19 12:19:53.689651+00	29	dmsndkanskm	3		11	1
1383	2020-02-19 12:19:53.702549+00	28	msdlkadmlas	3		11	1
1384	2020-02-19 12:19:53.714902+00	27	mckldmslc	3		11	1
1385	2020-02-19 12:19:53.728112+00	26	cnancam	3		11	1
1389	2020-02-19 12:19:53.778647+00	22	djaksdnkjas	3		11	1
1390	2020-02-19 12:19:53.790839+00	21	ndkjadns	3		11	1
1391	2020-02-19 12:19:53.803719+00	20	 dmsa dmskd	3		11	1
1392	2020-02-19 12:19:53.816194+00	19	cjkdnk	3		11	1
1393	2020-02-19 12:19:53.829109+00	18	ncksad	3		11	1
1394	2020-02-19 12:19:53.841453+00	17	dsadas	3		11	1
1395	2020-02-19 12:19:53.854416+00	16	ncmznc,m	3		11	1
1396	2020-02-19 12:19:53.866808+00	15	fdfd	3		11	1
1397	2020-02-19 12:19:53.880535+00	14	tut 1	3		11	1
1398	2020-02-19 12:19:53.89209+00	13	book 1	3		11	1
1399	2020-02-19 12:19:54.01109+00	12	cdnms,d	3		11	1
1400	2020-02-19 12:19:54.02392+00	11	cnxm,zc	3		11	1
1401	2020-02-19 12:19:54.039887+00	10	nkldnks	3		11	1
1402	2020-02-19 12:19:54.052902+00	9	nkjsndakcj	3		11	1
1403	2020-02-19 12:19:54.065239+00	8	bjkdsbfc	3		11	1
1404	2020-02-19 12:19:54.078164+00	7	R.C.Hibberler	3		11	1
1405	2020-02-19 12:19:54.090569+00	6	Tutorial 1	3		11	1
1406	2020-02-19 12:20:09.936114+00	43	circuitverse.png	3		13	1
1407	2020-02-19 12:20:10.061328+00	42	blackclover.jpg	3		13	1
1408	2020-02-19 12:20:10.203331+00	41	circuitverse.png	3		13	1
1409	2020-02-19 12:20:10.347084+00	40	blackclover.jpg	3		13	1
1410	2020-02-19 12:20:10.498397+00	39	circuitverse.png	3		13	1
1411	2020-02-19 12:20:10.642258+00	38	blackclover.jpg	3		13	1
1412	2020-02-19 12:20:10.794014+00	37	circuitverse.png	3		13	1
1413	2020-02-19 12:20:10.937252+00	36	blackclover.jpg	3		13	1
1414	2020-02-19 12:20:11.080458+00	35	circuitverse.png	3		13	1
1415	2020-02-19 12:20:11.257625+00	34	blackclover.jpg	3		13	1
1416	2020-02-19 12:20:11.408973+00	33	circuitverse.png	3		13	1
1417	2020-02-19 12:20:11.569086+00	32	blackclover.jpg	3		13	1
1418	2020-02-19 12:20:11.712343+00	31	circuitverse.png	3		13	1
1419	2020-02-19 12:20:11.872773+00	30	blackclover.jpg	3		13	1
1420	2020-02-19 12:20:12.031894+00	29	deathnote.jpg	3		13	1
1421	2020-02-19 12:20:12.20853+00	28	circuitverse.png	3		13	1
1422	2020-02-19 12:20:12.367915+00	27	blackclover.jpg	3		13	1
1423	2020-02-19 12:20:12.50434+00	26	deathnote.jpg	3		13	1
1424	2020-02-19 12:20:12.51587+00	25	deathnote.jpg	3		13	1
1425	2020-02-19 12:20:12.528792+00	24	circuitverse.png	3		13	1
1426	2020-02-19 12:20:12.541587+00	23	blackclover.jpg	3		13	1
1427	2020-02-19 12:20:12.554141+00	22	circuitverse.png	3		13	1
1428	2020-02-19 12:20:12.566465+00	21	deathnote.jpg	3		13	1
1429	2020-02-19 12:20:12.579371+00	20	blackclover.jpg	3		13	1
1430	2020-02-19 12:20:12.592506+00	19	circuitverse.png	3		13	1
1431	2020-02-19 12:20:12.604697+00	18	deathparade.jpg	3		13	1
1432	2020-02-19 12:20:12.617113+00	17	circuitverse.png	3		13	1
1433	2020-02-19 12:20:12.629992+00	16	blackclover.jpg	3		13	1
1434	2020-02-19 12:20:12.643086+00	15	circuitverse.png	3		13	1
1435	2020-02-19 12:20:12.655742+00	14	blackclover.jpg	3		13	1
1436	2020-02-19 12:20:12.667703+00	13	circuitverse.png	3		13	1
1437	2020-02-19 12:20:12.680642+00	12	blackclover.jpg	3		13	1
1438	2020-02-19 12:20:12.693202+00	11	circuitverse.png	3		13	1
1439	2020-02-19 12:20:12.714066+00	10	blackclover.jpg	3		13	1
1440	2020-02-19 12:20:12.727058+00	9	circuitverse.png	3		13	1
1441	2020-02-19 12:20:12.739935+00	8	blackclover.jpg	3		13	1
1442	2020-02-19 12:20:12.752428+00	7	circuitverse.png	3		13	1
1443	2020-02-19 12:20:12.764757+00	6	deathparade.jpg	3		13	1
1444	2020-02-19 12:20:12.777788+00	5	Dororo.jpeg	3		13	1
1445	2020-02-19 12:20:12.790201+00	4	deathnote.jpg	3		13	1
1446	2020-02-19 12:20:12.802946+00	3	blackclover.jpg	3		13	1
1447	2020-02-19 12:20:12.815358+00	2	asdf	3		13	1
1448	2020-02-19 12:20:12.828374+00	1	asdf	3		13	1
1449	2020-02-19 13:45:46.455439+00	116	Water Resources Development and Management	3		7	1
1450	2020-02-19 13:45:46.741383+00	115	Physics	3		7	1
1451	2020-02-19 13:45:46.75346+00	114	Polymer and Process Engineering	3		7	1
1452	2020-02-19 13:45:46.766373+00	113	Paper Technology	3		7	1
1453	2020-02-19 13:45:46.779921+00	112	Metallurgical and Materials Engineering	3		7	1
1454	2020-02-19 13:45:46.791785+00	111	Mechanical and Industrial Engineering	3		7	1
1455	2020-02-19 13:45:46.804639+00	110	Mathematics	3		7	1
1456	2020-02-19 13:45:46.81704+00	109	Management Studies	3		7	1
1457	2020-02-19 13:45:46.830061+00	108	Hydrology	3		7	1
1458	2020-02-19 13:45:46.842492+00	107	Humanities and Social Sciences	3		7	1
1459	2020-02-19 13:45:46.920611+00	106	Electronics and Communication Engineering	3		7	1
1460	2020-02-19 13:45:46.990928+00	105	Electrical Engineering	3		7	1
1461	2020-02-19 13:45:47.003245+00	104	Earth Sciences	3		7	1
1462	2020-02-19 13:45:47.015963+00	103	Earthquake	3		7	1
1463	2020-02-19 13:45:47.029003+00	102	Computer Science and Engineering	3		7	1
1464	2020-02-19 13:45:47.041439+00	101	Civil Engineering	3		7	1
1465	2020-02-19 13:45:47.054544+00	100	Chemistry	3		7	1
1466	2020-02-19 13:45:47.066936+00	99	Chemical Engineering	3		7	1
1467	2020-02-19 13:45:47.080571+00	98	Biotechnology	3		7	1
1468	2020-02-19 13:45:47.092692+00	97	Architecture and Planning	3		7	1
1469	2020-02-19 13:45:47.105206+00	96	Applied Science and Engineering	3		7	1
1470	2020-02-19 13:45:47.175317+00	95	Hydro and Renewable Energy	3		7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	rest_api	department
8	rest_api	course
9	rest_api	file
10	users	user
11	users	upload
12	users	filerequest
13	users	courserequest
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-04-21 04:46:50.815834+00
2	auth	0001_initial	2020-04-21 04:46:51.267857+00
3	admin	0001_initial	2020-04-21 04:46:51.877263+00
4	admin	0002_logentry_remove_auto_add	2020-04-21 04:46:51.935797+00
5	admin	0003_logentry_add_action_flag_choices	2020-04-21 04:46:51.951519+00
6	contenttypes	0002_remove_content_type_name	2020-04-21 04:46:51.995498+00
7	auth	0002_alter_permission_name_max_length	2020-04-21 04:46:52.012435+00
8	auth	0003_alter_user_email_max_length	2020-04-21 04:46:52.032474+00
9	auth	0004_alter_user_username_opts	2020-04-21 04:46:52.054022+00
10	auth	0005_alter_user_last_login_null	2020-04-21 04:46:52.070341+00
11	auth	0006_require_contenttypes_0002	2020-04-21 04:46:52.080437+00
12	auth	0007_alter_validators_add_error_messages	2020-04-21 04:46:52.4582+00
13	auth	0008_alter_user_username_max_length	2020-04-21 04:46:52.487624+00
14	auth	0009_alter_user_last_name_max_length	2020-04-21 04:46:52.502443+00
15	auth	0010_alter_group_name_max_length	2020-04-21 04:46:52.522297+00
16	auth	0011_update_proxy_permissions	2020-04-21 04:46:52.542773+00
17	rest_api	0001_initial	2020-04-21 04:46:52.625661+00
18	rest_api	0002_department_url	2020-04-21 04:46:52.655064+00
19	rest_api	0003_course	2020-04-21 04:46:52.681877+00
20	rest_api	0004_auto_20190830_2153	2020-04-21 04:46:54.240855+00
21	rest_api	0005_file	2020-04-21 04:46:54.269148+00
22	rest_api	0006_auto_20191003_1214	2020-04-21 04:46:54.323049+00
23	rest_api	0007_auto_20191003_1215	2020-04-21 04:46:54.36131+00
24	rest_api	0008_auto_20191003_1224	2020-04-21 04:46:54.379424+00
25	rest_api	0009_file_file	2020-04-21 04:46:54.424263+00
26	rest_api	0010_auto_20191007_1553	2020-04-21 04:46:57.131314+00
27	rest_api	0011_auto_20191007_1556	2020-04-21 04:46:57.187674+00
28	rest_api	0012_auto_20191007_1610	2020-04-21 04:46:57.236327+00
29	rest_api	0013_auto_20191007_1710	2020-04-21 04:46:57.259631+00
30	rest_api	0014_auto_20191007_1749	2020-04-21 04:46:57.397688+00
31	rest_api	0015_auto_20191007_2136	2020-04-21 04:46:57.434335+00
32	rest_api	0016_auto_20191014_1632	2020-04-21 04:46:57.452871+00
33	rest_api	0017_auto_20191014_1711	2020-04-21 04:46:57.469895+00
34	rest_api	0018_auto_20191014_1712	2020-04-21 04:46:57.481056+00
35	rest_api	0019_auto_20191031_1024	2020-04-21 04:46:57.878797+00
36	rest_api	0020_file_size	2020-04-21 04:46:57.925868+00
37	rest_api	0021_file_fileext	2020-04-21 04:46:57.97637+00
38	rest_api	0022_auto_20191031_1122	2020-04-21 04:46:58.022838+00
39	rest_api	0023_auto_20191103_1613	2020-04-21 04:46:58.641662+00
40	rest_api	0024_auto_20191124_1223	2020-04-21 04:46:58.654608+00
41	rest_api	0025_auto_20191126_1724	2020-04-21 04:46:58.715034+00
42	rest_api	0026_auto_20191126_1730	2020-04-21 04:46:58.756393+00
43	rest_api	0027_file_finalized	2020-04-21 04:46:58.800435+00
44	rest_api	0019_auto_20191022_1439	2020-04-21 04:46:58.819634+00
45	rest_api	0028_merge_20191226_0724	2020-04-21 04:46:58.82587+00
46	rest_api	0029_auto_20191226_0924	2020-04-21 04:46:58.864999+00
47	rest_api	0030_upload_title	2020-04-21 04:46:59.09719+00
48	rest_api	0031_auto_20191226_1027	2020-04-21 04:46:59.123224+00
49	rest_api	0032_auto_20191228_0928	2020-04-21 04:46:59.13932+00
50	rest_api	0033_auto_20191228_0958	2020-04-21 04:46:59.153897+00
51	rest_api	0034_auto_20200127_1608	2020-04-21 04:46:59.193955+00
52	rest_api	0035_upload_filetype	2020-04-21 04:46:59.758784+00
53	rest_api	0036_remove_user_department	2020-04-21 04:46:59.78113+00
54	rest_api	0037_user_courses	2020-04-21 04:46:59.828929+00
55	rest_api	0038_request_date	2020-04-21 04:46:59.902852+00
56	rest_api	0039_upload_date	2020-04-21 04:46:59.962785+00
57	rest_api	0040_auto_20200218_1534	2020-04-21 04:46:59.997072+00
58	rest_api	0041_courserequest	2020-04-21 04:47:00.333629+00
59	rest_api	0042_courserequest_date	2020-04-21 04:47:00.393044+00
60	rest_api	0043_upload_status	2020-04-21 04:47:00.464266+00
61	rest_api	0044_auto_20200407_2005	2020-04-21 04:47:00.532229+00
62	sessions	0001_initial	2020-04-21 04:47:00.585126+00
63	users	0001_initial	2020-04-21 04:47:01.034612+00
66	rest_api	0045_auto_20200422_0506	2020-04-22 05:06:47.739848+00
67	rest_api	0046_auto_20200422_0520	2020-04-22 05:20:56.547614+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7o4m4gi683ngfbgtrd4boqdr3ymhrmpo	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-09-13 22:06:15.6475+00
6u927wty7bauw3hrgjf05m9v7ceinqrr	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-10-04 22:12:23.466624+00
kcornx24qad8lybhmkdzxut0fbo0v24p	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-10-21 15:38:28.988476+00
k5dxdl9enq2r5iskqquhmx20g0kmv8zz	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-11-05 14:41:19.106654+00
i48mahob9r8em13vx0kwo4trairt9hbn	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-12-08 12:08:22.046113+00
xxay5199jkuedf2qbirjlnlhp28h1205	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-12-08 18:57:52.415646+00
b5p11uvqhzv93cqbtspwj691qxc5bwbd	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-01-09 09:25:15.002822+00
vsktfn59wa7s4pg0jr1zgtovfgmbtyxu	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-02-05 16:54:26.954061+00
xob8htr6a71jnw7ustfknm0jt9urgpft	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-02-26 18:41:12.609634+00
ruvywij1q91vup5hpc8i6i45aqpi11je	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-04-12 07:51:41.423674+00
\.


--
-- Data for Name: rest_api_course; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.rest_api_course (id, title, department_id, code) FROM stdin;
1250	Advanced Characterization Techniques	118	AS-901
1251	SEMINAR	118	ASN-700
1252	Modern World Architecture	119	ARN-210
1253	Planning Legislation and Governance	119	ARN-661
1254	Regional Planning	119	ARN-676
1255	SEMINAR	119	ARN-700
1256	Introduction to Architecture	119	ARN-101
1257	Visual Art I	119	ARN-103
1258	Architectural Graphics I	119	ARN-105
1259	Basic Design and Creative Workshop I	119	ARN-107
1260	ARCHITECTURAL DESIGN II	119	ARN-201
1261	Architectural Design-III	119	ARN-202
1262	BUILDING CONSTRUCTION II	119	ARN-203
1263	HISTORY OF ARCHITECTUTRE I	119	ARN-205
1264	QUANTITY, PRICING AND SPECIFICATIONS	119	ARN-207
1265	STRUCTURE AND ARCHITECTURE	119	ARN-209
1266	PRICIPLES OF ARCHITECTURE	119	ARN-211
1267	MEASURED DRAWING CAMP	119	ARN-213
1268	Architectural Design-IV	119	ARN-301
1269	Building Construction-IV	119	ARN-303
1270	Computer Applications in Architecture	119	ARN-305
1271	Interior Design 	119	ARN-307 
1272	MODERN INDIAN ARCHITECTURE	119	ARN-311
1273	Architectural Design-VI	119	ARN-401
1274	Urban Design	119	ARN-403
1275	Sustainable Architecture	119	ARN-405
1276	Working Drawing	119	ARN-407
1277	Ekistics 	119	ARN-411 
1278	Live Project/ Studio/ Seminar-I	119	ARN-415
1279	Architectural Design-VII	119	ARN-501
1280	Thesis Project I	119	ARN-503
1281	Urban  Planning	119	ARN-505
1282	Hill Architecture	119	ARN-507
1283	Vastushastra	119	ARN-513
1284	Live Project/Studio/Seminar-II	119	ARN-515
1285	Design Studio-I	119	ARN-601
1286	Contemporary Architecture- Theories and Trends	119	ARN-603
1287	Urban Design	119	ARN-605
1288	Advanced Building Technologies	119	ARN-607
1289	Computer Applications in Architecture	119	ARN-609
1290	Planning Studio-I	119	ARN-651
1291	Socio Economics, Demography and Quantitative Techniques	119	ARN-653
1292	Infrastructure Planning	119	ARN-654
1293	Ecology and Sustainable Development	119	ARN-655
1294	Planning Theory and Techniques	119	ARN-657
1295	Housing	119	ARN-659
1296	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	119	ARN-701A
1297	Design Studio-III	119	ARN-703
1298	Professional Training	119	ARN-705
1299	DISSERTATION STAGE-I	119	ARN-751A
1300	Planning  Studio-III	119	ARN-753
1301	Professional Training	119	ARN-755
1302	MICROBIOLOGY	120	BTN-203
1303	BIOINFORMATICS	120	BTN-205
1304	Chemical Kinetics and Reactor Design	120	BTN-292
1305	Bioprocess Engineering	120	BTN-301
1306	Bioseparation  Engineering	120	BTN-302
1307	Plant Biotechnology	120	BTN-303
1308	Animal Biotechnology	120	BTN-305
1309	Molecular Biophysics	120	BTN-342
1310	CELL AND TISSUE ENGINEERING	120	BTN-345
1311	Introduction to Biotechnology	120	BTN-101
1312	Computer Programming	120	BTN-103
1313	GENETICS AND MOLECULAR BIOLOGY	120	BTN-201
1314	IMMUNOTECHNOLOGY	120	BTN-207
1315	Technical Communication	120	BTN-391
1316	B.Tech. Project 	120	BTN-400A
1317	Genomics and Proteomics	120	BTN-445
1318	Protein Engineering	120	BTN-447
1319	Drug Designing	120	BTN-455
1320	Training Seminar	120	BTN-499
1321	Biochemistry	120	BTN-512
1322	Biotechnology Laboratory – I	120	BTN-513
1323	Applied Microbiology	120	BTN-514
1324	Genetics & Molecular Biology	120	BTN-515
1325	Cell & Developmental Biology	120	BTN-516
1326	Technical  Communication	120	BTN-524
1327	BIOREACTION ENGINEERING 	120	BTN-531
1328	DOWNSTREAM PROCESSING	120	BTN-532
1329	Biophysical Techniques	120	BTN-611
1330	Genetic Engineering	120	BTN-612
1331	Seminar	120	BTN-613
1332	Biotechnology Laboratory – III	120	BTN-614
1333	Cell & Tissue Culture Technology	120	BTN-621
1334	Vaccine Development & Production	120	BTN-625
1335	Genomics and Proteomics	120	BTN-629
1336	Structural Biology	120	BTN-632
1337	Chemical Genetics and Drug Discovery	120	BTN-635
1338	MICROBIOLOGY AND BIOCHEMISTRY	120	BTN-651
1339	REACTION KINETICS AND REACTOR DESIGN	120	BTN-655
1340	RECOMBINANT DNA TECHNOLOGY	120	BTN-657
1341	ADVANCED TRANSPORT PROCESS	120	BTN-658
1342	SEMINAR	120	BTN-700
1343	DISSERTATION STAGE I	120	BTN-701A
1344	Advanced Thermodynamics and Molecular Simulations	121	CHE-507
1345	Introduction to Chemical  Engineering	121	CHN-101
1346	Material and Energy Balance	121	CHN-102
1347	Computer Programming and Numerical Methods	121	CHN-103
1348	Mass Transfer -I	121	CHN-202
1349	Mass Transfer	121	CHN-212
1350	Mass Transfer-II	121	CHN-301
1351	Computer Application in Chemical Engineering	121	CHN-323
1352	Fluidization Engineering	121	CHN-326
1353	Polymer Physics and Rheology*	121	CHN-411
1354	Mathematical Methods in Chemical Engineering 	121	CHE-501
1355	Advanced Transport Phenomena	121	CHE-503
1356	Advanced Reaction Engineering	121	CHE-505
1357	Biochemical Engineering	121	CHE-513
1358	COMPUTATIONAL FLUID DYNAMICS	121	CHE-515
1359	SEMINAR	121	CHE-700
1360	HEAT TRANSFER	121	CHN-201
1361	MECHANICAL OPERATION	121	CHN-203
1362	CHEMICAL ENGINEERING THERMODYNAMICS	121	CHN-205
1363	Chemical Technology	121	CHN-206
1364	CHEMICAL ENGINEERING THERMODYNAMICS	121	CHN-207
1365	Fluid and Fluid Particle Mechanics	121	CHN-211
1366	Enginering Analysis and Process Modeling	121	CHN-302
1367	Process Dynamics and Control	121	CHN-303
1368	Process Equipment Design*	121	CHN-305
1369	Process Utilities and Safety 	121	CHN-306
1370	Optimization of Chemical Enigneering Processes	121	CHN-322
1371	Process Integration	121	CHN-325
1372	Technical Communication	121	CHN-391
1373	B.Tech. Project 	121	CHN-400A
1374	Training Seminar	121	CHN-499
1375	SEMINAR	121	CHN-700
1376	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	121	CHN-701A
1377	Water Supply Engineering	123	CE-104
1378	Introduction to Civil Engineering	123	CEN-101
1379	Solid Mechanics	123	CEN-102
1380	Numerical Methods and Computer Programming	123	CEN-103
1381	Introduction to Environmental Studies	123	CEN-105
1382	Geomatics Engineering – I	123	CEN-106
1383	Waste Water Engineering	123	CEN-202
1384	Highway and Traffic Engineering	123	CEN-210
1385	Design of Steel Elements	123	CEN-305
1386	Railway Engineering and Airport Planning	123	CEN-307
1387	Wastewater Treatment	123	CEN-503
1388	Environmental Chemistry	123	CEN-504
1389	Remote Sensing and  Image Processing	123	CEN-513
1390	Geodesy and GPS Surveying	123	CEN-514
1391	Matrix Structural Analysis	123	CEN-541
1392	Continuum Mechanics	123	CEN-542
1393	Advanced Concrete Design	123	CEN-543
1394	Structural Dynamics	123	CEN-544
1395	Finite Element Analysis	123	CEN-545
1396	Geometric Design	123	CEN-564
1397	Industrial and Hazardous Waste Management	123	CEN-603
1398	Behaviour & Design of Steel Structures (Autumn)	123	CEN-641
1399	Road Traffic Safety	123	CEN-665
1400	Transportation Planning	123	CEN-669
1401	Urban Mass Transit Systems	123	CE-664
1402	GEOMATICS ENGINEERING-II	123	CEN-203
1403	CHANNEL HYDRAULICS	123	CEN-205
1404	STRUCTURAL ANALYSIS-I	123	CEN-207
1405	ENGINEERING GRAPHICS	123	CEN-291
1406	Theory of Structures	123	CEN-292
1407	Soil Mechanicas	123	CEN-303
1408	Design of Reinforced Concrete Elements	123	CEN-381
1409	Technical Communication	123	CEN-391
1410	Design of Steel Elements	123	CEN-392
1411	B.Tech. Project 	123	CEN-400A
1412	WATER RESOURCE ENGINEERING	123	CEN-412
1413	Advanced Water and Wastewater Treatment	123	CEN-421
1414	Advanced Highway Engineering	123	CEN-431
1415	Training Seminar	123	CEN-499
1416	Environmental Modeling and Simulation	123	CEN-501
1417	Water Treatment	123	CEN-502
1418	Environmental Hydraulics	123	CEN-505
1419	Surveying Measurements and Adjustments	123	CEN-511
1420	Principles of Photogrammetry	123	CEN-512
1421	FIELD SURVEY CAMP	123	CEN-515
1422	Advanced Numerical Analysis	123	CEN-521
1423	Advanced Soil Mechanics	123	CEN-522
1424	Engineering Behaviour of Rocks	123	CEN-523
1425	Soil Dynamics and Machine Foundations	123	CEN-524
1426	Advanced Hydrology	123	CEN-531
1427	Advanced Fluid Mechanics	123	CEN-532
1428	Free Surface Flows	123	CEN-533
1429	Modeling, Simulation and Optimization	123	CEN-534
1430	Traffic Engineering and Modeling	123	CEN-561
1431	Pavement Analysis and Design	123	CEN-562
1432	Planning, Design and Construction of Rural Roads	123	CEN-563
1433	Geoinformatics for Landuse  Surveys	123	CEN-616
1434	SEMINAR	123	CEN-700
1435	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	123	CEN-701A
1436	Data Structures	124	CSN-102
1437	OBJECT ORIENTED ANALYSIS AND DESIGN	124	CSN-291
1438	Data Base Management Systems	124	CSN-351
1439	Compiler Design 	124	CSN-352
1440	ARTIFICIAL INTELLIGENCE	124	CSN-371
1441	MACHINE LEARNING	124	CSN-382
1442	Data Mining and Warehousing	124	CSN-515
1443	Logic and Automated Reasoning	124	CSN-518
1444	Introduction to Computer Science and Engineering	124	CSN-101
1445	Fundamentals of Object Oriented Programming	124	CSN-103
1446	COMPUTER ARCHITECTURE AND MICROPROCESSORS	124	CSN-221
1447	DATA STRUCTURE LABORATORY	124	CSN-261
1448	Computer Network	124	CSN-341
1449	Theory of Computation	124	CSN-353
1450	Computer Network Laboratory	124	CSN-361
1451	Technical Communication	124	CSN-391
1452	B.Tech. Project 	124	CSN-400A
1453	Training Seminar	124	CSN-499
1454	Advanced Algorithms	124	CSN-501
1455	Advanced Operating Systems	124	CSN-502
1456	Advanced Computer Networks	124	CSN-503
1457	Lab I (Programming Lab)	124	CSN-504
1458	Lab II (Project Lab)	124	CSN-505
1459	Advanced Topics in Software Engineering	124	CSN-517
1460	SEMINAR	124	CSN-700
1461	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	124	CSN-701A
1462	Theory of Vibrations	125	EQN-501
1463	Vibration of Elastic Media	125	EQN-502
1464	Engineering Seismology	125	EQN-503
1465	Finite Element Method	125	EQN-504
1466	Numerical Methods for Dynamic Systems	125	EQN-513
1467	Geotechnical Earthquake Engineering	125	EQN-521
1468	Seismic Hazard Assessment	125	EQN-525
1691	Seminar	132	MAN-699
1469	Seismological Modeling and Simulation	125	EQN-531
1470	Vulnerability and Risk Analysis	125	EQN-532
1471	Earthquake Resistant Design of Structures	125	EQN-563
1472	Machine Foundation	125	EQN-572
1473	Principles of Seismology	125	EQN-598
1474	SEMINAR	125	EQN-700
1475	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	125	EQN-701A
1476	Electrical Prospecting	126	ESN-323
1477	Introduction to Earth Sciences	126	ESN-101
1478	Computer Programming	126	ESN-103
1479	BASIC PETROLOGY	126	ESN-201
1480	PALEONTOLOGY	126	ESN-203
1481	STRUCTURAL GEOLOGY-I	126	ESN-205
1482	FIELD THEORY	126	ESN-221
1483	GEOPHYSICAL PROSPECTING	126	ESN-223
1484	Structural Geology-II	126	ESN-301
1485	Metamorphic Petrology	126	ESN-303
1486	Economic Geology	126	ESN-305
1487	Gravity and Magnetic Prospecting	126	ESN-321
1488	Seismology	126	ESN-325
1489	ROCK AND SOIL MECHANICS	126	ESN-345
1490	Technical Communication	126	ESN-391
1491	PRINCIPLES OF REMOTE SENSING	126	ESN-401
1492	PRINCIPLES OF GIS	126	ESN-403
1493	ENGINEERING GEOLOGY	126	ESN-405
1494	HYDROGEOLOGY	126	ESN-407
1495	PETROLEUM GEOLOGY	126	ESN-409
1496	Numerical Modelling in Geophysical 	126	ESN-421
1497	Geophysical Well logging	126	ESN-423
1498	STRONG MOTION SEISMOGRAPH	126	ESN-477
1499	Seminar-I	126	ESN-499
1500	Comprehensive Viva Voce	126	ESN-509
1501	Numerical Techniques and Computer Programming	126	ESN-510
1502	Crystallography and Mineralogy	126	ESN-511
1503	Geochemistry	126	ESN-512
1504	Igneous Petrology	126	ESN-513
1505	Structural Geology	126	ESN-514
1506	Comprehensive Viva Voce	126	ESN-529
1507	Sedimentology and Stratigraphy	126	ESN-531
1508	Geophysical Prospecting	126	ESN-532
1509	ISOTOPE GEOLOGY	126	ESN-547
1510	Micropaleontology and Paleoceanography	126	ESN-551
1511	Global Environment	126	ESN-553
1512	DYNAMIC SYSTEMS IN EARTH SCIENCES	126	ESN-579
1513	ADVANCED SEISMIC PROSPECTING	126	ESN-581
1514	Seminar	126	ESN-599
1515	Isotope Geology	126	ESN-603
1516	Indian Mineral Deposits	126	ESN-606
1517	Engineering Geology	126	ESN-607
1518	Petroleum Geology	126	ESN-609
1519	Well Logging	126	ESN-610
1520	Plate Tectonics	126	ESN-611
1521	SEMINAR	126	ESN-700
1522	Electrical Science	127	EEN-112
1523	Instrumentation laboratory	127	EEN-523
1524	Introduction to Electrical Engineering	127	EEN-101
1525	Network Theory	127	EEN-102
1526	Programming in C++	127	EEN-103
1527	ELECTRICAL MACHINES-I	127	EEN-201
1528	DIGITAL ELECTRONICS AND CIRCUITS	127	EEN-203
1529	DESIGN OF ELECTRONICS CIRCUITS	127	EEN-205
1530	ENGINEERING ANALYSIS AND DESIGN	127	EEN-291
1531	Power System Analysis & Control	127	EEN-301
1532	Power Electronics	127	EEN-303
1533	Advanced Control Systems	127	EEN-305
1534	Artificial Neural Networks 	127	EEN-351
1535	Signals and Systems	127	EEN-356
1536	Data Structures	127	EEN-358
1537	Embedded Systems	127	EEN-360
1538	Technical Communication	127	EEN-391
1539	B.Tech. Project 	127	EEN-400A
1540	Training Seminar	127	EEN-499
1541	Advanced Industrial and Electronic Instrumentation	127	EEN-520
1542	Digital Signal and Image Processing	127	EEN-521
1543	Biomedical Instrumentation	127	EEN-522
1544	Advanced Power Electronics	127	EEN-540
1545	Analysis of Electrical Machines	127	EEN-541
1546	Advanced Electric Drives	127	EEN-542
1547	Computer Aided Power System Analysis	127	EEN-560
1548	Power System Operation and Control	127	EEN-561
1549	Distribution System Analysis and Operation	127	EEN-562
1550	EHV AC Transmission Systems	127	EEN-563
1551	Advanced Linear Control Systems	127	EEN-580
1552	Intelligent Control Techniques	127	EEN-581
1553	Advanced System Engineering	127	EEN-582
1554	Advances in Signal and Image Processing	127	EEN-626
1555	Enhanced Power Quality AC-DC Converters	127	EEN-649
1556	Power System Planning	127	EEN-661
1557	Smart Grid	127	EEN-672
1558	Introduction to Robotics	127	EEN-683
1559	Modeling and Simulation	127	EEN-689
1560	SEMINAR	127	EEN-700
1561	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	127	EEN-701A
1562	Fundamental of Electronics	128	ECN-102
1563	Principles of Digital Communication	128	ECN-212
1564	Automatic Control Systems	128	ECN-222
1565	Engineering Electromagnetics	128	ECN-232
1566	Digital Electronic Circuits Laboratory	128	ECN-252
1567	Communication Systems and Techniques	128	ECN-311
1568	Antenna Theory	128	ECN-331
1569	Microwave Engineering	128	ECN-333
1570	Coding Theory and Applications	128	ECN-515
1571	Fiber Optic Systems	128	ECN-539
1572	Radar Signal Processing	128	ECN-550
1573	RF System Design and Analysis	128	ECN-556
1574	Microelectronics Lab-1	128	ECN-575
1575	SIGNALS AND SYSTEMS	128	EC-202
1576	Introduction to Electronics and Communication Engineering	128	ECN-101
1577	SIGNALS AND SYSTEMS	128	ECN-203
1578	ELECTRONICS NETWORK THEORY	128	ECN-291
1579	Microelectronic Devices,Technology and Circuits	128	ECN-341
1692	SEMINAR	132	MAN-900
1580	Fundamentals of Microelectronics	128	ECN-343
1581	IC Application Laboratory	128	ECN-351
1582	Technical Communication	128	ECN-391
1583	B.Tech. Project 	128	ECN-400A
1584	Training Seminar	128	ECN-499
1585	Laboratory	128	ECN-510
1586	Digital Communication Systems	128	ECN-511
1587	Information and Communication Theory	128	ECN-512
1588	Telecommunication Networks	128	ECN-513
1589	Microwave Lab	128	ECN-530
1590	Microwave Engineering	128	ECN-531
1591	Advanced EMFT	128	ECN-532
1592	Antenna Theory & Design	128	ECN-534
1593	Microwave and Millimeter Wave Circuits	128	ECN-554
1594	MOS Device Physics	128	ECN-572
1595	Digital VLSI Circuit Design	128	ECN-573
1596	Simulation Lab-1	128	ECN-576
1597	Digital System Design	128	ECN-578
1598	Analog VLSI Circuit Design	128	ECN-581
1599	SEMINAR	128	ECN-700
1600	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	128	ECN-701A
1601	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	128	ECN-701B
1602	Communication skills (Basic)	129	HS-001A
1603	Technical Communication	129	HS-501
1604	Communication Skills(Basic)	129	HSN-001A
1605	Communication Skills(Advance)	129	HSN-001B
1606	Introduction to Psychology	129	HSN-002
1607	Society,Culture Built Environment	129	HSN-351
1608	Technical Communication	129	HSN-501
1609	Economics	129	HSS-01
1610	Sociology	129	HSS-02
1611	UNDERSTANDING PERSONALITY	129	HS-902
1612	HSN-01	129	HSN-01
1613	MICROECONOMICS I	129	HSN-502
1614	MACROECONOMICS I	129	HSN-503
1615	MATHEMATICS FOR ECONOMISTS	129	HSN-504
1616	DEVELOPMENT ECONOMICS	129	HSN-505
1617	MONEY, BANKING AND FINANCIAL MARKETS	129	HSN-506
1618	ADVANCED ECONOMETRICS	129	HSN-512
1619	PUBLIC POLICY; THEORY AND PRACTICE	129	HSN-513
1620	Issues in Indian Economy	129	HSN-601
1621	Introduction to Research Methodology	129	HSN-602
1622	Ecological Economics	129	HSN-604
1623	Advanced Topics in Growth Theory	129	HSN-607
1624	SEMINAR	129	HSN-700
1625	UNDERSTANDING PERSONLALITY	129	HSN-902
1626	RESEARCH METHODOLOGY IN SOCIAL SCIENCES	129	HSN-908
1627	RESEARCH METHODOLOGY IN LANGUAGE & LITERATURE	129	HSN-911
1628	Engineering Hydrology	130	HYN-102
1629	Irrigation and drainage engineering	130	HYN-562
1630	Stochastic hydrology	130	HYN-522
1631	Groundwater hydrology	130	HYN-527
1632	Geophysical investigations	130	HYN-529
1633	Watershed Behavior and Conservation Practices	130	HYN-531
1634	Environmental quality	130	HYN-535
1635	Remote sensing and GIS applications	130	HYN-537
1636	Experimental hydrology	130	HYN-553
1637	Soil and groundwater contamination modelling	130	HYN-560
1638	Watershed modeling and simulation	130	HYN-571
1639	SEMINAR	130	HYN-700
1640	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	130	HYN-701A
1641	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	130	HYN-701B
1642	Mathematical Methods	132	MAN-002
1643	Probability and Statistics	132	MAN-006
1644	Real Analysis I	132	MAN-104
1645	Theory of Computation	132	MAN-304
1646	Combinatorial Mathematics	132	MAN-322
1647	Complex Analysis-II	132	MAN-510
1648	Complex Analysis	132	MAN-520
1649	Combinatorial Mathematics	132	MAN-646
1650	Probability and Statistics	132	MA-501C
1651	Optimization Techniques	132	MA-501E
1652	Numerical Methods, Probability and Statistics	132	MA-501F
1653	Mathematics-I	132	MAN-001
1654	Introduction to Mathematical Sciences	132	MAN-101
1655	Introduction to Computer Programming	132	MAN-103
1656	COMPLEX ANALYSIS-I	132	MAN-201
1657	DISCRETE MATHEMATICS	132	MAN-203
1658	ORDINARY AND PARTIAL DIFFERENTIAL EQUATIONS	132	MAN-205
1659	DESIGN AND ANALYSIS OF ALGORITHMS	132	MAN-291
1660	Abstract Algebra-I	132	MAN-301
1661	Mathematical Statistics	132	MAN-303
1662	Linear Programming	132	MAN-305
1663	MATHEMATICAL IMAGING TECHNOLOGY	132	MAN-325
1664	Technical Communication	132	MAN-391
1665	THEORY OF ORDINARY DIFFERENTIAL EQUATIONS	132	MAN-501
1666	Real Analysis-II	132	MAN-503
1667	Topology	132	MAN-505
1668	Statistical Inference	132	MAN-507
1669	Theory of Partial Differential Equations	132	MAN-508
1670	Theory of Ordinary Differential Equations	132	MAN-511
1671	Real Analysis	132	MAN-513
1672	Topology	132	MAN-515
1673	Abstract Algebra	132	MAN-517
1674	Computer Programming	132	MAN-519
1675	SOFT COMPUTING	132	MAN-526
1676	Mathematics	132	MAN-561
1677	Fluid Dynamics	132	MAN-601
1678	Tensors and Differential Geometry	132	MAN-603
1679	Functional Analysis	132	MAN-605
1680	FUNCTIONAL ANALYSIS	132	MAN-611
1681	OPERATIONS RESEARCH	132	MAN-613
1682	SEMINAR	132	MAN-615
1683	Mathematical Statistics	132	MAN-629
1684	Advanced Numerical Analysis	132	MAN-642
1685	Coding Theory	132	MAN-645
1686	CONTROL THEORY	132	MAN-647
1687	Dynamical Systems	132	MAN-648
1688	Financial Mathematics	132	MAN-649
1689	MEASURE THEORY	132	MAN-651
1690	Orthogonal Polynomials and Special Functions	132	MAN-654
1693	SELECTED TOPICS IN ANALYSIS	132	MAN-901
1694	ADVANCED NUMERICAL ANALYSIS	132	MAN-902
1695	Advanced Manufacturing Processes	133	MI-572
1696	Introduction to Mechanical Engineering	133	MIN-101A
1697	Introduction to Production and Industrial Engineering	133	MIN-101B
1698	Programming and Data Structure	133	MIN-103
1699	Engineering Thermodynamics	133	MIN-106
1700	Mechanical Engineering Drawing	133	MIN-108
1701	Fluid Mechanics	133	MIN-110
1702	ENGINEERING ANALYSIS AND DESIGN	133	MIN-291
1703	 Lab Based Project 	133	MIN-300
1704	Machine Design	133	MIN-302
1705	Heat and Mass Transfer	133	MIN-305
1706	Theory of Production Processes-II	133	MIN-309
1707	Work System Desing	133	MIN-313
1708	Power Plants	133	MIN-343
1709	Instrumentation and Experimental Methods	133	MIN-500
1710	Computational Fluid Dynamics & Heat Transfer	133	MIN-527
1711	Computer Aided Mechanism Design	133	MIN-554
1712	Finite Element Methods	133	MIN-557
1713	Advanced Mechanical Vibrations	133	MIN-561
1714	Smart Materials, Structures, and Devices	133	MIN-565
1715	KINEMATICS OF MACHINES	133	MIN-201
1716	MANUFACTURING TECHNOLOGY-II	133	MIN-203
1717	FLUID MECHANICS	133	MIN-205
1718	THERMAL ENGINEERING	133	MIN-209
1719	Energy Conversion	133	MIN-210
1720	THEORY OF MACHINES	133	MIN-211
1721	Theory of Production Processes - I	133	MIN-216
1722	Dynamics of Machines	133	MIN-301
1723	Principles of Industrial Enigneering	133	MIN-303
1724	Operations Research	133	MIN-311
1725	Vibration  and Noise	133	MIN-321
1726	Industrial Management	133	MIN-333
1727	Refrigeration and Air-Conditioning	133	MIN-340
1728	Technical Communication	133	MIN-391
1729	B.Tech. Project 	133	MIN-400A
1730	Training Seminar	133	MIN-499
1731	Robotics and Control	133	MIN-502
1732	Modeling and Simulation	133	MIN-511A
1733	Modeling and Simulation	133	MIN-511B
1734	Advanced Thermodynamics	133	MIN-520
1735	Advanced Fluid Mechanics	133	MIN-521
1736	Advanced Heat Transfer	133	MIN-522
1737	Solar Energy	133	MIN-525
1738	Hydro-dynamic Machines	133	MIN-531
1739	Micro and Nano Scale Thermal Engineering	133	MIN-539
1740	Dynamics of Mechanical Systems	133	MIN-551
1741	Advanced Mechanics of Solids	133	MIN-552
1742	Computer Aided Design	133	MIN-559
1743	Operations Management	133	MIN-570
1744	Quality Management	133	MIN-571
1745	Advanced Manufacturing Processes	133	MIN-572
1746	Design for Manufacturability	133	MIN-573
1747	Machine Tool Design and Numerical Control	133	MIN-576
1748	Materials Management	133	MIN-583
1749	Non-Traditional Machining Processes	133	MIN-588
1750	Non-Conventional Welding Processes	133	MIN-593
1751	Numerical Methods in Manufacturing	133	MIN-606
1752	SEMINAR	133	MIN-700
1753	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	133	MIN-701A
1754	Printing Technology	136	PP-545
1755	Pulping	136	PPN-501
1756	Chemical Recovery Process	136	PPN-503
1757	Paper Proprieties and Stock Preparation	136	PPN-505
1758	Advanced Numerical Methods and Statistics	136	PPN-515
1759	Process Instrumentation  and Control	136	PPN-523
1760	Packaging Principles, Processes and Sustainability	136	PPN-541
1761	Packaging Materials	136	PPN-543
1762	Printing Technology	136	PPN-545
1763	Converting Processes for Packaging	136	PPN-547
1764	SEMINAR	136	PPN-700
1765	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	136	PPN-701A
1766	Computational Physics	137	PH-511(O)
1767	Physics of Earth’s Atmosphere	137	PH-512
1768	Elements of Nuclear and  Particle Physics	137	PH-514
1769	Advanced Atmospheric Physics	137	PH-603
1770	Mechanics	137	PHN-001
1771	Electromagnetic Field Theory	137	PHN-003
1772	Applied Physics	137	PHN-004
1773	Electrodynamics and Optics	137	PHN-005
1774	Quantum Mechanics and Statistical Mechanics	137	PHN-006
1775	Engineering Analysis Design	137	PHN-205
1776	Quantum Physics	137	PHN-211
1777	Applied Optics	137	PHN-214
1778	Plasma Physics and Applications	137	PHN-317
1779	QUANTUM INFORMATION AND COMPUTING	137	PHN-427
1780	Laboratory Work	137	PHN-502
1781	Classical Electrodynamics	137	PHN-507
1782	Physics of Earth’s Atmosphere	137	PHN-512
1783	Advanced Atmospheric Physics	137	PHN-603
1784	Weather Forecasting	137	PHN-629
1785	Laboratory Work	137	PHN-701
1786	Semiconductor Materials and Devices	137	PHN-703
1787	Optical Electronics	137	PHN-713
1788	QUARK GLUON PLASMA & FINITE TEMPERATURE FIELD THEORY	137	PH-920
1789	Modern Physics	137	PHN-007
1790	Introduction to Physical Science	137	PHN-101
1791	Computer Programming	137	PHN-103
1792	Atomic Molecular and Laser Physics	137	PHN-204
1793	Mechanics and Relativity	137	PHN-207
1794	Mathematical Physics	137	PHN-209
1795	Microprocessors and Peripheral Devices	137	PHN-210
1796	Lab-based Project	137	PHN-300
1797	Applied Instrumentation	137	PHN-310
1798	Numerical Analysis and Computational Physics	137	PHN-311
1799	Signals and Systems	137	PHN-313
1800	Laser & Photonics	137	PHN-315
1801	Techincal Communication	137	PHN-319
1802	Nuclear Astrophysics	137	PHN-331
1803	B.Tech. Project	137	PHN-400A
1804	Training Seminar	137	PHN-499
1805	Quantum Mechanics – I	137	PHN-503
1806	Mathematical Physics	137	PHN-505
1807	Classical Mechanics	137	PHN-509
1808	SEMICONDUCTOR DEVICES AND APPLICATIONS	137	PHN-513
1809	DISSERTATION STAGE-I	137	PHN-600A
1810	Advanced Condensed Matter Physics	137	PHN-601
1811	Advanced Laser Physics	137	PHN-605
1812	Advanced Nuclear Physics	137	PHN-607
1813	Advanced Characterization Techniques	137	PHN-617
1814	A Primer in Quantum Field Theory	137	PHN-619
1815	Quantum Theory of Solids	137	PHN-627
1816	Semiconductor Photonics	137	PHN-637
1817	Numerical Analysis & Computer Programming	137	PHN-643
1818	SEMINAR	137	PHN-699
1819	SEMINAR	137	PHN-700
1820	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	137	PHN-701A
1821	Computational Techniques and Programming	137	PHN-707
1822	Semiconductor Device Physics	137	PHN-709
1823	Laboratory Work in Photonics	137	PHN-711
1824	Experimental Techniques	137	PHN-788
1825	MATHEMATICAL AND COMPUTATIONAL TECHNIQUES	137	PHN-789
1826	System Design Techniques	138	WRN-501
1827	Design of Water Resources Structures	138	WRN-502
1828	Water Resources Planning and Management	138	WRN-503
1829	Applied Hydrology	138	WRN-504
1830	Hydro Generating Equipment	138	WRN-531
1831	Hydropower System Planning	138	WRN-532
1832	Power System Protection Application	138	WRN-533
1833	Design of Hydro Mechanical Equipment	138	WRN-551
1834	Construction Planning and Management	138	WRN-552
1835	Design of Irrigation Structures and Drainage Works	138	WRN-571
1836	Principles and Practices of Irrigation	138	WRN-573
1837	On Farm Development	138	WRN-575
1838	SEMINAR	138	WRN-700
1839	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	138	WRN-701A
\.


--
-- Data for Name: rest_api_department; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.rest_api_department (id, title, abbreviation, imageurl) FROM stdin;
117	Hydro and Renewable Energy	HRED	hred.png
118	Applied Science and Engineering	ASED	ased.png
119	Architecture and Planning	ARCD	arcd.png
120	Biotechnology	BTD	btd.png
121	Chemical Engineering	CHED	ched.png
122	Chemistry	CYD	cyd.png
123	Civil Engineering	CED	ced.png
124	Computer Science and Engineering	CSED	csed.png
125	Earthquake	EQD	eqd.png
126	Earth Sciences	ESD	esd.png
127	Electrical Engineering	EED	eed.png
128	Electronics and Communication Engineering	ECED	eced.png
129	Humanities and Social Sciences	HSD	hsd.png
130	Hydrology	HYD	hyd.png
131	Management Studies	MSD	msd.png
132	Mathematics	MAD	mad.png
133	Mechanical and Industrial Engineering	MIED	mied.png
134	Metallurgical and Materials Engineering	MMED	mmed.png
135	Paper Technology	PTD	ptd.png
136	Polymer and Process Engineering	PPED	pped.png
137	Physics	PHD	phd.png
138	Water Resources Development and Management	WRDMD	wrdmd.png
139	Demo	DDED	dded.png
\.


--
-- Data for Name: rest_api_file; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.rest_api_file (id, downloads, date_modified, filetype, course_id, driveid, title, size, fileext, finalized) FROM stdin;
27	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	pdf	f
28	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	pdf	f
29	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	pdf	f
30	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	pdf	f
31	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	pdf	t
32	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	docx	t
33	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	ppt	t
34	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	jpeg	t
35	0	2020-04-21	exampapers	1251	123456789	test	0.01 MB	png	t
36	0	2020-04-22	exampapers	1251	123456789	test2	0.01 MB	pdf	t
37	0	2020-04-22	exampapers	1251	123456789	test1	0.01 MB	pdf	t
38	0	2019-04-21	exampapers	1251	123456789	test1	0.01 MB	pdf	t
39	0	2020-04-22	exampapers	1251	123456789	test1	0.01 MB	pdf	t
40	0	2020-04-22	exampapers	1251	123456789	test1	0.01 MB	pdf	t
\.


--
-- Data for Name: users_courserequest; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.users_courserequest (id, status, department, course, code, date, user_id) FROM stdin;
\.


--
-- Data for Name: users_filerequest; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.users_filerequest (id, filetype, status, title, date, course_id, user_id) FROM stdin;
1	tutorials	1	test	2020-04-21	1560	1
2	tutorials	1	test1	2020-04-21	1560	1
3	tutorials	1	test2	2020-04-21	1560	1
4	tutorials	1	test3	2020-04-21	1560	1
5	tutorials	1	test4	2020-04-21	1560	1
6	tutorials	1	test5	2020-04-21	1560	1
7	tutorials	2	test6	2020-04-21	1560	1
8	tutorials	3	test7	2020-04-21	1560	1
9	Book	1	test8	2020-04-22	1679	1
\.


--
-- Data for Name: users_upload; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.users_upload (id, driveid, resolved, status, title, filetype, date, course_id, user_id) FROM stdin;
1	1LYaOdOGt08ZQusg7rfO7bdyHvc4x767I	f	1	demon.jpg	Notes	2020-04-22	1676	1
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: studyportal
--

COPY public.users_user (id, falcon_id, username, email, profile_image, courses, role) FROM stdin;
1	1	darkrider	darkrider251099@gmail.com	/assets/img_user.png	{1251,1560,1598,1527,1585,1340}	user
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1470, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 67, true);


--
-- Name: rest_api_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.rest_api_course_id_seq', 1839, true);


--
-- Name: rest_api_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.rest_api_department_id_seq', 139, true);


--
-- Name: rest_api_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.rest_api_file_id_seq', 40, true);


--
-- Name: users_courserequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.users_courserequest_id_seq', 1, false);


--
-- Name: users_filerequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.users_filerequest_id_seq', 9, true);


--
-- Name: users_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.users_upload_id_seq', 1, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: studyportal
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: rest_api_course rest_api_course_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_course
    ADD CONSTRAINT rest_api_course_pkey PRIMARY KEY (id);


--
-- Name: rest_api_department rest_api_department_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_department
    ADD CONSTRAINT rest_api_department_pkey PRIMARY KEY (id);


--
-- Name: rest_api_file rest_api_file_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_file
    ADD CONSTRAINT rest_api_file_pkey PRIMARY KEY (id);


--
-- Name: users_courserequest users_courserequest_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_courserequest
    ADD CONSTRAINT users_courserequest_pkey PRIMARY KEY (id);


--
-- Name: users_filerequest users_filerequest_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_filerequest
    ADD CONSTRAINT users_filerequest_pkey PRIMARY KEY (id);


--
-- Name: users_upload users_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_upload
    ADD CONSTRAINT users_upload_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: rest_api_course_department_id_aa4308bb; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX rest_api_course_department_id_aa4308bb ON public.rest_api_course USING btree (department_id);


--
-- Name: rest_api_file_course_id_a8b7c038; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX rest_api_file_course_id_a8b7c038 ON public.rest_api_file USING btree (course_id);


--
-- Name: users_courserequest_user_id_ed380538; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX users_courserequest_user_id_ed380538 ON public.users_courserequest USING btree (user_id);


--
-- Name: users_filerequest_course_id_8dc1c86e; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX users_filerequest_course_id_8dc1c86e ON public.users_filerequest USING btree (course_id);


--
-- Name: users_filerequest_user_id_733ad5d5; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX users_filerequest_user_id_733ad5d5 ON public.users_filerequest USING btree (user_id);


--
-- Name: users_upload_course_id_99af49b4; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX users_upload_course_id_99af49b4 ON public.users_upload USING btree (course_id);


--
-- Name: users_upload_user_id_9b4e0b20; Type: INDEX; Schema: public; Owner: studyportal
--

CREATE INDEX users_upload_user_id_9b4e0b20 ON public.users_upload USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rest_api_course rest_api_course_department_id_aa4308bb_fk_rest_api_; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_course
    ADD CONSTRAINT rest_api_course_department_id_aa4308bb_fk_rest_api_ FOREIGN KEY (department_id) REFERENCES public.rest_api_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rest_api_file rest_api_file_course_id_a8b7c038_fk_rest_api_course_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.rest_api_file
    ADD CONSTRAINT rest_api_file_course_id_a8b7c038_fk_rest_api_course_id FOREIGN KEY (course_id) REFERENCES public.rest_api_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_courserequest users_courserequest_user_id_ed380538_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_courserequest
    ADD CONSTRAINT users_courserequest_user_id_ed380538_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_filerequest users_filerequest_course_id_8dc1c86e_fk_rest_api_course_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_filerequest
    ADD CONSTRAINT users_filerequest_course_id_8dc1c86e_fk_rest_api_course_id FOREIGN KEY (course_id) REFERENCES public.rest_api_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_filerequest users_filerequest_user_id_733ad5d5_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_filerequest
    ADD CONSTRAINT users_filerequest_user_id_733ad5d5_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_upload users_upload_course_id_99af49b4_fk_rest_api_course_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_upload
    ADD CONSTRAINT users_upload_course_id_99af49b4_fk_rest_api_course_id FOREIGN KEY (course_id) REFERENCES public.rest_api_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_upload users_upload_user_id_9b4e0b20_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: studyportal
--

ALTER TABLE ONLY public.users_upload
    ADD CONSTRAINT users_upload_user_id_9b4e0b20_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

