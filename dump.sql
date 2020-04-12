--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Ubuntu 11.6-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.1 (Ubuntu 12.1-1.pgdg18.04+1)

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

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ayan
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
9	corsheaders	corsmodel
10	rest_api	file
12	rest_api	user
13	rest_api	upload
11	rest_api	filerequest
14	rest_api	courserequest
15	users	courserequest
16	users	filerequest
17	users	upload
18	users	user
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ayan
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
33	Can add cors model	9	add_corsmodel
34	Can change cors model	9	change_corsmodel
35	Can delete cors model	9	delete_corsmodel
36	Can view cors model	9	view_corsmodel
37	Can add file	10	add_file
38	Can change file	10	change_file
39	Can delete file	10	delete_file
40	Can view file	10	view_file
41	Can add request	11	add_request
42	Can change request	11	change_request
43	Can delete request	11	delete_request
44	Can view request	11	view_request
45	Can add user	12	add_user
46	Can change user	12	change_user
47	Can delete user	12	delete_user
48	Can view user	12	view_user
49	Can add upload	13	add_upload
50	Can change upload	13	change_upload
51	Can delete upload	13	delete_upload
52	Can view upload	13	view_upload
53	Can add file request	11	add_filerequest
54	Can change file request	11	change_filerequest
55	Can delete file request	11	delete_filerequest
56	Can view file request	11	view_filerequest
57	Can add course request	14	add_courserequest
58	Can change course request	14	change_courserequest
59	Can delete course request	14	delete_courserequest
60	Can view course request	14	view_courserequest
61	Can add course request	15	add_courserequest
62	Can change course request	15	change_courserequest
63	Can delete course request	15	delete_courserequest
64	Can view course request	15	view_courserequest
65	Can add file request	16	add_filerequest
66	Can change file request	16	change_filerequest
67	Can delete file request	16	delete_filerequest
68	Can view file request	16	view_filerequest
69	Can add upload	17	add_upload
70	Can change upload	17	change_upload
71	Can delete upload	17	delete_upload
72	Can view upload	17	view_upload
73	Can add user	18	add_user
74	Can change user	18	change_user
75	Can delete user	18	delete_user
76	Can view user	18	view_user
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$phcDEV5DES3Y$d98eD9VI70H8qv5HmkBTSVWWftepVUtHPJEH3dO4iOw=	2020-03-29 13:21:41.336611+05:30	t	studyportal			darkrider251099@gmail.com	t	t	2019-08-31 03:36:10.702663+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-08-31 03:36:50.287472+05:30	1	Electrical Engineering	1	[{"added": {}}]	7	1
2	2019-08-31 03:37:04.31955+05:30	1	Network Theory	1	[{"added": {}}]	8	1
3	2019-08-31 03:54:25.119222+05:30	1	Electrical Engineering	2	[]	7	1
4	2019-08-31 03:54:31.322563+05:30	1	Network Theory	2	[]	8	1
5	2019-08-31 04:34:34.019852+05:30	1	Tutorial 1	1	[{"added": {}}]	10	1
6	2019-08-31 16:22:31.953574+05:30	20	Network Theory	1	[{"added": {}}]	8	1
7	2019-08-31 16:23:07.668362+05:30	21	Analog Electronic	1	[{"added": {}}]	8	1
8	2019-09-01 18:40:23.758295+05:30	3	Electronics and Communication Engineering	1	[{"added": {}}]	7	1
9	2019-09-01 18:40:49.934904+05:30	22	Semiconductor Devices	1	[{"added": {}}]	8	1
10	2019-09-01 18:52:11.421957+05:30	4	Production and Industrial Engineering	1	[{"added": {}}]	7	1
11	2019-09-01 18:52:48.474841+05:30	5	Polymer Science And Engineering	1	[{"added": {}}]	7	1
12	2019-09-01 18:53:45.669+05:30	6	Computer Science and Engineering	1	[{"added": {}}]	7	1
13	2019-09-01 18:54:02.81564+05:30	7	Mechanical Engineering	1	[{"added": {}}]	7	1
14	2019-09-01 18:54:22.464381+05:30	8	Applied Mathematics	1	[{"added": {}}]	7	1
15	2019-09-01 18:56:00.579686+05:30	9	Metallurgical and Materials Engineering	1	[{"added": {}}]	7	1
16	2019-09-01 18:56:38.397921+05:30	10	Civil Engineering	1	[{"added": {}}]	7	1
17	2019-09-01 18:57:07.875368+05:30	11	Biotechnology	1	[{"added": {}}]	7	1
18	2019-09-01 18:57:53.777036+05:30	12	Engineering Physics	1	[{"added": {}}]	7	1
19	2019-09-01 23:46:37.651322+05:30	2	Tutorial 1	1	[{"added": {}}]	10	1
20	2019-09-02 00:44:01.017669+05:30	23	Digital Logic Design	1	[{"added": {}}]	8	1
21	2019-09-22 00:58:42.730454+05:30	1	Electrical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
22	2019-09-29 05:15:20.479451+05:30	1	Electrical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
23	2019-09-29 05:16:19.869223+05:30	12	Engineering Physics	2	[{"changed": {"fields": ["url"]}}]	7	1
24	2019-09-29 05:16:56.184047+05:30	11	Biotechnology	2	[{"changed": {"fields": ["url"]}}]	7	1
25	2019-09-29 05:16:58.799201+05:30	11	Biotechnology	2	[]	7	1
26	2019-09-29 05:17:12.120682+05:30	10	Civil Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
27	2019-09-29 05:17:49.040713+05:30	9	Metallurgical and Materials Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
28	2019-09-29 05:18:21.688429+05:30	8	Applied Mathematics	2	[{"changed": {"fields": ["url"]}}]	7	1
29	2019-09-29 05:18:55.520266+05:30	7	Mechanical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
30	2019-09-29 05:19:07.410987+05:30	6	Computer Science and Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
31	2019-09-29 05:19:39.884534+05:30	5	Polymer Science And Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
32	2019-09-29 05:19:50.937692+05:30	4	Production and Industrial Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
33	2019-09-29 05:20:16.116946+05:30	3	Electronics and Communication Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
34	2019-09-29 05:20:33.387465+05:30	2	Chemical Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
35	2019-09-29 05:21:02.159236+05:30	5	Polymer Science And Engineering	2	[{"changed": {"fields": ["url"]}}]	7	1
36	2019-09-29 05:21:14.854116+05:30	12	Engineering Physics	2	[{"changed": {"fields": ["url"]}}]	7	1
37	2019-10-03 17:47:28.879348+05:30	2	Tutorial 1	3		10	1
38	2019-10-03 17:54:43.554002+05:30	3	Tutorial-1	1	[{"added": {}}]	10	1
39	2019-10-07 21:08:48.113809+05:30	3	Tutorial-1	3		10	1
40	2019-10-07 21:12:30.92814+05:30	4	Tutorial-1	1	[{"added": {}}]	10	1
41	2019-10-07 21:25:24.814566+05:30	4	Tutorial-1	3		10	1
42	2019-10-07 21:27:19.56742+05:30	5	Tutorial-1	1	[{"added": {}}]	10	1
43	2019-10-07 21:40:00.295493+05:30	5	Tutorial-1	3		10	1
44	2019-10-07 21:42:17.597176+05:30	6	Tutorial-1	1	[{"added": {}}]	10	1
45	2019-10-07 21:43:41.290064+05:30	6	Tutorial-1	3		10	1
46	2019-10-07 21:45:25.811711+05:30	7	Tutorial-1	1	[{"added": {}}]	10	1
47	2019-10-07 21:47:31.121135+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
48	2019-10-07 21:49:09.948481+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["filetype"]}}]	10	1
49	2019-10-07 21:49:42.176864+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
50	2019-10-07 21:50:03.280286+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
51	2019-10-07 21:50:48.796738+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["file"]}}]	10	1
52	2019-10-07 21:51:07.962575+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["file", "filetype"]}}]	10	1
53	2019-10-07 21:51:32.1278+05:30	7	Tutorial-1	2	[{"changed": {"fields": ["file", "filetype"]}}]	10	1
54	2019-10-07 22:43:10.331447+05:30	7	files/exampapers/Booking_Details.pdf	2	[]	10	1
55	2019-10-07 23:05:30.822267+05:30	7	files/exampapers/Booking_Details.pdf	2	[]	10	1
56	2019-10-07 23:08:06.569891+05:30	7	files/exampapers/Booking_Details.pdf	3		10	1
57	2019-10-07 23:08:26.276963+05:30	8	files/tutorials/air_asia.pdf	1	[{"added": {}}]	10	1
58	2019-10-08 01:35:42.408579+05:30	8	Tutorial-1	2	[{"changed": {"fields": ["title", "size", "fileext"]}}]	10	1
59	2019-10-08 01:56:19.493557+05:30	9	Tutorial 2	1	[{"added": {}}]	10	1
60	2019-10-08 01:57:03.270698+05:30	9	Network Thory-E Kandestal	2	[{"changed": {"fields": ["title"]}}]	10	1
61	2019-10-08 03:02:30.629132+05:30	8	Tutorial-1	3		10	1
62	2019-10-08 03:02:37.546398+05:30	9	Network Thory-E Kandestal	3		10	1
63	2019-10-08 03:07:57.588343+05:30	11	files/tutorials/bash_9a7gZHO.sh	1	[{"added": {}}]	10	1
64	2019-10-08 03:15:00.894022+05:30	12	ayan	1	[{"added": {}}]	10	1
65	2019-10-08 03:58:48.008136+05:30	13	Ayan_Choudhary_s_CV	1	[{"added": {}}]	10	1
66	2019-10-08 03:59:52.396627+05:30	14	image	1	[{"added": {}}]	10	1
67	2019-10-14 22:43:10.811133+05:30	15	Booking_Details	1	[{"added": {}}]	10	1
68	2019-10-30 20:39:51.765372+05:30	62	Electrical Machines	3		8	1
69	2019-10-30 20:40:09.729271+05:30	61	Electrical Machines	3		8	1
70	2019-10-30 20:40:09.760195+05:30	60	Electrical Machines	3		8	1
71	2019-10-30 20:40:09.804347+05:30	59	Electrical Machines	3		8	1
72	2019-10-30 20:40:09.847407+05:30	58	Electrical Machines	3		8	1
73	2019-10-30 20:40:09.890957+05:30	57	Electrical Machines	3		8	1
74	2019-10-30 20:40:09.91068+05:30	56	Electrical Machines	3		8	1
75	2019-10-30 20:40:09.923135+05:30	55	Electrical Machines	3		8	1
76	2019-10-31 13:48:03.561102+05:30	72	Electrical Machines	3		8	1
77	2019-10-31 13:53:03.544984+05:30	73	Electrical Machines	3		8	1
78	2019-10-31 13:53:22.222201+05:30	74	Electrical Machines	3		8	1
79	2019-10-31 14:50:25.019963+05:30	15	Booking_Details	3		10	1
80	2019-10-31 14:50:25.10833+05:30	14	image	3		10	1
81	2019-10-31 14:50:25.120539+05:30	13	Ayan_Choudhary_s_CV	3		10	1
82	2019-10-31 14:50:25.133455+05:30	12	ayan	3		10	1
83	2019-10-31 14:50:25.145842+05:30	11	bash_9a7gZHO	3		10	1
1387	2020-02-19 17:49:53.753122+05:30	24	nkansn	3		11	1
84	2019-10-31 20:12:36.013471+05:30	75	Structural Analysis - 1	2	[{"changed": {"fields": ["department"]}}]	8	1
85	2019-11-01 22:27:52.215454+05:30	16	Geo Physical Technology	3		7	1
86	2019-11-03 21:28:51.079131+05:30	76	Digital Electronic	1	[{"added": {}}]	8	1
87	2019-11-03 21:42:16.723202+05:30	18	PDF	3		10	1
88	2019-11-03 21:42:17.249831+05:30	17	PDF	3		10	1
89	2019-11-03 21:52:20.074742+05:30	22	ECN-212 End term solution.PDF	3		10	1
90	2019-11-03 21:52:20.146644+05:30	21	ECN-212 quiz 2 solution.PDF	3		10	1
91	2019-11-03 21:55:35.028127+05:30	24	ECN-212 End term solution.PDF	3		10	1
92	2019-11-03 21:55:35.162977+05:30	23	ECN-212 quiz 2 solution.PDF	3		10	1
93	2019-11-24 17:54:44.497669+05:30	50	Water Resources Development and Management	3		7	1
94	2019-11-24 17:54:45.21382+05:30	49	Physics	3		7	1
95	2019-11-24 17:54:45.226342+05:30	48	Polymer and Process Engineering	3		7	1
96	2019-11-24 17:54:45.2386+05:30	47	Paper Technology	3		7	1
97	2019-11-24 17:54:45.251355+05:30	46	Metallurgical and Materials Engineering	3		7	1
98	2019-11-24 17:54:45.263929+05:30	45	Mechanical and Industrial Engineering	3		7	1
99	2019-11-24 17:54:45.277148+05:30	44	Mathematics	3		7	1
100	2019-11-24 17:54:45.289158+05:30	43	Management Studies	3		7	1
101	2019-11-24 17:54:45.302102+05:30	42	Hydrology	3		7	1
102	2019-11-24 17:54:45.314546+05:30	41	Humanities and Social Sciences	3		7	1
103	2019-11-24 17:54:45.327429+05:30	40	Electronics and Communication Engineering	3		7	1
104	2019-11-24 17:54:45.339816+05:30	39	Electrical Engineering	3		7	1
105	2019-11-24 17:54:45.352784+05:30	38	Earth Sciences	3		7	1
106	2019-11-24 17:54:45.365316+05:30	37	Earthquake	3		7	1
107	2019-11-24 17:54:45.378121+05:30	36	Computer Science and Engineering	3		7	1
108	2019-11-24 17:54:45.39061+05:30	35	Civil Engineering	3		7	1
109	2019-11-24 17:54:45.403283+05:30	34	Chemistry	3		7	1
110	2019-11-24 17:54:45.415805+05:30	33	Chemical Engineering	3		7	1
111	2019-11-24 17:54:45.428877+05:30	32	Biotechnology	3		7	1
112	2019-11-24 17:54:45.441173+05:30	31	Architecture and Planning	3		7	1
113	2019-11-24 17:54:45.454032+05:30	30	Applied Science and Engineering	3		7	1
114	2019-11-24 17:54:45.466402+05:30	29	Hydro and Renewable Energy	3		7	1
115	2019-11-24 17:54:45.487406+05:30	28	Physics	3		7	1
116	2019-11-24 17:54:45.499865+05:30	27	Paper Technology	3		7	1
117	2019-11-24 17:54:45.513243+05:30	26	Mathematics	3		7	1
118	2019-11-24 17:54:45.525314+05:30	25	Management Studies	3		7	1
119	2019-11-24 17:54:45.538197+05:30	24	Hydrology	3		7	1
120	2019-11-24 17:54:45.550578+05:30	23	Humanities and Social Sciences	3		7	1
121	2019-11-24 17:54:45.563445+05:30	22	Electrical Engineering	3		7	1
122	2019-11-24 17:54:45.57562+05:30	21	Earth Sciences	3		7	1
123	2019-11-24 17:54:45.588294+05:30	20	Earthquake	3		7	1
124	2019-11-24 17:54:45.60082+05:30	19	Civil Engineering	3		7	1
125	2019-11-24 17:54:45.613964+05:30	18	Chemistry	3		7	1
126	2019-11-24 17:54:45.626746+05:30	17	Biotechnology	3		7	1
127	2019-11-24 17:54:45.639346+05:30	15	Geo Physical Technology	3		7	1
128	2019-11-24 17:54:45.652266+05:30	14	Geotechnology	3		7	1
129	2019-11-24 17:54:45.664961+05:30	13	Textile Engineering	3		7	1
130	2019-11-24 17:54:45.677714+05:30	12	Engineering Physics	3		7	1
131	2019-11-24 17:54:45.690098+05:30	11	Biotechnology	3		7	1
132	2019-11-24 17:54:45.703099+05:30	10	Civil Engineering	3		7	1
133	2019-11-24 17:54:45.715301+05:30	9	Metallurgical and Materials Engineering	3		7	1
134	2019-11-24 17:54:45.728368+05:30	8	Applied Mathematics	3		7	1
135	2019-11-24 17:54:45.740847+05:30	7	Mechanical Engineering	3		7	1
136	2019-11-24 17:54:45.753659+05:30	6	Computer Science and Engineering	3		7	1
137	2019-11-24 17:54:45.765918+05:30	5	Polymer Science And Engineering	3		7	1
138	2019-11-24 17:54:45.778933+05:30	4	Production and Industrial Engineering	3		7	1
139	2019-11-24 17:54:45.794905+05:30	3	Electronics and Communication Engineering	3		7	1
140	2019-11-24 17:54:45.807774+05:30	2	Chemical Engineering	3		7	1
141	2019-11-24 17:54:45.820362+05:30	1	Electrical Engineering	3		7	1
142	2019-11-24 17:55:54.937495+05:30	72	Water Resources Development and Management	3		7	1
143	2019-11-24 17:55:55.316912+05:30	71	Physics	3		7	1
144	2019-11-24 17:55:55.516329+05:30	70	Polymer and Process Engineering	3		7	1
145	2019-11-24 17:55:55.783961+05:30	69	Paper Technology	3		7	1
146	2019-11-24 17:55:55.972369+05:30	68	Metallurgical and Materials Engineering	3		7	1
147	2019-11-24 17:55:56.132009+05:30	67	Mechanical and Industrial Engineering	3		7	1
148	2019-11-24 17:55:56.311779+05:30	66	Mathematics	3		7	1
149	2019-11-24 17:55:56.51721+05:30	65	Management Studies	3		7	1
150	2019-11-24 17:55:56.705686+05:30	64	Hydrology	3		7	1
151	2019-11-24 17:55:56.877536+05:30	63	Humanities and Social Sciences	3		7	1
152	2019-11-24 17:55:57.173766+05:30	62	Electronics and Communication Engineering	3		7	1
153	2019-11-24 17:55:57.329031+05:30	61	Electrical Engineering	3		7	1
154	2019-11-24 17:55:57.646289+05:30	60	Earth Sciences	3		7	1
155	2019-11-24 17:55:57.797086+05:30	59	Earthquake	3		7	1
156	2019-11-24 17:55:57.939833+05:30	58	Computer Science and Engineering	3		7	1
157	2019-11-24 17:55:58.092144+05:30	57	Civil Engineering	3		7	1
158	2019-11-24 17:55:58.22709+05:30	56	Chemistry	3		7	1
159	2019-11-24 17:55:58.362757+05:30	55	Chemical Engineering	3		7	1
160	2019-11-24 17:55:58.505943+05:30	54	Biotechnology	3		7	1
161	2019-11-24 17:55:58.674344+05:30	53	Architecture and Planning	3		7	1
162	2019-11-24 17:55:58.817388+05:30	52	Applied Science and Engineering	3		7	1
163	2019-11-24 17:55:58.969347+05:30	51	Hydro and Renewable Energy	3		7	1
164	2019-11-24 18:37:46.348197+05:30	663	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
165	2019-11-24 18:37:46.441522+05:30	662	SEMINAR	3		8	1
166	2019-11-24 18:37:46.453867+05:30	661	On Farm Development	3		8	1
167	2019-11-24 18:37:46.466845+05:30	660	Principles and Practices of Irrigation	3		8	1
168	2019-11-24 18:37:46.479344+05:30	659	Design of Irrigation Structures and Drainage Works	3		8	1
169	2019-11-24 18:37:46.492059+05:30	658	Construction Planning and Management	3		8	1
170	2019-11-24 18:37:46.517504+05:30	657	Design of Hydro Mechanical Equipment	3		8	1
171	2019-11-24 18:37:46.529896+05:30	656	Power System Protection Application	3		8	1
172	2019-11-24 18:37:46.542834+05:30	655	Hydropower System Planning	3		8	1
173	2019-11-24 18:37:46.555145+05:30	654	Hydro Generating Equipment	3		8	1
174	2019-11-24 18:37:46.56808+05:30	653	Applied Hydrology	3		8	1
175	2019-11-24 18:37:46.580466+05:30	652	Water Resources Planning and Management	3		8	1
176	2019-11-24 18:37:46.593604+05:30	651	Design of Water Resources Structures	3		8	1
177	2019-11-24 18:37:46.605729+05:30	650	System Design Techniques	3		8	1
178	2019-11-24 18:37:46.700837+05:30	649	MATHEMATICAL AND COMPUTATIONAL TECHNIQUES	3		8	1
179	2019-11-24 18:37:46.712877+05:30	648	Experimental Techniques	3		8	1
180	2019-11-24 18:37:46.726566+05:30	647	Laboratory Work in Photonics	3		8	1
181	2019-11-24 18:37:46.739038+05:30	646	Semiconductor Device Physics	3		8	1
182	2019-11-24 18:37:46.751928+05:30	645	Computational Techniques and Programming	3		8	1
183	2019-11-24 18:37:46.764765+05:30	644	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
184	2019-11-24 18:37:46.777338+05:30	643	SEMINAR	3		8	1
185	2019-11-24 18:37:46.790028+05:30	642	SEMINAR	3		8	1
186	2019-11-24 18:37:46.802452+05:30	641	Numerical Analysis & Computer Programming	3		8	1
187	2019-11-24 18:37:46.815704+05:30	640	Semiconductor Photonics	3		8	1
188	2019-11-24 18:37:46.827768+05:30	639	Quantum Theory of Solids	3		8	1
189	2019-11-24 18:37:46.840715+05:30	638	A Primer in Quantum Field Theory	3		8	1
190	2019-11-24 18:37:46.853353+05:30	637	Advanced Characterization Techniques	3		8	1
191	2019-11-24 18:37:46.865987+05:30	636	Advanced Nuclear Physics	3		8	1
192	2019-11-24 18:37:46.87836+05:30	635	Advanced Laser Physics	3		8	1
193	2019-11-24 18:37:46.891343+05:30	634	Advanced Condensed Matter Physics	3		8	1
194	2019-11-24 18:37:46.903994+05:30	633	DISSERTATION STAGE-I	3		8	1
195	2019-11-24 18:37:46.916754+05:30	632	SEMICONDUCTOR DEVICES AND APPLICATIONS	3		8	1
196	2019-11-24 18:37:46.929254+05:30	631	Classical Mechanics	3		8	1
197	2019-11-24 18:37:46.941912+05:30	630	Mathematical Physics	3		8	1
198	2019-11-24 18:37:46.954334+05:30	629	Quantum Mechanics – I	3		8	1
199	2019-11-24 18:37:46.967321+05:30	628	Training Seminar	3		8	1
200	2019-11-24 18:37:46.979773+05:30	627	B.Tech. Project	3		8	1
201	2019-11-24 18:37:46.992548+05:30	626	Nuclear Astrophysics	3		8	1
202	2019-11-24 18:37:47.005299+05:30	625	Techincal Communication	3		8	1
203	2019-11-24 18:37:47.017918+05:30	624	Laser & Photonics	3		8	1
204	2019-11-24 18:37:47.030355+05:30	623	Signals and Systems	3		8	1
205	2019-11-24 18:37:47.043207+05:30	622	Numerical Analysis and Computational Physics	3		8	1
206	2019-11-24 18:37:47.055512+05:30	621	Applied Instrumentation	3		8	1
207	2019-11-24 18:37:47.068788+05:30	620	Lab-based Project	3		8	1
208	2019-11-24 18:37:47.080932+05:30	619	Microprocessors and Peripheral Devices	3		8	1
209	2019-11-24 18:37:47.093794+05:30	618	Mathematical Physics	3		8	1
210	2019-11-24 18:37:47.106217+05:30	617	Mechanics and Relativity	3		8	1
211	2019-11-24 18:37:47.119147+05:30	616	Atomic Molecular and Laser Physics	3		8	1
212	2019-11-24 18:37:47.131561+05:30	615	Computer Programming	3		8	1
213	2019-11-24 18:37:47.144463+05:30	614	Introduction to Physical Science	3		8	1
214	2019-11-24 18:37:47.156832+05:30	613	Modern Physics	3		8	1
215	2019-11-24 18:37:47.16978+05:30	612	QUARK GLUON PLASMA & FINITE TEMPERATURE FIELD THEORY	3		8	1
216	2019-11-24 18:37:47.181992+05:30	611	Optical Electronics	3		8	1
217	2019-11-24 18:37:47.19487+05:30	610	Semiconductor Materials and Devices	3		8	1
218	2019-11-24 18:37:47.207032+05:30	609	Laboratory Work	3		8	1
219	2019-11-24 18:37:47.220232+05:30	608	Weather Forecasting	3		8	1
220	2019-11-24 18:37:47.232536+05:30	607	Advanced Atmospheric Physics	3		8	1
221	2019-11-24 18:37:47.2453+05:30	606	Physics of Earth’s Atmosphere	3		8	1
222	2019-11-24 18:37:47.25839+05:30	605	Classical Electrodynamics	3		8	1
223	2019-11-24 18:37:47.270738+05:30	604	Laboratory Work	3		8	1
224	2019-11-24 18:37:47.283881+05:30	603	QUANTUM INFORMATION AND COMPUTING	3		8	1
225	2019-11-24 18:37:47.296247+05:30	602	Plasma Physics and Applications	3		8	1
226	2019-11-24 18:37:47.309331+05:30	601	Applied Optics	3		8	1
227	2019-11-24 18:37:47.321721+05:30	600	Quantum Physics	3		8	1
228	2019-11-24 18:37:47.33464+05:30	599	Engineering Analysis Design	3		8	1
229	2019-11-24 18:37:47.346979+05:30	598	Quantum Mechanics and Statistical Mechanics	3		8	1
230	2019-11-24 18:37:47.359996+05:30	597	Electrodynamics and Optics	3		8	1
231	2019-11-24 18:37:47.372299+05:30	596	Applied Physics	3		8	1
232	2019-11-24 18:37:47.385357+05:30	595	Electromagnetic Field Theory	3		8	1
233	2019-11-24 18:37:47.397662+05:30	594	Mechanics	3		8	1
234	2019-11-24 18:37:47.410566+05:30	593	Advanced Atmospheric Physics	3		8	1
235	2019-11-24 18:37:47.426697+05:30	592	Elements of Nuclear and  Particle Physics	3		8	1
236	2019-11-24 18:37:47.439638+05:30	591	Physics of Earth’s Atmosphere	3		8	1
237	2019-11-24 18:37:47.451921+05:30	590	Computational Physics	3		8	1
238	2019-11-24 18:37:47.464848+05:30	589	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
239	2019-11-24 18:37:47.477201+05:30	588	SEMINAR	3		8	1
240	2019-11-24 18:37:47.490121+05:30	587	Converting Processes for Packaging	3		8	1
241	2019-11-24 18:37:47.502522+05:30	586	Printing Technology	3		8	1
242	2019-11-24 18:37:47.51556+05:30	585	Packaging Materials	3		8	1
243	2019-11-24 18:37:47.528025+05:30	584	Packaging Principles, Processes and Sustainability	3		8	1
244	2019-11-24 18:37:47.541069+05:30	583	Process Instrumentation  and Control	3		8	1
245	2019-11-24 18:37:47.553237+05:30	582	Advanced Numerical Methods and Statistics	3		8	1
246	2019-11-24 18:37:47.56607+05:30	581	Paper Proprieties and Stock Preparation	3		8	1
247	2019-11-24 18:37:47.578437+05:30	580	Chemical Recovery Process	3		8	1
248	2019-11-24 18:37:47.591459+05:30	579	Pulping	3		8	1
249	2019-11-24 18:37:47.604089+05:30	578	Printing Technology	3		8	1
250	2019-11-24 18:37:47.616783+05:30	577	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
251	2019-11-24 18:37:47.629352+05:30	576	SEMINAR	3		8	1
252	2019-11-24 18:37:47.642007+05:30	575	Numerical Methods in Manufacturing	3		8	1
253	2019-11-24 18:37:47.654836+05:30	574	Non-Traditional Machining Processes	3		8	1
254	2019-11-24 18:37:47.667425+05:30	573	Materials Management	3		8	1
255	2019-11-24 18:37:47.679687+05:30	572	Machine Tool Design and Numerical Control	3		8	1
256	2019-11-24 18:37:47.692915+05:30	571	Design for Manufacturability	3		8	1
257	2019-11-24 18:37:47.705294+05:30	570	Advanced Manufacturing Processes	3		8	1
258	2019-11-24 18:37:47.717931+05:30	569	Quality Management	3		8	1
259	2019-11-24 18:37:47.730422+05:30	568	Operations Management	3		8	1
260	2019-11-24 18:37:47.743242+05:30	567	Computer Aided Design	3		8	1
261	2019-11-24 18:37:47.755636+05:30	566	Advanced Mechanics of Solids	3		8	1
262	2019-11-24 18:37:47.768903+05:30	565	Dynamics of Mechanical Systems	3		8	1
263	2019-11-24 18:37:47.781012+05:30	564	Micro and Nano Scale Thermal Engineering	3		8	1
264	2019-11-24 18:37:47.794705+05:30	563	Hydro-dynamic Machines	3		8	1
265	2019-11-24 18:37:47.807151+05:30	562	Solar Energy	3		8	1
1388	2020-02-19 17:49:53.765557+05:30	23	dasasd	3		11	1
266	2019-11-24 18:37:47.819886+05:30	561	Advanced Heat Transfer	3		8	1
267	2019-11-24 18:37:47.832344+05:30	560	Advanced Fluid Mechanics	3		8	1
268	2019-11-24 18:37:47.845377+05:30	559	Advanced Thermodynamics	3		8	1
269	2019-11-24 18:37:47.857583+05:30	558	Modeling and Simulation	3		8	1
270	2019-11-24 18:37:47.870501+05:30	557	Modeling and Simulation	3		8	1
271	2019-11-24 18:37:47.883108+05:30	556	Robotics and Control	3		8	1
272	2019-11-24 18:37:47.895838+05:30	555	Training Seminar	3		8	1
273	2019-11-24 18:37:47.909039+05:30	554	B.Tech. Project 	3		8	1
274	2019-11-24 18:37:47.921592+05:30	553	Technical Communication	3		8	1
275	2019-11-24 18:37:47.934073+05:30	552	Refrigeration and Air-Conditioning	3		8	1
276	2019-11-24 18:37:47.946596+05:30	551	Industrial Management	3		8	1
277	2019-11-24 18:37:47.95949+05:30	550	Vibration  and Noise	3		8	1
278	2019-11-24 18:37:47.971995+05:30	549	Operations Research	3		8	1
279	2019-11-24 18:37:47.984429+05:30	548	Principles of Industrial Enigneering	3		8	1
280	2019-11-24 18:37:47.996664+05:30	547	Dynamics of Machines	3		8	1
281	2019-11-24 18:37:48.022749+05:30	546	THEORY OF MACHINES	3		8	1
282	2019-11-24 18:37:48.048461+05:30	545	Energy Conversion	3		8	1
283	2019-11-24 18:37:48.073134+05:30	544	THERMAL ENGINEERING	3		8	1
284	2019-11-24 18:37:48.099319+05:30	543	FLUID MECHANICS	3		8	1
285	2019-11-24 18:37:48.124542+05:30	542	MANUFACTURING TECHNOLOGY-II	3		8	1
286	2019-11-24 18:37:48.150437+05:30	541	KINEMATICS OF MACHINES	3		8	1
287	2019-11-24 18:37:48.392386+05:30	540	Non-Conventional Welding Processes	3		8	1
288	2019-11-24 18:37:49.15385+05:30	539	Smart Materials, Structures, and Devices	3		8	1
289	2019-11-24 18:37:49.179989+05:30	538	Advanced Mechanical Vibrations	3		8	1
290	2019-11-24 18:37:49.191964+05:30	537	Finite Element Methods	3		8	1
291	2019-11-24 18:37:49.204751+05:30	536	Computer Aided Mechanism Design	3		8	1
292	2019-11-24 18:37:49.230658+05:30	535	Computational Fluid Dynamics & Heat Transfer	3		8	1
293	2019-11-24 18:37:49.255487+05:30	534	Instrumentation and Experimental Methods	3		8	1
294	2019-11-24 18:37:49.269289+05:30	533	Power Plants	3		8	1
295	2019-11-24 18:37:49.295266+05:30	532	Work System Desing	3		8	1
296	2019-11-24 18:37:49.320172+05:30	531	Theory of Production Processes-II	3		8	1
297	2019-11-24 18:37:49.343651+05:30	530	Heat and Mass Transfer	3		8	1
298	2019-11-24 18:37:49.35634+05:30	529	Machine Design	3		8	1
299	2019-11-24 18:37:49.370684+05:30	528	 Lab Based Project 	3		8	1
300	2019-11-24 18:37:49.381958+05:30	527	ENGINEERING ANALYSIS AND DESIGN	3		8	1
301	2019-11-24 18:37:49.394233+05:30	526	Theory of Production Processes - I	3		8	1
302	2019-11-24 18:37:49.407183+05:30	525	Fluid Mechanics	3		8	1
303	2019-11-24 18:37:49.41955+05:30	524	Mechanical Engineering Drawing	3		8	1
304	2019-11-24 18:37:49.43292+05:30	523	Engineering Thermodynamics	3		8	1
305	2019-11-24 18:37:49.44531+05:30	522	Programming and Data Structure	3		8	1
306	2019-11-24 18:37:49.457975+05:30	521	Introduction to Production and Industrial Engineering	3		8	1
307	2019-11-24 18:37:49.470435+05:30	520	Introduction to Mechanical Engineering	3		8	1
308	2019-11-24 18:37:49.483753+05:30	519	Advanced Manufacturing Processes	3		8	1
309	2019-11-24 18:37:49.495893+05:30	518	ADVANCED NUMERICAL ANALYSIS	3		8	1
310	2019-11-24 18:37:49.508846+05:30	517	SELECTED TOPICS IN ANALYSIS	3		8	1
311	2019-11-24 18:37:49.521052+05:30	516	SEMINAR	3		8	1
312	2019-11-24 18:37:49.533962+05:30	515	Seminar	3		8	1
313	2019-11-24 18:37:49.546498+05:30	514	Orthogonal Polynomials and Special Functions	3		8	1
314	2019-11-24 18:37:49.559392+05:30	513	Financial Mathematics	3		8	1
315	2019-11-24 18:37:49.571917+05:30	512	Dynamical Systems	3		8	1
316	2019-11-24 18:37:49.584887+05:30	511	CONTROL THEORY	3		8	1
317	2019-11-24 18:37:49.597143+05:30	510	Coding Theory	3		8	1
318	2019-11-24 18:37:49.610122+05:30	509	Advanced Numerical Analysis	3		8	1
319	2019-11-24 18:37:49.622677+05:30	508	Mathematical Statistics	3		8	1
320	2019-11-24 18:37:49.635518+05:30	507	SEMINAR	3		8	1
321	2019-11-24 18:37:49.647767+05:30	506	OPERATIONS RESEARCH	3		8	1
322	2019-11-24 18:37:49.660743+05:30	505	FUNCTIONAL ANALYSIS	3		8	1
323	2019-11-24 18:37:49.673174+05:30	504	Functional Analysis	3		8	1
324	2019-11-24 18:37:49.686719+05:30	503	Tensors and Differential Geometry	3		8	1
325	2019-11-24 18:37:49.699015+05:30	502	Fluid Dynamics	3		8	1
326	2019-11-24 18:37:49.711812+05:30	501	Mathematics	3		8	1
327	2019-11-24 18:37:49.724936+05:30	500	SOFT COMPUTING	3		8	1
328	2019-11-24 18:37:49.737329+05:30	499	Complex Analysis	3		8	1
329	2019-11-24 18:37:49.750624+05:30	498	Computer Programming	3		8	1
330	2019-11-24 18:37:49.76259+05:30	497	Abstract Algebra	3		8	1
331	2019-11-24 18:37:49.775566+05:30	496	Topology	3		8	1
332	2019-11-24 18:37:49.78827+05:30	495	Real Analysis	3		8	1
333	2019-11-24 18:37:49.800943+05:30	494	Theory of Ordinary Differential Equations	3		8	1
334	2019-11-24 18:37:49.8133+05:30	493	Complex Analysis-II	3		8	1
335	2019-11-24 18:37:49.826111+05:30	492	Theory of Partial Differential Equations	3		8	1
336	2019-11-24 18:37:49.83875+05:30	491	Topology	3		8	1
337	2019-11-24 18:37:49.85149+05:30	490	Real Analysis-II	3		8	1
338	2019-11-24 18:37:49.87208+05:30	489	THEORY OF ORDINARY DIFFERENTIAL EQUATIONS	3		8	1
339	2019-11-24 18:37:49.885441+05:30	488	Technical Communication	3		8	1
340	2019-11-24 18:37:49.897526+05:30	487	MATHEMATICAL IMAGING TECHNOLOGY	3		8	1
341	2019-11-24 18:37:49.91039+05:30	486	Linear Programming	3		8	1
342	2019-11-24 18:37:49.922626+05:30	485	Mathematical Statistics	3		8	1
343	2019-11-24 18:37:49.935634+05:30	484	Abstract Algebra-I	3		8	1
344	2019-11-24 18:37:49.947962+05:30	483	DESIGN AND ANALYSIS OF ALGORITHMS	3		8	1
345	2019-11-24 18:37:49.96095+05:30	482	ORDINARY AND PARTIAL DIFFERENTIAL EQUATIONS	3		8	1
346	2019-11-24 18:37:49.973345+05:30	481	DISCRETE MATHEMATICS	3		8	1
347	2019-11-24 18:37:49.986224+05:30	480	Introduction to Computer Programming	3		8	1
348	2019-11-24 18:37:49.998666+05:30	479	Mathematics-I	3		8	1
349	2019-11-24 18:37:50.011539+05:30	478	Numerical Methods, Probability and Statistics	3		8	1
350	2019-11-24 18:37:50.023936+05:30	477	Optimization Techniques	3		8	1
351	2019-11-24 18:37:50.036906+05:30	476	Probability and Statistics	3		8	1
352	2019-11-24 18:37:50.049127+05:30	475	MEASURE THEORY	3		8	1
353	2019-11-24 18:37:50.06211+05:30	474	Statistical Inference	3		8	1
354	2019-11-24 18:37:50.074492+05:30	473	COMPLEX ANALYSIS-I	3		8	1
355	2019-11-24 18:37:50.087999+05:30	472	Real Analysis I	3		8	1
356	2019-11-24 18:37:50.099752+05:30	471	Introduction to Mathematical Sciences	3		8	1
357	2019-11-24 18:37:50.112749+05:30	470	Probability and Statistics	3		8	1
358	2019-11-24 18:37:50.125216+05:30	469	Mathematical Methods	3		8	1
359	2019-11-24 18:37:50.154683+05:30	468	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
360	2019-11-24 18:37:50.166777+05:30	467	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
361	2019-11-24 18:37:50.179774+05:30	466	SEMINAR	3		8	1
362	2019-11-24 18:37:50.19218+05:30	465	Watershed modeling and simulation	3		8	1
363	2019-11-24 18:37:50.205127+05:30	464	Soil and groundwater contamination modelling	3		8	1
364	2019-11-24 18:37:50.217531+05:30	463	Experimental hydrology	3		8	1
365	2019-11-24 18:37:50.230435+05:30	462	Remote sensing and GIS applications	3		8	1
366	2019-11-24 18:37:50.243355+05:30	461	Environmental quality	3		8	1
367	2019-11-24 18:37:50.255753+05:30	460	Watershed Behavior and Conservation Practices	3		8	1
368	2019-11-24 18:37:50.268779+05:30	459	Geophysical investigations	3		8	1
369	2019-11-24 18:37:50.281073+05:30	458	Groundwater hydrology	3		8	1
370	2019-11-24 18:37:50.293991+05:30	457	Stochastic hydrology	3		8	1
371	2019-11-24 18:37:50.306359+05:30	456	Irrigation and drainage engineering	3		8	1
372	2019-11-24 18:37:50.31929+05:30	455	Engineering Hydrology	3		8	1
373	2019-11-24 18:37:50.331962+05:30	454	RESEARCH METHODOLOGY IN LANGUAGE & LITERATURE	3		8	1
374	2019-11-24 18:37:50.344904+05:30	453	RESEARCH METHODOLOGY IN SOCIAL SCIENCES	3		8	1
375	2019-11-24 18:37:50.357318+05:30	452	UNDERSTANDING PERSONLALITY	3		8	1
376	2019-11-24 18:37:50.369971+05:30	451	SEMINAR	3		8	1
377	2019-11-24 18:37:50.382411+05:30	450	Advanced Topics in Growth Theory	3		8	1
378	2019-11-24 18:37:50.395013+05:30	449	Ecological Economics	3		8	1
379	2019-11-24 18:37:50.410807+05:30	448	Introduction to Research Methodology	3		8	1
380	2019-11-24 18:37:50.42367+05:30	447	Issues in Indian Economy	3		8	1
381	2019-11-24 18:37:50.436213+05:30	446	PUBLIC POLICY; THEORY AND PRACTICE	3		8	1
382	2019-11-24 18:37:50.449174+05:30	445	ADVANCED ECONOMETRICS	3		8	1
383	2019-11-24 18:37:50.461518+05:30	444	MONEY, BANKING AND FINANCIAL MARKETS	3		8	1
384	2019-11-24 18:37:50.474296+05:30	443	DEVELOPMENT ECONOMICS	3		8	1
385	2019-11-24 18:37:50.486886+05:30	442	MATHEMATICS FOR ECONOMISTS	3		8	1
386	2019-11-24 18:37:50.500206+05:30	441	MACROECONOMICS I	3		8	1
387	2019-11-24 18:37:50.51247+05:30	440	MICROECONOMICS I	3		8	1
388	2019-11-24 18:37:50.525447+05:30	439	HSN-01	3		8	1
389	2019-11-24 18:37:50.59511+05:30	438	UNDERSTANDING PERSONALITY	3		8	1
390	2019-11-24 18:37:50.608044+05:30	437	Sociology	3		8	1
391	2019-11-24 18:37:50.620559+05:30	436	Economics	3		8	1
392	2019-11-24 18:37:50.641472+05:30	435	Technical Communication	3		8	1
393	2019-11-24 18:37:50.653727+05:30	434	Society,Culture Built Environment	3		8	1
394	2019-11-24 18:37:50.666516+05:30	433	Introduction to Psychology	3		8	1
395	2019-11-24 18:37:50.679263+05:30	432	Communication Skills(Advance)	3		8	1
396	2019-11-24 18:37:50.692162+05:30	431	Communication Skills(Basic)	3		8	1
397	2019-11-24 18:37:50.704889+05:30	430	Technical Communication	3		8	1
398	2019-11-24 18:37:50.717456+05:30	429	Communication skills (Basic)	3		8	1
399	2019-11-24 18:37:50.729788+05:30	428	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
400	2019-11-24 18:37:50.742718+05:30	427	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
401	2019-11-24 18:37:50.755133+05:30	426	SEMINAR	3		8	1
402	2019-11-24 18:37:50.768243+05:30	425	Analog VLSI Circuit Design	3		8	1
403	2019-11-24 18:37:50.788675+05:30	424	Digital System Design	3		8	1
404	2019-11-24 18:37:50.801415+05:30	423	Simulation Lab-1	3		8	1
405	2019-11-24 18:37:50.813756+05:30	422	Microelectronics Lab-1	3		8	1
406	2019-11-24 18:37:50.826932+05:30	421	Digital VLSI Circuit Design	3		8	1
407	2019-11-24 18:37:50.839276+05:30	420	MOS Device Physics	3		8	1
408	2019-11-24 18:37:50.852987+05:30	419	Microwave and Millimeter Wave Circuits	3		8	1
409	2019-11-24 18:37:50.87355+05:30	418	Antenna Theory & Design	3		8	1
410	2019-11-24 18:37:51.27596+05:30	417	Advanced EMFT	3		8	1
411	2019-11-24 18:37:51.709029+05:30	416	Microwave Engineering	3		8	1
412	2019-11-24 18:37:51.732471+05:30	415	Microwave Lab	3		8	1
413	2019-11-24 18:37:51.759727+05:30	414	Telecommunication Networks	3		8	1
414	2019-11-24 18:37:51.778341+05:30	413	Information and Communication Theory	3		8	1
415	2019-11-24 18:37:51.79129+05:30	412	Digital Communication Systems	3		8	1
416	2019-11-24 18:37:51.803699+05:30	411	Laboratory	3		8	1
417	2019-11-24 18:37:51.817578+05:30	410	Training Seminar	3		8	1
418	2019-11-24 18:37:51.829562+05:30	409	B.Tech. Project 	3		8	1
419	2019-11-24 18:37:51.842689+05:30	408	Technical Communication	3		8	1
420	2019-11-24 18:37:51.871552+05:30	407	IC Application Laboratory	3		8	1
421	2019-11-24 18:37:51.884133+05:30	406	Fundamentals of Microelectronics	3		8	1
422	2019-11-24 18:37:51.896818+05:30	405	Microelectronic Devices,Technology and Circuits	3		8	1
423	2019-11-24 18:37:51.909655+05:30	404	ELECTRONICS NETWORK THEORY	3		8	1
424	2019-11-24 18:37:51.921899+05:30	403	SIGNALS AND SYSTEMS	3		8	1
425	2019-11-24 18:37:51.93506+05:30	402	Introduction to Electronics and Communication Engineering	3		8	1
426	2019-11-24 18:37:51.94725+05:30	401	SIGNALS AND SYSTEMS	3		8	1
427	2019-11-24 18:37:51.968279+05:30	400	RF System Design and Analysis	3		8	1
428	2019-11-24 18:37:51.981003+05:30	399	Radar Signal Processing	3		8	1
429	2019-11-24 18:37:51.993626+05:30	398	Fiber Optic Systems	3		8	1
430	2019-11-24 18:37:52.006084+05:30	397	Coding Theory and Applications	3		8	1
431	2019-11-24 18:37:52.019181+05:30	396	Microwave Engineering	3		8	1
432	2019-11-24 18:37:52.039547+05:30	395	Antenna Theory	3		8	1
433	2019-11-24 18:37:52.052662+05:30	394	Communication Systems and Techniques	3		8	1
434	2019-11-24 18:37:52.07305+05:30	393	Digital Electronic Circuits Laboratory	3		8	1
435	2019-11-24 18:37:52.085976+05:30	392	Engineering Electromagnetics	3		8	1
436	2019-11-24 18:37:52.106553+05:30	391	Automatic Control Systems	3		8	1
437	2019-11-24 18:37:52.119448+05:30	390	Principles of Digital Communication	3		8	1
438	2019-11-24 18:37:52.131908+05:30	389	Fundamental of Electronics	3		8	1
439	2019-11-24 18:37:52.144816+05:30	388	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
440	2019-11-24 18:37:52.157269+05:30	387	SEMINAR	3		8	1
441	2019-11-24 18:37:52.170019+05:30	386	Modeling and Simulation	3		8	1
442	2019-11-24 18:37:52.183324+05:30	385	Introduction to Robotics	3		8	1
443	2019-11-24 18:37:52.203883+05:30	384	Smart Grid	3		8	1
444	2019-11-24 18:37:52.216694+05:30	383	Power System Planning	3		8	1
445	2019-11-24 18:37:52.229202+05:30	382	Enhanced Power Quality AC-DC Converters	3		8	1
446	2019-11-24 18:37:52.249951+05:30	381	Advances in Signal and Image Processing	3		8	1
447	2019-11-24 18:37:52.262382+05:30	380	Advanced System Engineering	3		8	1
448	2019-11-24 18:37:52.275268+05:30	379	Intelligent Control Techniques	3		8	1
449	2019-11-24 18:37:52.287721+05:30	378	Advanced Linear Control Systems	3		8	1
450	2019-11-24 18:37:52.300846+05:30	377	EHV AC Transmission Systems	3		8	1
451	2019-11-24 18:37:52.313114+05:30	376	Distribution System Analysis and Operation	3		8	1
452	2019-11-24 18:37:52.32594+05:30	375	Power System Operation and Control	3		8	1
453	2019-11-24 18:37:52.346685+05:30	374	Computer Aided Power System Analysis	3		8	1
454	2019-11-24 18:37:52.367814+05:30	373	Advanced Electric Drives	3		8	1
455	2019-11-24 18:37:52.388396+05:30	372	Analysis of Electrical Machines	3		8	1
456	2019-11-24 18:37:52.401169+05:30	371	Advanced Power Electronics	3		8	1
457	2019-11-24 18:37:52.413269+05:30	370	Biomedical Instrumentation	3		8	1
458	2019-11-24 18:37:52.426347+05:30	369	Digital Signal and Image Processing	3		8	1
459	2019-11-24 18:37:52.438941+05:30	368	Advanced Industrial and Electronic Instrumentation	3		8	1
460	2019-11-24 18:37:52.451837+05:30	367	Training Seminar	3		8	1
461	2019-11-24 18:37:52.464129+05:30	366	B.Tech. Project 	3		8	1
462	2019-11-24 18:37:52.476985+05:30	365	Technical Communication	3		8	1
463	2019-11-24 18:37:52.48943+05:30	364	Embedded Systems	3		8	1
464	2019-11-24 18:37:52.510481+05:30	363	Data Structures	3		8	1
465	2019-11-24 18:37:52.522578+05:30	362	Signals and Systems	3		8	1
466	2019-11-24 18:37:52.535545+05:30	361	Artificial Neural Networks 	3		8	1
467	2019-11-24 18:37:52.547727+05:30	360	Advanced Control Systems	3		8	1
468	2019-11-24 18:37:52.560721+05:30	359	Power Electronics	3		8	1
469	2019-11-24 18:37:52.573065+05:30	358	Power System Analysis & Control	3		8	1
470	2019-11-24 18:37:52.586183+05:30	357	ENGINEERING ANALYSIS AND DESIGN	3		8	1
471	2019-11-24 18:37:52.598469+05:30	356	DESIGN OF ELECTRONICS CIRCUITS	3		8	1
472	2019-11-24 18:37:52.611356+05:30	355	DIGITAL ELECTRONICS AND CIRCUITS	3		8	1
473	2019-11-24 18:37:52.623827+05:30	354	ELECTRICAL MACHINES-I	3		8	1
474	2019-11-24 18:37:52.637284+05:30	353	Programming in C++	3		8	1
475	2019-11-24 18:37:52.657751+05:30	352	Network Theory	3		8	1
476	2019-11-24 18:37:52.671742+05:30	351	Introduction to Electrical Engineering	3		8	1
477	2019-11-24 18:37:52.691882+05:30	350	Instrumentation laboratory	3		8	1
478	2019-11-24 18:37:52.705476+05:30	349	Electrical Science	3		8	1
479	2019-11-24 18:37:52.726114+05:30	348	SEMINAR	3		8	1
480	2019-11-24 18:37:52.738681+05:30	347	Plate Tectonics	3		8	1
481	2019-11-24 18:37:52.759382+05:30	346	Well Logging	3		8	1
482	2019-11-24 18:37:52.771988+05:30	345	Petroleum Geology	3		8	1
483	2019-11-24 18:37:52.785085+05:30	344	Engineering Geology	3		8	1
484	2019-11-24 18:37:52.805426+05:30	343	Indian Mineral Deposits	3		8	1
485	2019-11-24 18:37:52.818757+05:30	342	Isotope Geology	3		8	1
486	2019-11-24 18:37:52.839173+05:30	341	Seminar	3		8	1
487	2019-11-24 18:37:52.859816+05:30	340	ADVANCED SEISMIC PROSPECTING	3		8	1
488	2019-11-24 18:37:52.872192+05:30	339	DYNAMIC SYSTEMS IN EARTH SCIENCES	3		8	1
489	2019-11-24 18:37:52.88536+05:30	338	Global Environment	3		8	1
490	2019-11-24 18:37:52.905874+05:30	337	Micropaleontology and Paleoceanography	3		8	1
491	2019-11-24 18:37:52.918939+05:30	336	ISOTOPE GEOLOGY	3		8	1
492	2019-11-24 18:37:52.939211+05:30	335	Geophysical Prospecting	3		8	1
493	2019-11-24 18:37:52.952297+05:30	334	Sedimentology and Stratigraphy	3		8	1
494	2019-11-24 18:37:52.972871+05:30	333	Comprehensive Viva Voce	3		8	1
495	2019-11-24 18:37:52.985685+05:30	332	Structural Geology	3		8	1
496	2019-11-24 18:37:53.006189+05:30	331	Igneous Petrology	3		8	1
497	2019-11-24 18:37:53.019137+05:30	330	Geochemistry	3		8	1
498	2019-11-24 18:37:53.039645+05:30	329	Crystallography and Mineralogy	3		8	1
499	2019-11-24 18:37:53.052734+05:30	328	Numerical Techniques and Computer Programming	3		8	1
500	2019-11-24 18:37:53.064907+05:30	327	Comprehensive Viva Voce	3		8	1
501	2019-11-24 18:37:53.086148+05:30	326	Seminar-I	3		8	1
502	2019-11-24 18:37:53.098488+05:30	325	STRONG MOTION SEISMOGRAPH	3		8	1
503	2019-11-24 18:37:53.111573+05:30	324	Geophysical Well logging	3		8	1
504	2019-11-24 18:37:53.123839+05:30	323	Numerical Modelling in Geophysical 	3		8	1
505	2019-11-24 18:37:53.13665+05:30	322	PETROLEUM GEOLOGY	3		8	1
506	2019-11-24 18:37:53.148923+05:30	321	HYDROGEOLOGY	3		8	1
507	2019-11-24 18:37:53.162018+05:30	320	ENGINEERING GEOLOGY	3		8	1
508	2019-11-24 18:37:53.23166+05:30	319	PRINCIPLES OF GIS	3		8	1
509	2019-11-24 18:37:53.244551+05:30	318	PRINCIPLES OF REMOTE SENSING	3		8	1
510	2019-11-24 18:37:53.256996+05:30	317	Technical Communication	3		8	1
511	2019-11-24 18:37:53.269966+05:30	316	ROCK AND SOIL MECHANICS	3		8	1
512	2019-11-24 18:37:53.290421+05:30	315	Seismology	3		8	1
513	2019-11-24 18:37:53.303276+05:30	314	Gravity and Magnetic Prospecting	3		8	1
514	2019-11-24 18:37:53.315873+05:30	313	Economic Geology	3		8	1
515	2019-11-24 18:37:53.336987+05:30	312	Metamorphic Petrology	3		8	1
516	2019-11-24 18:37:53.357951+05:30	311	Structural Geology-II	3		8	1
517	2019-11-24 18:37:53.378595+05:30	310	GEOPHYSICAL PROSPECTING	3		8	1
518	2019-11-24 18:37:53.39152+05:30	309	FIELD THEORY	3		8	1
519	2019-11-24 18:37:53.403996+05:30	308	STRUCTURAL GEOLOGY-I	3		8	1
520	2019-11-24 18:37:53.425075+05:30	307	PALEONTOLOGY	3		8	1
521	2019-11-24 18:37:53.437654+05:30	306	BASIC PETROLOGY	3		8	1
522	2019-11-24 18:37:53.458532+05:30	305	Computer Programming	3		8	1
523	2019-11-24 18:37:53.471003+05:30	304	Introduction to Earth Sciences	3		8	1
524	2019-11-24 18:37:53.483666+05:30	303	Electrical Prospecting	3		8	1
525	2019-11-24 18:37:53.496194+05:30	302	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
526	2019-11-24 18:37:53.509165+05:30	301	SEMINAR	3		8	1
527	2019-11-24 18:37:53.521752+05:30	300	Principles of Seismology	3		8	1
528	2019-11-24 18:37:53.534841+05:30	299	Machine Foundation	3		8	1
529	2019-11-24 18:37:53.555285+05:30	298	Earthquake Resistant Design of Structures	3		8	1
530	2019-11-24 18:37:53.5761+05:30	297	Vulnerability and Risk Analysis	3		8	1
531	2019-11-24 18:37:53.591812+05:30	296	Seismological Modeling and Simulation	3		8	1
532	2019-11-24 18:37:53.604645+05:30	295	Seismic Hazard Assessment	3		8	1
533	2019-11-24 18:37:53.625608+05:30	294	Geotechnical Earthquake Engineering	3		8	1
534	2019-11-24 18:37:53.66994+05:30	663	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
535	2019-11-24 18:37:53.695347+05:30	293	Numerical Methods for Dynamic Systems	3		8	1
536	2019-11-24 18:37:53.789988+05:30	292	Finite Element Method	3		8	1
537	2019-11-24 18:37:53.823987+05:30	662	SEMINAR	3		8	1
538	2019-11-24 18:37:54.051371+05:30	291	Engineering Seismology	3		8	1
539	2019-11-24 18:37:54.267482+05:30	661	On Farm Development	3		8	1
540	2019-11-24 18:37:54.692875+05:30	290	Vibration of Elastic Media	3		8	1
542	2019-11-24 18:37:54.718291+05:30	289	Theory of Vibrations	3		8	1
544	2019-11-24 18:37:54.743676+05:30	288	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
546	2019-11-24 18:37:54.769186+05:30	287	SEMINAR	3		8	1
548	2019-11-24 18:37:54.794397+05:30	286	Advanced Topics in Software Engineering	3		8	1
550	2019-11-24 18:37:54.819696+05:30	285	Lab II (Project Lab)	3		8	1
552	2019-11-24 18:37:54.845303+05:30	284	Lab I (Programming Lab)	3		8	1
554	2019-11-24 18:37:54.870648+05:30	283	Advanced Computer Networks	3		8	1
556	2019-11-24 18:37:54.895576+05:30	282	Advanced Operating Systems	3		8	1
558	2019-11-24 18:37:54.921124+05:30	281	Advanced Algorithms	3		8	1
560	2019-11-24 18:37:54.946312+05:30	280	Training Seminar	3		8	1
562	2019-11-24 18:37:54.971608+05:30	279	B.Tech. Project 	3		8	1
564	2019-11-24 18:37:54.997088+05:30	278	Technical Communication	3		8	1
566	2019-11-24 18:37:55.022222+05:30	277	Computer Network Laboratory	3		8	1
568	2019-11-24 18:37:55.0478+05:30	276	Theory of Computation	3		8	1
570	2019-11-24 18:37:55.072918+05:30	275	Computer Network	3		8	1
572	2019-11-24 18:37:55.098291+05:30	274	DATA STRUCTURE LABORATORY	3		8	1
574	2019-11-24 18:37:55.123493+05:30	273	COMPUTER ARCHITECTURE AND MICROPROCESSORS	3		8	1
576	2019-11-24 18:37:55.149709+05:30	272	Fundamentals of Object Oriented Programming	3		8	1
578	2019-11-24 18:37:55.174812+05:30	271	Introduction to Computer Science and Engineering	3		8	1
580	2019-11-24 18:37:55.200463+05:30	270	Logic and Automated Reasoning	3		8	1
582	2019-11-24 18:37:55.225376+05:30	269	Data Mining and Warehousing	3		8	1
584	2019-11-24 18:37:55.250287+05:30	268	MACHINE LEARNING	3		8	1
586	2019-11-24 18:37:55.276166+05:30	267	ARTIFICIAL INTELLIGENCE	3		8	1
588	2019-11-24 18:37:55.30168+05:30	266	Compiler Design 	3		8	1
590	2019-11-24 18:37:55.326529+05:30	265	Data Base Management Systems	3		8	1
592	2019-11-24 18:37:55.351634+05:30	264	OBJECT ORIENTED ANALYSIS AND DESIGN	3		8	1
594	2019-11-24 18:37:55.376915+05:30	263	Data Structures	3		8	1
596	2019-11-24 18:37:55.402577+05:30	262	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
598	2019-11-24 18:37:55.427957+05:30	261	SEMINAR	3		8	1
600	2019-11-24 18:37:55.453835+05:30	260	Geoinformatics for Landuse  Surveys	3		8	1
602	2019-11-24 18:37:55.479339+05:30	259	Planning, Design and Construction of Rural Roads	3		8	1
604	2019-11-24 18:37:55.505299+05:30	258	Pavement Analysis and Design	3		8	1
606	2019-11-24 18:37:55.529718+05:30	257	Traffic Engineering and Modeling	3		8	1
608	2019-11-24 18:37:55.554978+05:30	256	Modeling, Simulation and Optimization	3		8	1
610	2019-11-24 18:37:55.58038+05:30	255	Free Surface Flows	3		8	1
612	2019-11-24 18:37:55.606028+05:30	254	Advanced Fluid Mechanics	3		8	1
614	2019-11-24 18:37:55.631023+05:30	253	Advanced Hydrology	3		8	1
616	2019-11-24 18:37:55.656409+05:30	252	Soil Dynamics and Machine Foundations	3		8	1
618	2019-11-24 18:37:55.68163+05:30	251	Engineering Behaviour of Rocks	3		8	1
620	2019-11-24 18:37:55.707146+05:30	250	Advanced Soil Mechanics	3		8	1
622	2019-11-24 18:37:55.732093+05:30	249	Advanced Numerical Analysis	3		8	1
624	2019-11-24 18:37:55.756982+05:30	248	FIELD SURVEY CAMP	3		8	1
626	2019-11-24 18:37:55.782606+05:30	247	Principles of Photogrammetry	3		8	1
628	2019-11-24 18:37:55.808256+05:30	246	Surveying Measurements and Adjustments	3		8	1
630	2019-11-24 18:37:55.833569+05:30	245	Environmental Hydraulics	3		8	1
632	2019-11-24 18:37:55.858865+05:30	244	Water Treatment	3		8	1
634	2019-11-24 18:37:55.884933+05:30	243	Environmental Modeling and Simulation	3		8	1
636	2019-11-24 18:37:55.910202+05:30	242	Training Seminar	3		8	1
638	2019-11-24 18:37:55.935433+05:30	241	Advanced Highway Engineering	3		8	1
640	2019-11-24 18:37:55.96095+05:30	240	Advanced Water and Wastewater Treatment	3		8	1
642	2019-11-24 18:37:55.986085+05:30	239	WATER RESOURCE ENGINEERING	3		8	1
644	2019-11-24 18:37:56.011415+05:30	238	B.Tech. Project 	3		8	1
646	2019-11-24 18:37:56.036778+05:30	237	Technical Communication	3		8	1
648	2019-11-24 18:37:56.062071+05:30	236	Design of Reinforced Concrete Elements	3		8	1
650	2019-11-24 18:37:56.087689+05:30	235	Soil Mechanicas	3		8	1
652	2019-11-24 18:37:56.112945+05:30	234	Theory of Structures	3		8	1
654	2019-11-24 18:37:56.137998+05:30	233	ENGINEERING GRAPHICS	3		8	1
656	2019-11-24 18:37:56.163286+05:30	232	Highway and Traffic Engineering	3		8	1
658	2019-11-24 18:37:56.189157+05:30	231	STRUCTURAL ANALYSIS-I	3		8	1
660	2019-11-24 18:37:56.213974+05:30	230	CHANNEL HYDRAULICS	3		8	1
662	2019-11-24 18:37:56.239298+05:30	229	GEOMATICS ENGINEERING-II	3		8	1
664	2019-11-24 18:37:56.264674+05:30	228	Urban Mass Transit Systems	3		8	1
666	2019-11-24 18:37:56.289851+05:30	227	Transportation Planning	3		8	1
668	2019-11-24 18:37:56.50192+05:30	226	Road Traffic Safety	3		8	1
670	2019-11-24 18:37:57.168564+05:30	225	Behaviour & Design of Steel Structures (Autumn)	3		8	1
672	2019-11-24 18:37:57.210624+05:30	224	Industrial and Hazardous Waste Management	3		8	1
674	2019-11-24 18:37:57.23599+05:30	223	Geometric Design	3		8	1
676	2019-11-24 18:37:57.261309+05:30	222	Finite Element Analysis	3		8	1
678	2019-11-24 18:37:57.287104+05:30	221	Structural Dynamics	3		8	1
680	2019-11-24 18:37:57.31242+05:30	220	Advanced Concrete Design	3		8	1
682	2019-11-24 18:37:57.33774+05:30	219	Continuum Mechanics	3		8	1
684	2019-11-24 18:37:57.363056+05:30	218	Matrix Structural Analysis	3		8	1
686	2019-11-24 18:37:57.388445+05:30	217	Geodesy and GPS Surveying	3		8	1
688	2019-11-24 18:37:57.413747+05:30	216	Remote Sensing and  Image Processing	3		8	1
690	2019-11-24 18:37:57.439016+05:30	215	Environmental Chemistry	3		8	1
692	2019-11-24 18:37:57.464337+05:30	214	Wastewater Treatment	3		8	1
694	2019-11-24 18:37:57.489744+05:30	213	Design of Steel Elements	3		8	1
696	2019-11-24 18:37:57.515222+05:30	212	Railway Engineering and Airport Planning	3		8	1
698	2019-11-24 18:37:57.540271+05:30	211	Design of Steel Elements	3		8	1
700	2019-11-24 18:37:57.565586+05:30	210	Waste Water Engineering	3		8	1
702	2019-11-24 18:37:57.590914+05:30	209	Geomatics Engineering – I	3		8	1
704	2019-11-24 18:37:57.616407+05:30	208	Introduction to Environmental Studies	3		8	1
706	2019-11-24 18:37:57.641549+05:30	207	Numerical Methods and Computer Programming	3		8	1
708	2019-11-24 18:37:57.667174+05:30	206	Solid Mechanics	3		8	1
710	2019-11-24 18:37:57.692426+05:30	205	Introduction to Civil Engineering	3		8	1
712	2019-11-24 18:37:57.717627+05:30	204	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
714	2019-11-24 18:37:57.742974+05:30	203	SEMINAR	3		8	1
716	2019-11-24 18:37:57.768488+05:30	202	Training Seminar	3		8	1
541	2019-11-24 18:37:54.705414+05:30	660	Principles and Practices of Irrigation	3		8	1
543	2019-11-24 18:37:54.730557+05:30	659	Design of Irrigation Structures and Drainage Works	3		8	1
545	2019-11-24 18:37:54.757147+05:30	658	Construction Planning and Management	3		8	1
547	2019-11-24 18:37:54.781515+05:30	657	Design of Hydro Mechanical Equipment	3		8	1
549	2019-11-24 18:37:54.806863+05:30	656	Power System Protection Application	3		8	1
551	2019-11-24 18:37:54.831964+05:30	655	Hydropower System Planning	3		8	1
553	2019-11-24 18:37:54.857563+05:30	654	Hydro Generating Equipment	3		8	1
555	2019-11-24 18:37:54.883062+05:30	653	Applied Hydrology	3		8	1
557	2019-11-24 18:37:54.908285+05:30	652	Water Resources Planning and Management	3		8	1
559	2019-11-24 18:37:54.933816+05:30	651	Design of Water Resources Structures	3		8	1
561	2019-11-24 18:37:54.958847+05:30	650	System Design Techniques	3		8	1
563	2019-11-24 18:37:54.984983+05:30	649	MATHEMATICAL AND COMPUTATIONAL TECHNIQUES	3		8	1
565	2019-11-24 18:37:55.009856+05:30	648	Experimental Techniques	3		8	1
567	2019-11-24 18:37:55.035171+05:30	647	Laboratory Work in Photonics	3		8	1
569	2019-11-24 18:37:55.060467+05:30	646	Semiconductor Device Physics	3		8	1
571	2019-11-24 18:37:55.08579+05:30	645	Computational Techniques and Programming	3		8	1
573	2019-11-24 18:37:55.111147+05:30	644	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
575	2019-11-24 18:37:55.137464+05:30	643	SEMINAR	3		8	1
577	2019-11-24 18:37:55.162422+05:30	642	SEMINAR	3		8	1
579	2019-11-24 18:37:55.187842+05:30	641	Numerical Analysis & Computer Programming	3		8	1
581	2019-11-24 18:37:55.213063+05:30	640	Semiconductor Photonics	3		8	1
583	2019-11-24 18:37:55.237941+05:30	639	Quantum Theory of Solids	3		8	1
585	2019-11-24 18:37:55.263092+05:30	638	A Primer in Quantum Field Theory	3		8	1
587	2019-11-24 18:37:55.289177+05:30	637	Advanced Characterization Techniques	3		8	1
589	2019-11-24 18:37:55.314045+05:30	636	Advanced Nuclear Physics	3		8	1
591	2019-11-24 18:37:55.339152+05:30	635	Advanced Laser Physics	3		8	1
593	2019-11-24 18:37:55.364668+05:30	634	Advanced Condensed Matter Physics	3		8	1
595	2019-11-24 18:37:55.390412+05:30	633	DISSERTATION STAGE-I	3		8	1
597	2019-11-24 18:37:55.416127+05:30	632	SEMICONDUCTOR DEVICES AND APPLICATIONS	3		8	1
599	2019-11-24 18:37:55.440928+05:30	631	Classical Mechanics	3		8	1
601	2019-11-24 18:37:55.466165+05:30	630	Mathematical Physics	3		8	1
603	2019-11-24 18:37:55.491474+05:30	629	Quantum Mechanics – I	3		8	1
605	2019-11-24 18:37:55.516737+05:30	628	Training Seminar	3		8	1
607	2019-11-24 18:37:55.5421+05:30	627	B.Tech. Project	3		8	1
609	2019-11-24 18:37:55.567822+05:30	626	Nuclear Astrophysics	3		8	1
611	2019-11-24 18:37:55.592834+05:30	625	Techincal Communication	3		8	1
613	2019-11-24 18:37:55.618559+05:30	624	Laser & Photonics	3		8	1
615	2019-11-24 18:37:55.643539+05:30	623	Signals and Systems	3		8	1
617	2019-11-24 18:37:55.668884+05:30	622	Numerical Analysis and Computational Physics	3		8	1
619	2019-11-24 18:37:55.694349+05:30	621	Applied Instrumentation	3		8	1
621	2019-11-24 18:37:55.719364+05:30	620	Lab-based Project	3		8	1
623	2019-11-24 18:37:55.7442+05:30	619	Microprocessors and Peripheral Devices	3		8	1
625	2019-11-24 18:37:55.76971+05:30	618	Mathematical Physics	3		8	1
627	2019-11-24 18:37:55.795335+05:30	617	Mechanics and Relativity	3		8	1
629	2019-11-24 18:37:55.820981+05:30	616	Atomic Molecular and Laser Physics	3		8	1
631	2019-11-24 18:37:55.845928+05:30	615	Computer Programming	3		8	1
633	2019-11-24 18:37:55.871694+05:30	614	Introduction to Physical Science	3		8	1
635	2019-11-24 18:37:55.897314+05:30	613	Modern Physics	3		8	1
637	2019-11-24 18:37:55.923094+05:30	612	QUARK GLUON PLASMA & FINITE TEMPERATURE FIELD THEORY	3		8	1
639	2019-11-24 18:37:55.948419+05:30	611	Optical Electronics	3		8	1
641	2019-11-24 18:37:55.973706+05:30	610	Semiconductor Materials and Devices	3		8	1
643	2019-11-24 18:37:55.999205+05:30	609	Laboratory Work	3		8	1
645	2019-11-24 18:37:56.024376+05:30	608	Weather Forecasting	3		8	1
647	2019-11-24 18:37:56.04972+05:30	607	Advanced Atmospheric Physics	3		8	1
649	2019-11-24 18:37:56.075039+05:30	606	Physics of Earth’s Atmosphere	3		8	1
651	2019-11-24 18:37:56.100344+05:30	605	Classical Electrodynamics	3		8	1
653	2019-11-24 18:37:56.125692+05:30	604	Laboratory Work	3		8	1
655	2019-11-24 18:37:56.15115+05:30	603	QUANTUM INFORMATION AND COMPUTING	3		8	1
657	2019-11-24 18:37:56.176371+05:30	602	Plasma Physics and Applications	3		8	1
659	2019-11-24 18:37:56.201852+05:30	601	Applied Optics	3		8	1
661	2019-11-24 18:37:56.227103+05:30	600	Quantum Physics	3		8	1
663	2019-11-24 18:37:56.252374+05:30	599	Engineering Analysis Design	3		8	1
665	2019-11-24 18:37:56.27763+05:30	598	Quantum Mechanics and Statistical Mechanics	3		8	1
667	2019-11-24 18:37:56.302994+05:30	597	Electrodynamics and Optics	3		8	1
669	2019-11-24 18:37:57.150393+05:30	596	Applied Physics	3		8	1
671	2019-11-24 18:37:57.182029+05:30	595	Electromagnetic Field Theory	3		8	1
673	2019-11-24 18:37:57.223507+05:30	594	Mechanics	3		8	1
675	2019-11-24 18:37:57.249255+05:30	593	Advanced Atmospheric Physics	3		8	1
677	2019-11-24 18:37:57.274215+05:30	592	Elements of Nuclear and  Particle Physics	3		8	1
679	2019-11-24 18:37:57.29946+05:30	591	Physics of Earth’s Atmosphere	3		8	1
681	2019-11-24 18:37:57.325007+05:30	590	Computational Physics	3		8	1
683	2019-11-24 18:37:57.350457+05:30	589	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
685	2019-11-24 18:37:57.375475+05:30	588	SEMINAR	3		8	1
687	2019-11-24 18:37:57.400928+05:30	587	Converting Processes for Packaging	3		8	1
689	2019-11-24 18:37:57.426099+05:30	586	Printing Technology	3		8	1
691	2019-11-24 18:37:57.451596+05:30	585	Packaging Materials	3		8	1
693	2019-11-24 18:37:57.477086+05:30	584	Packaging Principles, Processes and Sustainability	3		8	1
695	2019-11-24 18:37:57.502084+05:30	583	Process Instrumentation  and Control	3		8	1
697	2019-11-24 18:37:57.527381+05:30	582	Advanced Numerical Methods and Statistics	3		8	1
699	2019-11-24 18:37:57.552732+05:30	581	Paper Proprieties and Stock Preparation	3		8	1
701	2019-11-24 18:37:57.578068+05:30	580	Chemical Recovery Process	3		8	1
703	2019-11-24 18:37:57.6037+05:30	579	Pulping	3		8	1
705	2019-11-24 18:37:57.628894+05:30	578	Printing Technology	3		8	1
707	2019-11-24 18:37:57.653824+05:30	577	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
709	2019-11-24 18:37:57.679306+05:30	576	SEMINAR	3		8	1
711	2019-11-24 18:37:57.704654+05:30	575	Numerical Methods in Manufacturing	3		8	1
713	2019-11-24 18:37:57.730009+05:30	574	Non-Traditional Machining Processes	3		8	1
715	2019-11-24 18:37:57.755247+05:30	573	Materials Management	3		8	1
717	2019-11-24 18:37:57.781067+05:30	572	Machine Tool Design and Numerical Control	3		8	1
719	2019-11-24 18:37:57.806394+05:30	571	Design for Manufacturability	3		8	1
721	2019-11-24 18:37:57.83186+05:30	570	Advanced Manufacturing Processes	3		8	1
723	2019-11-24 18:37:57.856866+05:30	569	Quality Management	3		8	1
725	2019-11-24 18:37:57.881773+05:30	568	Operations Management	3		8	1
727	2019-11-24 18:37:57.907157+05:30	567	Computer Aided Design	3		8	1
729	2019-11-24 18:37:57.933371+05:30	566	Advanced Mechanics of Solids	3		8	1
731	2019-11-24 18:37:57.9588+05:30	565	Dynamics of Mechanical Systems	3		8	1
733	2019-11-24 18:37:57.984276+05:30	564	Micro and Nano Scale Thermal Engineering	3		8	1
735	2019-11-24 18:37:58.009637+05:30	563	Hydro-dynamic Machines	3		8	1
737	2019-11-24 18:37:58.054568+05:30	562	Solar Energy	3		8	1
739	2019-11-24 18:37:58.085517+05:30	561	Advanced Heat Transfer	3		8	1
741	2019-11-24 18:37:58.11085+05:30	560	Advanced Fluid Mechanics	3		8	1
743	2019-11-24 18:37:58.136202+05:30	559	Advanced Thermodynamics	3		8	1
745	2019-11-24 18:37:58.161477+05:30	558	Modeling and Simulation	3		8	1
747	2019-11-24 18:37:58.187285+05:30	557	Modeling and Simulation	3		8	1
749	2019-11-24 18:37:58.212083+05:30	556	Robotics and Control	3		8	1
751	2019-11-24 18:37:58.237541+05:30	555	Training Seminar	3		8	1
753	2019-11-24 18:37:58.262743+05:30	554	B.Tech. Project 	3		8	1
755	2019-11-24 18:37:58.288288+05:30	553	Technical Communication	3		8	1
757	2019-11-24 18:37:58.313653+05:30	552	Refrigeration and Air-Conditioning	3		8	1
759	2019-11-24 18:37:58.338749+05:30	551	Industrial Management	3		8	1
761	2019-11-24 18:37:58.364042+05:30	550	Vibration  and Noise	3		8	1
763	2019-11-24 18:37:58.389468+05:30	549	Operations Research	3		8	1
765	2019-11-24 18:37:58.414619+05:30	548	Principles of Industrial Enigneering	3		8	1
767	2019-11-24 18:37:58.440163+05:30	547	Dynamics of Machines	3		8	1
769	2019-11-24 18:37:58.465458+05:30	546	THEORY OF MACHINES	3		8	1
771	2019-11-24 18:37:58.49057+05:30	545	Energy Conversion	3		8	1
773	2019-11-24 18:37:58.515925+05:30	544	THERMAL ENGINEERING	3		8	1
775	2019-11-24 18:37:58.541177+05:30	543	FLUID MECHANICS	3		8	1
777	2019-11-24 18:37:58.566499+05:30	542	MANUFACTURING TECHNOLOGY-II	3		8	1
779	2019-11-24 18:37:58.591813+05:30	541	KINEMATICS OF MACHINES	3		8	1
781	2019-11-24 18:37:58.617228+05:30	540	Non-Conventional Welding Processes	3		8	1
783	2019-11-24 18:37:58.642458+05:30	539	Smart Materials, Structures, and Devices	3		8	1
785	2019-11-24 18:37:58.668119+05:30	538	Advanced Mechanical Vibrations	3		8	1
787	2019-11-24 18:37:58.693852+05:30	537	Finite Element Methods	3		8	1
789	2019-11-24 18:37:58.719648+05:30	536	Computer Aided Mechanism Design	3		8	1
791	2019-11-24 18:37:58.745185+05:30	535	Computational Fluid Dynamics & Heat Transfer	3		8	1
793	2019-11-24 18:37:58.770611+05:30	534	Instrumentation and Experimental Methods	3		8	1
795	2019-11-24 18:37:58.999012+05:30	533	Power Plants	3		8	1
797	2019-11-24 18:37:59.575428+05:30	532	Work System Desing	3		8	1
799	2019-11-24 18:37:59.601018+05:30	531	Theory of Production Processes-II	3		8	1
801	2019-11-24 18:37:59.625635+05:30	530	Heat and Mass Transfer	3		8	1
803	2019-11-24 18:37:59.65129+05:30	529	Machine Design	3		8	1
805	2019-11-24 18:37:59.676505+05:30	528	 Lab Based Project 	3		8	1
807	2019-11-24 18:37:59.701738+05:30	527	ENGINEERING ANALYSIS AND DESIGN	3		8	1
809	2019-11-24 18:37:59.727162+05:30	526	Theory of Production Processes - I	3		8	1
811	2019-11-24 18:37:59.75235+05:30	525	Fluid Mechanics	3		8	1
813	2019-11-24 18:37:59.77759+05:30	524	Mechanical Engineering Drawing	3		8	1
815	2019-11-24 18:37:59.803215+05:30	523	Engineering Thermodynamics	3		8	1
817	2019-11-24 18:37:59.828205+05:30	522	Programming and Data Structure	3		8	1
819	2019-11-24 18:37:59.853468+05:30	521	Introduction to Production and Industrial Engineering	3		8	1
821	2019-11-24 18:37:59.87877+05:30	520	Introduction to Mechanical Engineering	3		8	1
823	2019-11-24 18:37:59.905647+05:30	519	Advanced Manufacturing Processes	3		8	1
825	2019-11-24 18:37:59.958036+05:30	518	ADVANCED NUMERICAL ANALYSIS	3		8	1
827	2019-11-24 18:37:59.979477+05:30	517	SELECTED TOPICS IN ANALYSIS	3		8	1
829	2019-11-24 18:38:00.005973+05:30	516	SEMINAR	3		8	1
831	2019-11-24 18:38:00.030024+05:30	515	Seminar	3		8	1
833	2019-11-24 18:38:00.055816+05:30	514	Orthogonal Polynomials and Special Functions	3		8	1
835	2019-11-24 18:38:00.081122+05:30	513	Financial Mathematics	3		8	1
837	2019-11-24 18:38:00.106639+05:30	512	Dynamical Systems	3		8	1
839	2019-11-24 18:38:00.132089+05:30	511	CONTROL THEORY	3		8	1
841	2019-11-24 18:38:00.15712+05:30	510	Coding Theory	3		8	1
843	2019-11-24 18:38:00.182265+05:30	509	Advanced Numerical Analysis	3		8	1
845	2019-11-24 18:38:00.207581+05:30	508	Mathematical Statistics	3		8	1
847	2019-11-24 18:38:00.233372+05:30	507	SEMINAR	3		8	1
849	2019-11-24 18:38:00.258306+05:30	506	OPERATIONS RESEARCH	3		8	1
851	2019-11-24 18:38:00.283419+05:30	505	FUNCTIONAL ANALYSIS	3		8	1
853	2019-11-24 18:38:00.309021+05:30	504	Functional Analysis	3		8	1
855	2019-11-24 18:38:00.334556+05:30	503	Tensors and Differential Geometry	3		8	1
857	2019-11-24 18:38:00.359059+05:30	502	Fluid Dynamics	3		8	1
859	2019-11-24 18:38:00.384649+05:30	501	Mathematics	3		8	1
861	2019-11-24 18:38:00.409844+05:30	500	SOFT COMPUTING	3		8	1
863	2019-11-24 18:38:00.435534+05:30	499	Complex Analysis	3		8	1
865	2019-11-24 18:38:00.461131+05:30	498	Computer Programming	3		8	1
867	2019-11-24 18:38:00.486439+05:30	497	Abstract Algebra	3		8	1
869	2019-11-24 18:38:00.512034+05:30	496	Topology	3		8	1
871	2019-11-24 18:38:00.537507+05:30	495	Real Analysis	3		8	1
873	2019-11-24 18:38:00.562611+05:30	494	Theory of Ordinary Differential Equations	3		8	1
875	2019-11-24 18:38:00.588031+05:30	493	Complex Analysis-II	3		8	1
877	2019-11-24 18:38:00.613385+05:30	492	Theory of Partial Differential Equations	3		8	1
879	2019-11-24 18:38:00.638564+05:30	491	Topology	3		8	1
881	2019-11-24 18:38:00.664484+05:30	490	Real Analysis-II	3		8	1
883	2019-11-24 18:38:00.68986+05:30	489	THEORY OF ORDINARY DIFFERENTIAL EQUATIONS	3		8	1
885	2019-11-24 18:38:00.715046+05:30	488	Technical Communication	3		8	1
887	2019-11-24 18:38:00.74054+05:30	487	MATHEMATICAL IMAGING TECHNOLOGY	3		8	1
889	2019-11-24 18:38:00.766047+05:30	486	Linear Programming	3		8	1
891	2019-11-24 18:38:00.791264+05:30	485	Mathematical Statistics	3		8	1
893	2019-11-24 18:38:00.816858+05:30	484	Abstract Algebra-I	3		8	1
895	2019-11-24 18:38:00.849989+05:30	483	DESIGN AND ANALYSIS OF ALGORITHMS	3		8	1
897	2019-11-24 18:38:00.875273+05:30	482	ORDINARY AND PARTIAL DIFFERENTIAL EQUATIONS	3		8	1
899	2019-11-24 18:38:00.900988+05:30	481	DISCRETE MATHEMATICS	3		8	1
718	2019-11-24 18:37:57.79373+05:30	201	B.Tech. Project 	3		8	1
720	2019-11-24 18:37:57.818837+05:30	200	Technical Communication	3		8	1
722	2019-11-24 18:37:57.8442+05:30	199	Process Integration	3		8	1
724	2019-11-24 18:37:57.869103+05:30	198	Optimization of Chemical Enigneering Processes	3		8	1
726	2019-11-24 18:37:57.894334+05:30	197	Process Utilities and Safety 	3		8	1
728	2019-11-24 18:37:57.91974+05:30	196	Process Equipment Design*	3		8	1
730	2019-11-24 18:37:57.945678+05:30	195	Process Dynamics and Control	3		8	1
732	2019-11-24 18:37:57.971269+05:30	194	Fluid and Fluid Particle Mechanics	3		8	1
734	2019-11-24 18:37:57.996735+05:30	193	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
736	2019-11-24 18:37:58.022235+05:30	192	Chemical Technology	3		8	1
738	2019-11-24 18:37:58.072676+05:30	191	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
740	2019-11-24 18:37:58.098013+05:30	190	MECHANICAL OPERATION	3		8	1
742	2019-11-24 18:37:58.123245+05:30	189	HEAT TRANSFER	3		8	1
744	2019-11-24 18:37:58.148444+05:30	188	SEMINAR	3		8	1
746	2019-11-24 18:37:58.173877+05:30	187	COMPUTATIONAL FLUID DYNAMICS	3		8	1
748	2019-11-24 18:37:58.199482+05:30	186	Biochemical Engineering	3		8	1
750	2019-11-24 18:37:58.224826+05:30	185	Advanced Reaction Engineering	3		8	1
752	2019-11-24 18:37:58.250528+05:30	184	Advanced Transport Phenomena	3		8	1
754	2019-11-24 18:37:58.275684+05:30	183	Mathematical Methods in Chemical Engineering 	3		8	1
756	2019-11-24 18:37:58.30112+05:30	182	Waste to Energy	3		8	1
758	2019-11-24 18:37:58.326308+05:30	181	Polymer Physics and Rheology*	3		8	1
760	2019-11-24 18:37:58.351585+05:30	180	Fluidization Engineering	3		8	1
762	2019-11-24 18:37:58.376941+05:30	179	Computer Application in Chemical Engineering	3		8	1
764	2019-11-24 18:37:58.402316+05:30	178	Enginering Analysis and Process Modeling	3		8	1
766	2019-11-24 18:37:58.427542+05:30	177	Mass Transfer-II	3		8	1
768	2019-11-24 18:37:58.453136+05:30	176	Mass Transfer -I	3		8	1
770	2019-11-24 18:37:58.478161+05:30	175	Computer Programming and Numerical Methods	3		8	1
772	2019-11-24 18:37:58.503525+05:30	174	Material and Energy Balance	3		8	1
774	2019-11-24 18:37:58.528875+05:30	173	Introduction to Chemical  Engineering	3		8	1
776	2019-11-24 18:37:58.554547+05:30	172	Advanced Thermodynamics and Molecular Simulations	3		8	1
778	2019-11-24 18:37:58.579397+05:30	171	DISSERTATION STAGE I	3		8	1
780	2019-11-24 18:37:58.604885+05:30	170	SEMINAR	3		8	1
782	2019-11-24 18:37:58.6301+05:30	169	ADVANCED TRANSPORT PROCESS	3		8	1
784	2019-11-24 18:37:58.655453+05:30	168	RECOMBINANT DNA TECHNOLOGY	3		8	1
786	2019-11-24 18:37:58.68177+05:30	167	REACTION KINETICS AND REACTOR DESIGN	3		8	1
788	2019-11-24 18:37:58.706673+05:30	166	MICROBIOLOGY AND BIOCHEMISTRY	3		8	1
790	2019-11-24 18:37:58.732422+05:30	165	Chemical Genetics and Drug Discovery	3		8	1
792	2019-11-24 18:37:58.757377+05:30	164	Structural Biology	3		8	1
794	2019-11-24 18:37:58.783133+05:30	163	Genomics and Proteomics	3		8	1
796	2019-11-24 18:37:59.181958+05:30	162	Vaccine Development & Production	3		8	1
798	2019-11-24 18:37:59.587455+05:30	161	Cell & Tissue Culture Technology	3		8	1
800	2019-11-24 18:37:59.612813+05:30	160	Biotechnology Laboratory – III	3		8	1
802	2019-11-24 18:37:59.638094+05:30	159	Seminar	3		8	1
804	2019-11-24 18:37:59.663363+05:30	158	Genetic Engineering	3		8	1
806	2019-11-24 18:37:59.688737+05:30	157	Biophysical Techniques	3		8	1
808	2019-11-24 18:37:59.713985+05:30	156	DOWNSTREAM PROCESSING	3		8	1
810	2019-11-24 18:37:59.73942+05:30	155	BIOREACTION ENGINEERING 	3		8	1
812	2019-11-24 18:37:59.764714+05:30	154	Technical  Communication	3		8	1
814	2019-11-24 18:37:59.789941+05:30	153	Cell & Developmental Biology	3		8	1
816	2019-11-24 18:37:59.815262+05:30	152	Genetics & Molecular Biology	3		8	1
818	2019-11-24 18:37:59.840636+05:30	151	Applied Microbiology	3		8	1
820	2019-11-24 18:37:59.866184+05:30	150	Biotechnology Laboratory – I	3		8	1
822	2019-11-24 18:37:59.891252+05:30	149	Biochemistry	3		8	1
824	2019-11-24 18:37:59.94149+05:30	148	Training Seminar	3		8	1
826	2019-11-24 18:37:59.967597+05:30	147	Drug Designing	3		8	1
828	2019-11-24 18:37:59.991665+05:30	146	Protein Engineering	3		8	1
830	2019-11-24 18:38:00.017366+05:30	145	Genomics and Proteomics	3		8	1
832	2019-11-24 18:38:00.043327+05:30	144	B.Tech. Project 	3		8	1
834	2019-11-24 18:38:00.068857+05:30	143	Technical Communication	3		8	1
836	2019-11-24 18:38:00.094102+05:30	142	CELL AND TISSUE ENGINEERING	3		8	1
838	2019-11-24 18:38:00.119565+05:30	141	IMMUNOTECHNOLOGY	3		8	1
840	2019-11-24 18:38:00.144961+05:30	140	GENETICS AND MOLECULAR BIOLOGY	3		8	1
842	2019-11-24 18:38:00.170575+05:30	139	Computer Programming	3		8	1
844	2019-11-24 18:38:00.195252+05:30	138	Introduction to Biotechnology	3		8	1
846	2019-11-24 18:38:00.220552+05:30	137	Molecular Biophysics	3		8	1
848	2019-11-24 18:38:00.246016+05:30	136	Animal Biotechnology	3		8	1
850	2019-11-24 18:38:00.271094+05:30	135	Plant Biotechnology	3		8	1
852	2019-11-24 18:38:00.296492+05:30	134	Bioseparation  Engineering	3		8	1
854	2019-11-24 18:38:00.321727+05:30	133	Bioprocess Engineering	3		8	1
856	2019-11-24 18:38:00.346638+05:30	132	Chemical Kinetics and Reactor Design	3		8	1
858	2019-11-24 18:38:00.372489+05:30	131	BIOINFORMATICS	3		8	1
860	2019-11-24 18:38:00.397391+05:30	130	MICROBIOLOGY	3		8	1
862	2019-11-24 18:38:00.423024+05:30	129	Professional Training	3		8	1
864	2019-11-24 18:38:00.448738+05:30	128	Planning  Studio-III	3		8	1
866	2019-11-24 18:38:00.473738+05:30	127	DISSERTATION STAGE-I	3		8	1
868	2019-11-24 18:38:00.499173+05:30	126	Professional Training	3		8	1
870	2019-11-24 18:38:00.524424+05:30	125	Design Studio-III	3		8	1
872	2019-11-24 18:38:00.549901+05:30	124	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
874	2019-11-24 18:38:00.574965+05:30	123	Housing	3		8	1
876	2019-11-24 18:38:00.600762+05:30	122	Planning Theory and Techniques	3		8	1
878	2019-11-24 18:38:00.625666+05:30	121	Ecology and Sustainable Development	3		8	1
880	2019-11-24 18:38:00.650955+05:30	120	Infrastructure Planning	3		8	1
882	2019-11-24 18:38:00.677084+05:30	119	Socio Economics, Demography and Quantitative Techniques	3		8	1
884	2019-11-24 18:38:00.702245+05:30	118	Planning Studio-I	3		8	1
886	2019-11-24 18:38:00.727516+05:30	117	Computer Applications in Architecture	3		8	1
888	2019-11-24 18:38:00.752998+05:30	116	Advanced Building Technologies	3		8	1
890	2019-11-24 18:38:00.778228+05:30	115	Urban Design	3		8	1
892	2019-11-24 18:38:00.80356+05:30	114	Contemporary Architecture- Theories and Trends	3		8	1
894	2019-11-24 18:38:00.828975+05:30	113	Design Studio-I	3		8	1
896	2019-11-24 18:38:00.8622+05:30	112	Live Project/Studio/Seminar-II	3		8	1
898	2019-11-24 18:38:00.888228+05:30	111	Vastushastra	3		8	1
900	2019-11-24 18:38:00.91297+05:30	110	Hill Architecture	3		8	1
902	2019-11-24 18:38:00.938433+05:30	109	Urban  Planning	3		8	1
904	2019-11-24 18:38:00.963577+05:30	108	Thesis Project I	3		8	1
906	2019-11-24 18:38:00.989421+05:30	107	Architectural Design-VII	3		8	1
908	2019-11-24 18:38:01.015636+05:30	106	Live Project/ Studio/ Seminar-I	3		8	1
910	2019-11-24 18:38:01.040094+05:30	105	Ekistics 	3		8	1
912	2019-11-24 18:38:01.122855+05:30	104	Working Drawing	3		8	1
914	2019-11-24 18:38:01.14787+05:30	103	Sustainable Architecture	3		8	1
916	2019-11-24 18:38:01.173354+05:30	102	Urban Design	3		8	1
918	2019-11-24 18:38:01.198431+05:30	101	Architectural Design-VI	3		8	1
920	2019-11-24 18:38:01.224007+05:30	100	MODERN INDIAN ARCHITECTURE	3		8	1
922	2019-11-24 18:38:01.249822+05:30	99	Interior Design 	3		8	1
924	2019-11-24 18:38:01.27444+05:30	98	Computer Applications in Architecture	3		8	1
926	2019-11-24 18:38:01.60747+05:30	97	Building Construction-IV	3		8	1
928	2019-11-24 18:38:02.054652+05:30	96	Architectural Design-IV	3		8	1
930	2019-11-24 18:38:02.194271+05:30	95	MEASURED DRAWING CAMP	3		8	1
932	2019-11-24 18:38:02.219762+05:30	94	PRICIPLES OF ARCHITECTURE	3		8	1
934	2019-11-24 18:38:02.244909+05:30	93	STRUCTURE AND ARCHITECTURE	3		8	1
936	2019-11-24 18:38:02.27068+05:30	92	QUANTITY, PRICING AND SPECIFICATIONS	3		8	1
938	2019-11-24 18:38:02.29605+05:30	91	HISTORY OF ARCHITECTUTRE I	3		8	1
940	2019-11-24 18:38:02.32142+05:30	90	BUILDING CONSTRUCTION II	3		8	1
942	2019-11-24 18:38:02.346741+05:30	89	Architectural Design-III	3		8	1
944	2019-11-24 18:38:02.371922+05:30	88	ARCHITECTURAL DESIGN II	3		8	1
946	2019-11-24 18:38:02.397356+05:30	87	Basic Design and Creative Workshop I	3		8	1
948	2019-11-24 18:38:02.422658+05:30	86	Architectural Graphics I	3		8	1
950	2019-11-24 18:38:02.448099+05:30	85	Visual Art I	3		8	1
952	2019-11-24 18:38:02.485352+05:30	84	Introduction to Architecture	3		8	1
954	2019-11-24 18:38:02.509977+05:30	83	SEMINAR	3		8	1
956	2019-11-24 18:38:02.535474+05:30	82	Regional Planning	3		8	1
958	2019-11-24 18:38:02.561047+05:30	81	Planning Legislation and Governance	3		8	1
960	2019-11-24 18:38:02.586641+05:30	80	Modern World Architecture	3		8	1
962	2019-11-24 18:38:02.620038+05:30	79	SEMINAR	3		8	1
964	2019-11-24 18:38:02.645351+05:30	78	Advanced Characterization Techniques	3		8	1
901	2019-11-24 18:38:00.925815+05:30	480	Introduction to Computer Programming	3		8	1
903	2019-11-24 18:38:00.95169+05:30	479	Mathematics-I	3		8	1
905	2019-11-24 18:38:00.976522+05:30	478	Numerical Methods, Probability and Statistics	3		8	1
907	2019-11-24 18:38:01.001921+05:30	477	Optimization Techniques	3		8	1
909	2019-11-24 18:38:01.027173+05:30	476	Probability and Statistics	3		8	1
911	2019-11-24 18:38:01.052243+05:30	475	MEASURE THEORY	3		8	1
913	2019-11-24 18:38:01.134784+05:30	474	Statistical Inference	3		8	1
915	2019-11-24 18:38:01.160324+05:30	473	COMPLEX ANALYSIS-I	3		8	1
917	2019-11-24 18:38:01.185756+05:30	472	Real Analysis I	3		8	1
919	2019-11-24 18:38:01.210956+05:30	471	Introduction to Mathematical Sciences	3		8	1
921	2019-11-24 18:38:01.23676+05:30	470	Probability and Statistics	3		8	1
923	2019-11-24 18:38:01.261592+05:30	469	Mathematical Methods	3		8	1
925	2019-11-24 18:38:01.441161+05:30	468	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
927	2019-11-24 18:38:02.017536+05:30	467	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
929	2019-11-24 18:38:02.124324+05:30	466	SEMINAR	3		8	1
931	2019-11-24 18:38:02.207299+05:30	465	Watershed modeling and simulation	3		8	1
933	2019-11-24 18:38:02.23309+05:30	464	Soil and groundwater contamination modelling	3		8	1
935	2019-11-24 18:38:02.25782+05:30	463	Experimental hydrology	3		8	1
937	2019-11-24 18:38:02.28337+05:30	462	Remote sensing and GIS applications	3		8	1
939	2019-11-24 18:38:02.308429+05:30	461	Environmental quality	3		8	1
941	2019-11-24 18:38:02.333814+05:30	460	Watershed Behavior and Conservation Practices	3		8	1
943	2019-11-24 18:38:02.359278+05:30	459	Geophysical investigations	3		8	1
945	2019-11-24 18:38:02.384439+05:30	458	Groundwater hydrology	3		8	1
947	2019-11-24 18:38:02.409744+05:30	457	Stochastic hydrology	3		8	1
949	2019-11-24 18:38:02.435098+05:30	456	Irrigation and drainage engineering	3		8	1
951	2019-11-24 18:38:02.455979+05:30	455	Engineering Hydrology	3		8	1
953	2019-11-24 18:38:02.497123+05:30	454	RESEARCH METHODOLOGY IN LANGUAGE & LITERATURE	3		8	1
955	2019-11-24 18:38:02.522812+05:30	453	RESEARCH METHODOLOGY IN SOCIAL SCIENCES	3		8	1
957	2019-11-24 18:38:02.547773+05:30	452	UNDERSTANDING PERSONLALITY	3		8	1
959	2019-11-24 18:38:02.573384+05:30	451	SEMINAR	3		8	1
961	2019-11-24 18:38:02.608011+05:30	450	Advanced Topics in Growth Theory	3		8	1
963	2019-11-24 18:38:02.632739+05:30	449	Ecological Economics	3		8	1
965	2019-11-24 18:38:02.657618+05:30	448	Introduction to Research Methodology	3		8	1
966	2019-11-24 18:38:02.691196+05:30	447	Issues in Indian Economy	3		8	1
967	2019-11-24 18:38:02.709227+05:30	446	PUBLIC POLICY; THEORY AND PRACTICE	3		8	1
968	2019-11-24 18:38:02.726634+05:30	445	ADVANCED ECONOMETRICS	3		8	1
969	2019-11-24 18:38:02.737809+05:30	444	MONEY, BANKING AND FINANCIAL MARKETS	3		8	1
970	2019-11-24 18:38:02.749872+05:30	443	DEVELOPMENT ECONOMICS	3		8	1
971	2019-11-24 18:38:02.762279+05:30	442	MATHEMATICS FOR ECONOMISTS	3		8	1
972	2019-11-24 18:38:02.774723+05:30	441	MACROECONOMICS I	3		8	1
973	2019-11-24 18:38:02.800504+05:30	440	MICROECONOMICS I	3		8	1
974	2019-11-24 18:38:02.812962+05:30	439	HSN-01	3		8	1
975	2019-11-24 18:38:02.825781+05:30	438	UNDERSTANDING PERSONALITY	3		8	1
976	2019-11-24 18:38:02.838665+05:30	437	Sociology	3		8	1
977	2019-11-24 18:38:02.851325+05:30	436	Economics	3		8	1
978	2019-11-24 18:38:02.864822+05:30	435	Technical Communication	3		8	1
979	2019-11-24 18:38:02.877199+05:30	434	Society,Culture Built Environment	3		8	1
980	2019-11-24 18:38:02.890055+05:30	433	Introduction to Psychology	3		8	1
981	2019-11-24 18:38:02.902615+05:30	432	Communication Skills(Advance)	3		8	1
982	2019-11-24 18:38:02.915574+05:30	431	Communication Skills(Basic)	3		8	1
983	2019-11-24 18:38:02.927733+05:30	430	Technical Communication	3		8	1
984	2019-11-24 18:38:02.940862+05:30	429	Communication skills (Basic)	3		8	1
985	2019-11-24 18:38:02.953561+05:30	428	DISSERTATION STAGE-II (CONTINUED FROM III SEMESTER)	3		8	1
986	2019-11-24 18:38:02.966248+05:30	427	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
987	2019-11-24 18:38:02.978872+05:30	426	SEMINAR	3		8	1
988	2019-11-24 18:38:02.991499+05:30	425	Analog VLSI Circuit Design	3		8	1
989	2019-11-24 18:38:03.004722+05:30	424	Digital System Design	3		8	1
990	2019-11-24 18:38:03.017214+05:30	423	Simulation Lab-1	3		8	1
991	2019-11-24 18:38:03.029686+05:30	422	Microelectronics Lab-1	3		8	1
992	2019-11-24 18:38:03.046759+05:30	421	Digital VLSI Circuit Design	3		8	1
993	2019-11-24 18:38:03.072009+05:30	420	MOS Device Physics	3		8	1
994	2019-11-24 18:38:03.084759+05:30	419	Microwave and Millimeter Wave Circuits	3		8	1
995	2019-11-24 18:38:03.097383+05:30	418	Antenna Theory & Design	3		8	1
996	2019-11-24 18:38:03.109706+05:30	417	Advanced EMFT	3		8	1
997	2019-11-24 18:38:03.122641+05:30	416	Microwave Engineering	3		8	1
998	2019-11-24 18:38:03.134983+05:30	415	Microwave Lab	3		8	1
999	2019-11-24 18:38:03.148149+05:30	414	Telecommunication Networks	3		8	1
1000	2019-11-24 18:38:03.160403+05:30	413	Information and Communication Theory	3		8	1
1001	2019-11-24 18:38:03.173097+05:30	412	Digital Communication Systems	3		8	1
1002	2019-11-24 18:38:03.18557+05:30	411	Laboratory	3		8	1
1003	2019-11-24 18:38:03.198115+05:30	410	Training Seminar	3		8	1
1004	2019-11-24 18:38:03.21077+05:30	409	B.Tech. Project 	3		8	1
1005	2019-11-24 18:38:03.231997+05:30	408	Technical Communication	3		8	1
1006	2019-11-24 18:38:03.244286+05:30	407	IC Application Laboratory	3		8	1
1007	2019-11-24 18:38:03.256948+05:30	406	Fundamentals of Microelectronics	3		8	1
1008	2019-11-24 18:38:03.269839+05:30	405	Microelectronic Devices,Technology and Circuits	3		8	1
1009	2019-11-24 18:38:03.282293+05:30	404	ELECTRONICS NETWORK THEORY	3		8	1
1010	2019-11-24 18:38:03.294631+05:30	403	SIGNALS AND SYSTEMS	3		8	1
1011	2019-11-24 18:38:03.307544+05:30	402	Introduction to Electronics and Communication Engineering	3		8	1
1012	2019-11-24 18:38:03.320369+05:30	401	SIGNALS AND SYSTEMS	3		8	1
1013	2019-11-24 18:38:03.333216+05:30	400	RF System Design and Analysis	3		8	1
1014	2019-11-24 18:38:03.345213+05:30	399	Radar Signal Processing	3		8	1
1015	2019-11-24 18:38:03.35814+05:30	398	Fiber Optic Systems	3		8	1
1016	2019-11-24 18:38:03.370619+05:30	397	Coding Theory and Applications	3		8	1
1017	2019-11-24 18:38:03.383935+05:30	396	Microwave Engineering	3		8	1
1018	2019-11-24 18:38:03.395956+05:30	395	Antenna Theory	3		8	1
1019	2019-11-24 18:38:03.408979+05:30	394	Communication Systems and Techniques	3		8	1
1020	2019-11-24 18:38:03.421654+05:30	393	Digital Electronic Circuits Laboratory	3		8	1
1021	2019-11-24 18:38:03.434823+05:30	392	Engineering Electromagnetics	3		8	1
1022	2019-11-24 18:38:03.447438+05:30	391	Automatic Control Systems	3		8	1
1023	2019-11-24 18:38:03.459896+05:30	390	Principles of Digital Communication	3		8	1
1024	2019-11-24 18:38:03.472851+05:30	389	Fundamental of Electronics	3		8	1
1025	2019-11-24 18:38:03.485474+05:30	388	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1026	2019-11-24 18:38:03.498195+05:30	387	SEMINAR	3		8	1
1027	2019-11-24 18:38:03.510354+05:30	386	Modeling and Simulation	3		8	1
1028	2019-11-24 18:38:03.523454+05:30	385	Introduction to Robotics	3		8	1
1029	2019-11-24 18:38:03.543958+05:30	384	Smart Grid	3		8	1
1030	2019-11-24 18:38:03.557028+05:30	383	Power System Planning	3		8	1
1031	2019-11-24 18:38:03.569287+05:30	382	Enhanced Power Quality AC-DC Converters	3		8	1
1032	2019-11-24 18:38:03.582086+05:30	381	Advances in Signal and Image Processing	3		8	1
1033	2019-11-24 18:38:03.594662+05:30	380	Advanced System Engineering	3		8	1
1034	2019-11-24 18:38:03.608351+05:30	379	Intelligent Control Techniques	3		8	1
1035	2019-11-24 18:38:03.621037+05:30	378	Advanced Linear Control Systems	3		8	1
1036	2019-11-24 18:38:03.633771+05:30	377	EHV AC Transmission Systems	3		8	1
1037	2019-11-24 18:38:03.645933+05:30	376	Distribution System Analysis and Operation	3		8	1
1038	2019-11-24 18:38:03.658983+05:30	375	Power System Operation and Control	3		8	1
1039	2019-11-24 18:38:03.671303+05:30	374	Computer Aided Power System Analysis	3		8	1
1040	2019-11-24 18:38:03.684552+05:30	373	Advanced Electric Drives	3		8	1
1041	2019-11-24 18:38:03.696763+05:30	372	Analysis of Electrical Machines	3		8	1
1042	2019-11-24 18:38:03.709605+05:30	371	Advanced Power Electronics	3		8	1
1043	2019-11-24 18:38:03.721828+05:30	370	Biomedical Instrumentation	3		8	1
1044	2019-11-24 18:38:03.734805+05:30	369	Digital Signal and Image Processing	3		8	1
1045	2019-11-24 18:38:03.747192+05:30	368	Advanced Industrial and Electronic Instrumentation	3		8	1
1046	2019-11-24 18:38:03.760142+05:30	367	Training Seminar	3		8	1
1047	2019-11-24 18:38:03.772566+05:30	366	B.Tech. Project 	3		8	1
1048	2019-11-24 18:38:03.801897+05:30	365	Technical Communication	3		8	1
1049	2019-11-24 18:38:03.814219+05:30	364	Embedded Systems	3		8	1
1050	2019-11-24 18:38:03.827307+05:30	363	Data Structures	3		8	1
1051	2019-11-24 18:38:03.860713+05:30	362	Signals and Systems	3		8	1
1052	2019-11-24 18:38:04.068118+05:30	361	Artificial Neural Networks 	3		8	1
1053	2019-11-24 18:38:04.265941+05:30	360	Advanced Control Systems	3		8	1
1054	2019-11-24 18:38:04.685469+05:30	359	Power Electronics	3		8	1
1055	2019-11-24 18:38:04.698599+05:30	358	Power System Analysis & Control	3		8	1
1056	2019-11-24 18:38:04.710803+05:30	357	ENGINEERING ANALYSIS AND DESIGN	3		8	1
1057	2019-11-24 18:38:04.723807+05:30	356	DESIGN OF ELECTRONICS CIRCUITS	3		8	1
1058	2019-11-24 18:38:04.793367+05:30	355	DIGITAL ELECTRONICS AND CIRCUITS	3		8	1
1059	2019-11-24 18:38:04.806293+05:30	354	ELECTRICAL MACHINES-I	3		8	1
1060	2019-11-24 18:38:04.818748+05:30	353	Programming in C++	3		8	1
1061	2019-11-24 18:38:04.83178+05:30	352	Network Theory	3		8	1
1062	2019-11-24 18:38:04.844054+05:30	351	Introduction to Electrical Engineering	3		8	1
1063	2019-11-24 18:38:04.85695+05:30	350	Instrumentation laboratory	3		8	1
1064	2019-11-24 18:38:04.869568+05:30	349	Electrical Science	3		8	1
1065	2019-11-24 18:38:04.882486+05:30	348	SEMINAR	3		8	1
1066	2019-11-24 18:38:04.89464+05:30	347	Plate Tectonics	3		8	1
1067	2019-11-24 18:38:04.907869+05:30	346	Well Logging	3		8	1
1068	2019-11-24 18:38:04.920351+05:30	345	Petroleum Geology	3		8	1
1069	2019-11-24 18:38:04.933339+05:30	344	Engineering Geology	3		8	1
1070	2019-11-24 18:38:04.953414+05:30	343	Indian Mineral Deposits	3		8	1
1071	2019-11-24 18:38:04.96705+05:30	342	Isotope Geology	3		8	1
1072	2019-11-24 18:38:04.986496+05:30	341	Seminar	3		8	1
1073	2019-11-24 18:38:05.000373+05:30	340	ADVANCED SEISMIC PROSPECTING	3		8	1
1074	2019-11-24 18:38:05.012252+05:30	339	DYNAMIC SYSTEMS IN EARTH SCIENCES	3		8	1
1075	2019-11-24 18:38:05.025262+05:30	338	Global Environment	3		8	1
1076	2019-11-24 18:38:05.038345+05:30	337	Micropaleontology and Paleoceanography	3		8	1
1077	2019-11-24 18:38:05.05084+05:30	336	ISOTOPE GEOLOGY	3		8	1
1078	2019-11-24 18:38:05.071027+05:30	335	Geophysical Prospecting	3		8	1
1079	2019-11-24 18:38:05.08407+05:30	334	Sedimentology and Stratigraphy	3		8	1
1080	2019-11-24 18:38:05.096341+05:30	333	Comprehensive Viva Voce	3		8	1
1081	2019-11-24 18:38:05.109334+05:30	332	Structural Geology	3		8	1
1082	2019-11-24 18:38:05.121475+05:30	331	Igneous Petrology	3		8	1
1083	2019-11-24 18:38:05.134471+05:30	330	Geochemistry	3		8	1
1084	2019-11-24 18:38:05.146985+05:30	329	Crystallography and Mineralogy	3		8	1
1085	2019-11-24 18:38:05.159896+05:30	328	Numerical Techniques and Computer Programming	3		8	1
1086	2019-11-24 18:38:05.172292+05:30	327	Comprehensive Viva Voce	3		8	1
1087	2019-11-24 18:38:05.185157+05:30	326	Seminar-I	3		8	1
1088	2019-11-24 18:38:05.1975+05:30	325	STRONG MOTION SEISMOGRAPH	3		8	1
1089	2019-11-24 18:38:05.21058+05:30	324	Geophysical Well logging	3		8	1
1090	2019-11-24 18:38:05.223471+05:30	323	Numerical Modelling in Geophysical 	3		8	1
1091	2019-11-24 18:38:05.236041+05:30	322	PETROLEUM GEOLOGY	3		8	1
1092	2019-11-24 18:38:05.248782+05:30	321	HYDROGEOLOGY	3		8	1
1093	2019-11-24 18:38:05.261222+05:30	320	ENGINEERING GEOLOGY	3		8	1
1094	2019-11-24 18:38:05.274338+05:30	319	PRINCIPLES OF GIS	3		8	1
1095	2019-11-24 18:38:05.287053+05:30	318	PRINCIPLES OF REMOTE SENSING	3		8	1
1096	2019-11-24 18:38:05.299866+05:30	317	Technical Communication	3		8	1
1097	2019-11-24 18:38:05.311381+05:30	316	ROCK AND SOIL MECHANICS	3		8	1
1098	2019-11-24 18:38:05.324364+05:30	315	Seismology	3		8	1
1099	2019-11-24 18:38:05.337047+05:30	314	Gravity and Magnetic Prospecting	3		8	1
1100	2019-11-24 18:38:05.349741+05:30	313	Economic Geology	3		8	1
1101	2019-11-24 18:38:05.427739+05:30	312	Metamorphic Petrology	3		8	1
1102	2019-11-24 18:38:05.440705+05:30	311	Structural Geology-II	3		8	1
1103	2019-11-24 18:38:05.457002+05:30	310	GEOPHYSICAL PROSPECTING	3		8	1
1104	2019-11-24 18:38:05.470105+05:30	309	FIELD THEORY	3		8	1
1105	2019-11-24 18:38:05.48193+05:30	308	STRUCTURAL GEOLOGY-I	3		8	1
1106	2019-11-24 18:38:05.49485+05:30	307	PALEONTOLOGY	3		8	1
1107	2019-11-24 18:38:05.507334+05:30	306	BASIC PETROLOGY	3		8	1
1108	2019-11-24 18:38:05.520859+05:30	305	Computer Programming	3		8	1
1109	2019-11-24 18:38:05.533178+05:30	304	Introduction to Earth Sciences	3		8	1
1110	2019-11-24 18:38:05.545616+05:30	303	Electrical Prospecting	3		8	1
1111	2019-11-24 18:38:05.558121+05:30	302	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1112	2019-11-24 18:38:05.571132+05:30	301	SEMINAR	3		8	1
1113	2019-11-24 18:38:05.583705+05:30	300	Principles of Seismology	3		8	1
1114	2019-11-24 18:38:05.596291+05:30	299	Machine Foundation	3		8	1
1115	2019-11-24 18:38:05.608735+05:30	298	Earthquake Resistant Design of Structures	3		8	1
1116	2019-11-24 18:38:05.621752+05:30	297	Vulnerability and Risk Analysis	3		8	1
1117	2019-11-24 18:38:05.634008+05:30	296	Seismological Modeling and Simulation	3		8	1
1118	2019-11-24 18:38:05.646694+05:30	295	Seismic Hazard Assessment	3		8	1
1119	2019-11-24 18:38:05.659263+05:30	294	Geotechnical Earthquake Engineering	3		8	1
1120	2019-11-24 18:38:05.672194+05:30	293	Numerical Methods for Dynamic Systems	3		8	1
1121	2019-11-24 18:38:05.684929+05:30	292	Finite Element Method	3		8	1
1122	2019-11-24 18:38:05.697599+05:30	291	Engineering Seismology	3		8	1
1123	2019-11-24 18:38:05.709762+05:30	290	Vibration of Elastic Media	3		8	1
1124	2019-11-24 18:38:05.722938+05:30	289	Theory of Vibrations	3		8	1
1125	2019-11-24 18:38:05.735304+05:30	288	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1126	2019-11-24 18:38:05.748404+05:30	287	SEMINAR	3		8	1
1127	2019-11-24 18:38:05.761017+05:30	286	Advanced Topics in Software Engineering	3		8	1
1128	2019-11-24 18:38:05.773678+05:30	285	Lab II (Project Lab)	3		8	1
1129	2019-11-24 18:38:05.785878+05:30	284	Lab I (Programming Lab)	3		8	1
1130	2019-11-24 18:38:05.798815+05:30	283	Advanced Computer Networks	3		8	1
1131	2019-11-24 18:38:05.811397+05:30	282	Advanced Operating Systems	3		8	1
1132	2019-11-24 18:38:05.833376+05:30	281	Advanced Algorithms	3		8	1
1133	2019-11-24 18:38:05.845629+05:30	280	Training Seminar	3		8	1
1134	2019-11-24 18:38:05.858258+05:30	279	B.Tech. Project 	3		8	1
1135	2019-11-24 18:38:05.870671+05:30	278	Technical Communication	3		8	1
1136	2019-11-24 18:38:05.883624+05:30	277	Computer Network Laboratory	3		8	1
1137	2019-11-24 18:38:05.896011+05:30	276	Theory of Computation	3		8	1
1138	2019-11-24 18:38:05.909001+05:30	275	Computer Network	3		8	1
1139	2019-11-24 18:38:05.921483+05:30	274	DATA STRUCTURE LABORATORY	3		8	1
1140	2019-11-24 18:38:05.934415+05:30	273	COMPUTER ARCHITECTURE AND MICROPROCESSORS	3		8	1
1141	2019-11-24 18:38:05.947169+05:30	272	Fundamentals of Object Oriented Programming	3		8	1
1142	2019-11-24 18:38:05.959513+05:30	271	Introduction to Computer Science and Engineering	3		8	1
1143	2019-11-24 18:38:05.972442+05:30	270	Logic and Automated Reasoning	3		8	1
1144	2019-11-24 18:38:05.984811+05:30	269	Data Mining and Warehousing	3		8	1
1145	2019-11-24 18:38:05.997911+05:30	268	MACHINE LEARNING	3		8	1
1146	2019-11-24 18:38:06.010261+05:30	267	ARTIFICIAL INTELLIGENCE	3		8	1
1147	2019-11-24 18:38:06.023181+05:30	266	Compiler Design 	3		8	1
1148	2019-11-24 18:38:06.035389+05:30	265	Data Base Management Systems	3		8	1
1149	2019-11-24 18:38:06.048338+05:30	264	OBJECT ORIENTED ANALYSIS AND DESIGN	3		8	1
1150	2019-11-24 18:38:06.060891+05:30	263	Data Structures	3		8	1
1151	2019-11-24 18:38:06.07365+05:30	262	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1152	2019-11-24 18:38:06.086381+05:30	261	SEMINAR	3		8	1
1153	2019-11-24 18:38:06.099213+05:30	260	Geoinformatics for Landuse  Surveys	3		8	1
1154	2019-11-24 18:38:06.111475+05:30	259	Planning, Design and Construction of Rural Roads	3		8	1
1155	2019-11-24 18:38:06.124357+05:30	258	Pavement Analysis and Design	3		8	1
1156	2019-11-24 18:38:06.136893+05:30	257	Traffic Engineering and Modeling	3		8	1
1157	2019-11-24 18:38:06.149894+05:30	256	Modeling, Simulation and Optimization	3		8	1
1158	2019-11-24 18:38:06.162094+05:30	255	Free Surface Flows	3		8	1
1159	2019-11-24 18:38:06.175014+05:30	254	Advanced Fluid Mechanics	3		8	1
1160	2019-11-24 18:38:06.187699+05:30	253	Advanced Hydrology	3		8	1
1161	2019-11-24 18:38:06.200426+05:30	252	Soil Dynamics and Machine Foundations	3		8	1
1162	2019-11-24 18:38:06.212837+05:30	251	Engineering Behaviour of Rocks	3		8	1
1163	2019-11-24 18:38:06.225744+05:30	250	Advanced Soil Mechanics	3		8	1
1164	2019-11-24 18:38:06.238094+05:30	249	Advanced Numerical Analysis	3		8	1
1165	2019-11-24 18:38:06.251266+05:30	248	FIELD SURVEY CAMP	3		8	1
1166	2019-11-24 18:38:06.263581+05:30	247	Principles of Photogrammetry	3		8	1
1167	2019-11-24 18:38:06.276296+05:30	246	Surveying Measurements and Adjustments	3		8	1
1168	2019-11-24 18:38:06.288809+05:30	245	Environmental Hydraulics	3		8	1
1169	2019-11-24 18:38:06.301659+05:30	244	Water Treatment	3		8	1
1170	2019-11-24 18:38:06.314062+05:30	243	Environmental Modeling and Simulation	3		8	1
1171	2019-11-24 18:38:06.326805+05:30	242	Training Seminar	3		8	1
1172	2019-11-24 18:38:06.339366+05:30	241	Advanced Highway Engineering	3		8	1
1173	2019-11-24 18:38:06.352202+05:30	240	Advanced Water and Wastewater Treatment	3		8	1
1174	2019-11-24 18:38:06.364827+05:30	239	WATER RESOURCE ENGINEERING	3		8	1
1175	2019-11-24 18:38:06.377142+05:30	238	B.Tech. Project 	3		8	1
1176	2019-11-24 18:38:06.389451+05:30	237	Technical Communication	3		8	1
1177	2019-11-24 18:38:06.402295+05:30	236	Design of Reinforced Concrete Elements	3		8	1
1178	2019-11-24 18:38:06.415322+05:30	235	Soil Mechanicas	3		8	1
1179	2019-11-24 18:38:06.428102+05:30	234	Theory of Structures	3		8	1
1180	2019-11-24 18:38:06.44116+05:30	233	ENGINEERING GRAPHICS	3		8	1
1181	2019-11-24 18:38:06.453862+05:30	232	Highway and Traffic Engineering	3		8	1
1182	2019-11-24 18:38:06.64542+05:30	231	STRUCTURAL ANALYSIS-I	3		8	1
1183	2019-11-24 18:38:06.82784+05:30	230	CHANNEL HYDRAULICS	3		8	1
1184	2019-11-24 18:38:07.271047+05:30	229	GEOMATICS ENGINEERING-II	3		8	1
1185	2019-11-24 18:38:07.283862+05:30	228	Urban Mass Transit Systems	3		8	1
1186	2019-11-24 18:38:07.296185+05:30	227	Transportation Planning	3		8	1
1187	2019-11-24 18:38:07.308976+05:30	226	Road Traffic Safety	3		8	1
1188	2019-11-24 18:38:07.321567+05:30	225	Behaviour & Design of Steel Structures (Autumn)	3		8	1
1189	2019-11-24 18:38:07.334766+05:30	224	Industrial and Hazardous Waste Management	3		8	1
1190	2019-11-24 18:38:07.346944+05:30	223	Geometric Design	3		8	1
1191	2019-11-24 18:38:07.359887+05:30	222	Finite Element Analysis	3		8	1
1192	2019-11-24 18:38:07.372101+05:30	221	Structural Dynamics	3		8	1
1193	2019-11-24 18:38:07.38513+05:30	220	Advanced Concrete Design	3		8	1
1194	2019-11-24 18:38:07.397529+05:30	219	Continuum Mechanics	3		8	1
1195	2019-11-24 18:38:07.410523+05:30	218	Matrix Structural Analysis	3		8	1
1196	2019-11-24 18:38:07.422639+05:30	217	Geodesy and GPS Surveying	3		8	1
1197	2019-11-24 18:38:07.435335+05:30	216	Remote Sensing and  Image Processing	3		8	1
1198	2019-11-24 18:38:07.447549+05:30	215	Environmental Chemistry	3		8	1
1199	2019-11-24 18:38:07.46094+05:30	214	Wastewater Treatment	3		8	1
1200	2019-11-24 18:38:07.473162+05:30	213	Design of Steel Elements	3		8	1
1201	2019-11-24 18:38:07.485966+05:30	212	Railway Engineering and Airport Planning	3		8	1
1202	2019-11-24 18:38:07.498527+05:30	211	Design of Steel Elements	3		8	1
1203	2019-11-24 18:38:07.512319+05:30	210	Waste Water Engineering	3		8	1
1204	2019-11-24 18:38:07.524865+05:30	209	Geomatics Engineering – I	3		8	1
1205	2019-11-24 18:38:07.537823+05:30	208	Introduction to Environmental Studies	3		8	1
1206	2019-11-24 18:38:07.550765+05:30	207	Numerical Methods and Computer Programming	3		8	1
1207	2019-11-24 18:38:07.562874+05:30	206	Solid Mechanics	3		8	1
1208	2019-11-24 18:38:07.576047+05:30	205	Introduction to Civil Engineering	3		8	1
1209	2019-11-24 18:38:07.596542+05:30	204	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1210	2019-11-24 18:38:07.609467+05:30	203	SEMINAR	3		8	1
1211	2019-11-24 18:38:07.621831+05:30	202	Training Seminar	3		8	1
1212	2019-11-24 18:38:07.634921+05:30	201	B.Tech. Project 	3		8	1
1213	2019-11-24 18:38:07.64704+05:30	200	Technical Communication	3		8	1
1214	2019-11-24 18:38:07.660054+05:30	199	Process Integration	3		8	1
1215	2019-11-24 18:38:07.672184+05:30	198	Optimization of Chemical Enigneering Processes	3		8	1
1216	2019-11-24 18:38:07.68529+05:30	197	Process Utilities and Safety 	3		8	1
1217	2019-11-24 18:38:07.697815+05:30	196	Process Equipment Design*	3		8	1
1218	2019-11-24 18:38:07.710677+05:30	195	Process Dynamics and Control	3		8	1
1219	2019-11-24 18:38:07.723085+05:30	194	Fluid and Fluid Particle Mechanics	3		8	1
1220	2019-11-24 18:38:07.744176+05:30	193	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
1221	2019-11-24 18:38:07.764959+05:30	192	Chemical Technology	3		8	1
1222	2019-11-24 18:38:07.782597+05:30	191	CHEMICAL ENGINEERING THERMODYNAMICS	3		8	1
1223	2019-11-24 18:38:07.846993+05:30	190	MECHANICAL OPERATION	3		8	1
1224	2019-11-24 18:38:07.91733+05:30	189	HEAT TRANSFER	3		8	1
1225	2019-11-24 18:38:07.929707+05:30	188	SEMINAR	3		8	1
1226	2019-11-24 18:38:08.00014+05:30	187	COMPUTATIONAL FLUID DYNAMICS	3		8	1
1227	2019-11-24 18:38:08.012565+05:30	186	Biochemical Engineering	3		8	1
1228	2019-11-24 18:38:08.02498+05:30	185	Advanced Reaction Engineering	3		8	1
1229	2019-11-24 18:38:08.03792+05:30	184	Advanced Transport Phenomena	3		8	1
1230	2019-11-24 18:38:08.073009+05:30	183	Mathematical Methods in Chemical Engineering 	3		8	1
1231	2019-11-24 18:38:08.084554+05:30	182	Waste to Energy	3		8	1
1232	2019-11-24 18:38:08.096824+05:30	181	Polymer Physics and Rheology*	3		8	1
1233	2019-11-24 18:38:08.109779+05:30	180	Fluidization Engineering	3		8	1
1234	2019-11-24 18:38:08.122155+05:30	179	Computer Application in Chemical Engineering	3		8	1
1235	2019-11-24 18:38:08.135005+05:30	178	Enginering Analysis and Process Modeling	3		8	1
1236	2019-11-24 18:38:08.147407+05:30	177	Mass Transfer-II	3		8	1
1237	2019-11-24 18:38:08.160383+05:30	176	Mass Transfer -I	3		8	1
1238	2019-11-24 18:38:08.172926+05:30	175	Computer Programming and Numerical Methods	3		8	1
1239	2019-11-24 18:38:08.201996+05:30	174	Material and Energy Balance	3		8	1
1240	2019-11-24 18:38:08.272136+05:30	173	Introduction to Chemical  Engineering	3		8	1
1241	2019-11-24 18:38:08.342307+05:30	172	Advanced Thermodynamics and Molecular Simulations	3		8	1
1242	2019-11-24 18:38:08.412651+05:30	171	DISSERTATION STAGE I	3		8	1
1243	2019-11-24 18:38:08.425033+05:30	170	SEMINAR	3		8	1
1244	2019-11-24 18:38:08.437937+05:30	169	ADVANCED TRANSPORT PROCESS	3		8	1
1245	2019-11-24 18:38:08.507009+05:30	168	RECOMBINANT DNA TECHNOLOGY	3		8	1
1246	2019-11-24 18:38:08.519884+05:30	167	REACTION KINETICS AND REACTOR DESIGN	3		8	1
1247	2019-11-24 18:38:08.532471+05:30	166	MICROBIOLOGY AND BIOCHEMISTRY	3		8	1
1248	2019-11-24 18:38:08.545649+05:30	165	Chemical Genetics and Drug Discovery	3		8	1
1249	2019-11-24 18:38:08.558166+05:30	164	Structural Biology	3		8	1
1250	2019-11-24 18:38:08.571258+05:30	163	Genomics and Proteomics	3		8	1
1251	2019-11-24 18:38:08.583609+05:30	162	Vaccine Development & Production	3		8	1
1252	2019-11-24 18:38:08.596313+05:30	161	Cell & Tissue Culture Technology	3		8	1
1253	2019-11-24 18:38:08.608915+05:30	160	Biotechnology Laboratory – III	3		8	1
1254	2019-11-24 18:38:08.621691+05:30	159	Seminar	3		8	1
1255	2019-11-24 18:38:08.637698+05:30	158	Genetic Engineering	3		8	1
1256	2019-11-24 18:38:08.650746+05:30	157	Biophysical Techniques	3		8	1
1257	2019-11-24 18:38:08.663005+05:30	156	DOWNSTREAM PROCESSING	3		8	1
1258	2019-11-24 18:38:08.675928+05:30	155	BIOREACTION ENGINEERING 	3		8	1
1259	2019-11-24 18:38:08.688367+05:30	154	Technical  Communication	3		8	1
1260	2019-11-24 18:38:08.701169+05:30	153	Cell & Developmental Biology	3		8	1
1261	2019-11-24 18:38:08.713637+05:30	152	Genetics & Molecular Biology	3		8	1
1262	2019-11-24 18:38:08.72665+05:30	151	Applied Microbiology	3		8	1
1263	2019-11-24 18:38:08.738908+05:30	150	Biotechnology Laboratory – I	3		8	1
1264	2019-11-24 18:38:08.75197+05:30	149	Biochemistry	3		8	1
1265	2019-11-24 18:38:08.764477+05:30	148	Training Seminar	3		8	1
1266	2019-11-24 18:38:08.777487+05:30	147	Drug Designing	3		8	1
1267	2019-11-24 18:38:08.78955+05:30	146	Protein Engineering	3		8	1
1268	2019-11-24 18:38:08.802613+05:30	145	Genomics and Proteomics	3		8	1
1269	2019-11-24 18:38:08.815034+05:30	144	B.Tech. Project 	3		8	1
1270	2019-11-24 18:38:08.828005+05:30	143	Technical Communication	3		8	1
1271	2019-11-24 18:38:08.840162+05:30	142	CELL AND TISSUE ENGINEERING	3		8	1
1272	2019-11-24 18:38:08.853341+05:30	141	IMMUNOTECHNOLOGY	3		8	1
1273	2019-11-24 18:38:08.865491+05:30	140	GENETICS AND MOLECULAR BIOLOGY	3		8	1
1274	2019-11-24 18:38:08.878405+05:30	139	Computer Programming	3		8	1
1275	2019-11-24 18:38:08.890835+05:30	138	Introduction to Biotechnology	3		8	1
1276	2019-11-24 18:38:08.903954+05:30	137	Molecular Biophysics	3		8	1
1277	2019-11-24 18:38:08.916225+05:30	136	Animal Biotechnology	3		8	1
1278	2019-11-24 18:38:08.937719+05:30	135	Plant Biotechnology	3		8	1
1279	2019-11-24 18:38:08.949664+05:30	134	Bioseparation  Engineering	3		8	1
1280	2019-11-24 18:38:08.962668+05:30	133	Bioprocess Engineering	3		8	1
1281	2019-11-24 18:38:08.974972+05:30	132	Chemical Kinetics and Reactor Design	3		8	1
1282	2019-11-24 18:38:08.98791+05:30	131	BIOINFORMATICS	3		8	1
1283	2019-11-24 18:38:09.000218+05:30	130	MICROBIOLOGY	3		8	1
1284	2019-11-24 18:38:09.022016+05:30	129	Professional Training	3		8	1
1285	2019-11-24 18:38:09.034392+05:30	128	Planning  Studio-III	3		8	1
1286	2019-11-24 18:38:09.047572+05:30	127	DISSERTATION STAGE-I	3		8	1
1287	2019-11-24 18:38:09.059941+05:30	126	Professional Training	3		8	1
1288	2019-11-24 18:38:09.072942+05:30	125	Design Studio-III	3		8	1
1289	2019-11-24 18:38:09.085329+05:30	124	DISSERTATION STAGE-I (TO BE CONTINUED NEXT SEMESTER)	3		8	1
1290	2019-11-24 18:38:09.098188+05:30	123	Housing	3		8	1
1291	2019-11-24 18:38:09.110506+05:30	122	Planning Theory and Techniques	3		8	1
1292	2019-11-24 18:38:09.123549+05:30	121	Ecology and Sustainable Development	3		8	1
1293	2019-11-24 18:38:09.136462+05:30	120	Infrastructure Planning	3		8	1
1386	2020-02-19 17:49:53.74024+05:30	25	cmnzmcxz,	3		11	1
1294	2019-11-24 18:38:09.148896+05:30	119	Socio Economics, Demography and Quantitative Techniques	3		8	1
1295	2019-11-24 18:38:09.161782+05:30	118	Planning Studio-I	3		8	1
1296	2019-11-24 18:38:09.174142+05:30	117	Computer Applications in Architecture	3		8	1
1297	2019-11-24 18:38:09.187141+05:30	116	Advanced Building Technologies	3		8	1
1298	2019-11-24 18:38:09.222788+05:30	115	Urban Design	3		8	1
1299	2019-11-24 18:38:09.257102+05:30	114	Contemporary Architecture- Theories and Trends	3		8	1
1300	2019-11-24 18:38:09.280778+05:30	113	Design Studio-I	3		8	1
1301	2019-11-24 18:38:09.627571+05:30	112	Live Project/Studio/Seminar-II	3		8	1
1302	2019-11-24 18:38:10.045431+05:30	111	Vastushastra	3		8	1
1303	2019-11-24 18:38:10.115512+05:30	110	Hill Architecture	3		8	1
1304	2019-11-24 18:38:10.184901+05:30	109	Urban  Planning	3		8	1
1305	2019-11-24 18:38:10.221108+05:30	108	Thesis Project I	3		8	1
1306	2019-11-24 18:38:10.240537+05:30	107	Architectural Design-VII	3		8	1
1307	2019-11-24 18:38:10.25248+05:30	106	Live Project/ Studio/ Seminar-I	3		8	1
1308	2019-11-24 18:38:10.265411+05:30	105	Ekistics 	3		8	1
1309	2019-11-24 18:38:10.278274+05:30	104	Working Drawing	3		8	1
1310	2019-11-24 18:38:10.290916+05:30	103	Sustainable Architecture	3		8	1
1311	2019-11-24 18:38:10.32835+05:30	102	Urban Design	3		8	1
1312	2019-11-24 18:38:10.341063+05:30	101	Architectural Design-VI	3		8	1
1313	2019-11-24 18:38:10.353748+05:30	100	MODERN INDIAN ARCHITECTURE	3		8	1
1314	2019-11-24 18:38:10.366016+05:30	99	Interior Design 	3		8	1
1315	2019-11-24 18:38:10.395382+05:30	98	Computer Applications in Architecture	3		8	1
1316	2019-11-24 18:38:10.407945+05:30	97	Building Construction-IV	3		8	1
1317	2019-11-24 18:38:10.420985+05:30	96	Architectural Design-IV	3		8	1
1318	2019-11-24 18:38:10.43338+05:30	95	MEASURED DRAWING CAMP	3		8	1
1319	2019-11-24 18:38:10.446084+05:30	94	PRICIPLES OF ARCHITECTURE	3		8	1
1320	2019-11-24 18:38:10.458439+05:30	93	STRUCTURE AND ARCHITECTURE	3		8	1
1321	2019-11-24 18:38:10.471552+05:30	92	QUANTITY, PRICING AND SPECIFICATIONS	3		8	1
1322	2019-11-24 18:38:10.48394+05:30	91	HISTORY OF ARCHITECTUTRE I	3		8	1
1323	2019-11-24 18:38:10.496696+05:30	90	BUILDING CONSTRUCTION II	3		8	1
1324	2019-11-24 18:38:10.509316+05:30	89	Architectural Design-III	3		8	1
1325	2019-11-24 18:38:10.522098+05:30	88	ARCHITECTURAL DESIGN II	3		8	1
1326	2019-11-24 18:38:10.534554+05:30	87	Basic Design and Creative Workshop I	3		8	1
1327	2019-11-24 18:38:10.547507+05:30	86	Architectural Graphics I	3		8	1
1328	2019-11-24 18:38:10.559557+05:30	85	Visual Art I	3		8	1
1329	2019-11-24 18:38:10.572376+05:30	84	Introduction to Architecture	3		8	1
1330	2019-11-24 18:38:10.584672+05:30	83	SEMINAR	3		8	1
1331	2019-11-24 18:38:10.597299+05:30	82	Regional Planning	3		8	1
1332	2019-11-24 18:38:10.609656+05:30	81	Planning Legislation and Governance	3		8	1
1333	2019-11-24 18:38:10.622761+05:30	80	Modern World Architecture	3		8	1
1334	2019-11-24 18:38:10.63542+05:30	79	SEMINAR	3		8	1
1335	2019-11-24 18:38:10.648338+05:30	78	Advanced Characterization Techniques	3		8	1
1336	2019-11-24 18:38:41.54875+05:30	94	Water Resources Development and Management	3		7	1
1337	2019-11-24 18:38:41.972006+05:30	93	Physics	3		7	1
1338	2019-11-24 18:38:41.996545+05:30	92	Polymer and Process Engineering	3		7	1
1339	2019-11-24 18:38:42.039213+05:30	91	Paper Technology	3		7	1
1340	2019-11-24 18:38:42.051158+05:30	90	Metallurgical and Materials Engineering	3		7	1
1341	2019-11-24 18:38:42.062923+05:30	89	Mechanical and Industrial Engineering	3		7	1
1342	2019-11-24 18:38:42.07576+05:30	88	Mathematics	3		7	1
1343	2019-11-24 18:38:42.088499+05:30	87	Management Studies	3		7	1
1344	2019-11-24 18:38:42.101074+05:30	86	Hydrology	3		7	1
1345	2019-11-24 18:38:42.114043+05:30	85	Humanities and Social Sciences	3		7	1
1346	2019-11-24 18:38:42.139229+05:30	84	Electronics and Communication Engineering	3		7	1
1347	2019-11-24 18:38:42.152155+05:30	83	Electrical Engineering	3		7	1
1348	2019-11-24 18:38:42.165021+05:30	82	Earth Sciences	3		7	1
1349	2019-11-24 18:38:42.177501+05:30	81	Earthquake	3		7	1
1350	2019-11-24 18:38:42.189896+05:30	80	Computer Science and Engineering	3		7	1
1351	2019-11-24 18:38:42.203082+05:30	79	Civil Engineering	3		7	1
1352	2019-11-24 18:38:42.215442+05:30	78	Chemistry	3		7	1
1353	2019-11-24 18:38:42.229093+05:30	77	Chemical Engineering	3		7	1
1354	2019-11-24 18:38:42.24134+05:30	76	Biotechnology	3		7	1
1355	2019-11-24 18:38:42.254229+05:30	75	Architecture and Planning	3		7	1
1356	2019-11-24 18:38:42.266802+05:30	74	Applied Science and Engineering	3		7	1
1357	2019-11-24 18:38:42.279485+05:30	73	Hydro and Renewable Energy	3		7	1
1358	2019-11-24 19:18:10.657609+05:30	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1359	2019-11-24 19:18:16.406004+05:30	25	ECN-212 quiz 2 solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1360	2019-11-26 23:45:40.120774+05:30	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["finalized"]}}]	10	1
1361	2019-11-26 23:45:46.701918+05:30	25	ECN-212 quiz 2 solution.PDF	2	[{"changed": {"fields": ["finalized"]}}]	10	1
1362	2019-12-26 14:55:27.993648+05:30	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1363	2019-12-26 14:55:35.352011+05:30	26	ECN-212 End term solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1364	2019-12-26 14:55:42.861594+05:30	25	ECN-212 quiz 2 solution.PDF	2	[{"changed": {"fields": ["filetype"]}}]	10	1
1365	2019-12-28 14:59:01.392535+05:30	1	Ayan	1	[{"added": {}}]	12	1
1366	2019-12-28 15:09:58.228991+05:30	1	Ayan	2	[{"changed": {"fields": ["department"]}}]	12	1
1367	2019-12-28 15:32:21.365372+05:30	1	R.C.Hibberler	2	[{"changed": {"fields": ["filetype"]}}]	11	1
1368	2019-12-28 15:55:05.086939+05:30	2	Advik	1	[{"added": {}}]	12	1
1369	2020-01-22 22:25:09.879734+05:30	26	ECN-212 End term solution.PDF	2	[]	10	1
1370	2020-02-17 15:41:30.05166+05:30	1	Ayan	3		12	1
1371	2020-02-17 15:41:37.783429+05:30	2	Advik	3		12	1
1372	2020-02-17 15:42:39.419559+05:30	5	darkrider	3		12	1
1373	2020-02-17 23:46:42.689288+05:30	5	Tutorial 1	1	[{"added": {}}]	11	1
1374	2020-02-18 00:22:09.765697+05:30	5	Tutorial 1	3		11	1
1375	2020-02-18 00:33:21.018189+05:30	6	Tutorial 1	1	[{"added": {}}]	11	1
1376	2020-02-19 17:49:53.44127+05:30	35	mcdnms	3		11	1
1377	2020-02-19 17:49:53.614522+05:30	34	ddsfsd	3		11	1
1378	2020-02-19 17:49:53.626865+05:30	33	czxc	3		11	1
1379	2020-02-19 17:49:53.639017+05:30	32	saSAAD	3		11	1
1380	2020-02-19 17:49:53.651912+05:30	31	mflemflksd	3		11	1
1381	2020-02-19 17:49:53.677266+05:30	30	dsads	3		11	1
1382	2020-02-19 17:49:53.689651+05:30	29	dmsndkanskm	3		11	1
1383	2020-02-19 17:49:53.702549+05:30	28	msdlkadmlas	3		11	1
1384	2020-02-19 17:49:53.714902+05:30	27	mckldmslc	3		11	1
1385	2020-02-19 17:49:53.728112+05:30	26	cnancam	3		11	1
1389	2020-02-19 17:49:53.778647+05:30	22	djaksdnkjas	3		11	1
1390	2020-02-19 17:49:53.790839+05:30	21	ndkjadns	3		11	1
1391	2020-02-19 17:49:53.803719+05:30	20	 dmsa dmskd	3		11	1
1392	2020-02-19 17:49:53.816194+05:30	19	cjkdnk	3		11	1
1393	2020-02-19 17:49:53.829109+05:30	18	ncksad	3		11	1
1394	2020-02-19 17:49:53.841453+05:30	17	dsadas	3		11	1
1395	2020-02-19 17:49:53.854416+05:30	16	ncmznc,m	3		11	1
1396	2020-02-19 17:49:53.866808+05:30	15	fdfd	3		11	1
1397	2020-02-19 17:49:53.880535+05:30	14	tut 1	3		11	1
1398	2020-02-19 17:49:53.89209+05:30	13	book 1	3		11	1
1399	2020-02-19 17:49:54.01109+05:30	12	cdnms,d	3		11	1
1400	2020-02-19 17:49:54.02392+05:30	11	cnxm,zc	3		11	1
1401	2020-02-19 17:49:54.039887+05:30	10	nkldnks	3		11	1
1402	2020-02-19 17:49:54.052902+05:30	9	nkjsndakcj	3		11	1
1403	2020-02-19 17:49:54.065239+05:30	8	bjkdsbfc	3		11	1
1404	2020-02-19 17:49:54.078164+05:30	7	R.C.Hibberler	3		11	1
1405	2020-02-19 17:49:54.090569+05:30	6	Tutorial 1	3		11	1
1406	2020-02-19 17:50:09.936114+05:30	43	circuitverse.png	3		13	1
1407	2020-02-19 17:50:10.061328+05:30	42	blackclover.jpg	3		13	1
1408	2020-02-19 17:50:10.203331+05:30	41	circuitverse.png	3		13	1
1409	2020-02-19 17:50:10.347084+05:30	40	blackclover.jpg	3		13	1
1410	2020-02-19 17:50:10.498397+05:30	39	circuitverse.png	3		13	1
1411	2020-02-19 17:50:10.642258+05:30	38	blackclover.jpg	3		13	1
1412	2020-02-19 17:50:10.794014+05:30	37	circuitverse.png	3		13	1
1413	2020-02-19 17:50:10.937252+05:30	36	blackclover.jpg	3		13	1
1414	2020-02-19 17:50:11.080458+05:30	35	circuitverse.png	3		13	1
1415	2020-02-19 17:50:11.257625+05:30	34	blackclover.jpg	3		13	1
1416	2020-02-19 17:50:11.408973+05:30	33	circuitverse.png	3		13	1
1417	2020-02-19 17:50:11.569086+05:30	32	blackclover.jpg	3		13	1
1418	2020-02-19 17:50:11.712343+05:30	31	circuitverse.png	3		13	1
1419	2020-02-19 17:50:11.872773+05:30	30	blackclover.jpg	3		13	1
1420	2020-02-19 17:50:12.031894+05:30	29	deathnote.jpg	3		13	1
1421	2020-02-19 17:50:12.20853+05:30	28	circuitverse.png	3		13	1
1422	2020-02-19 17:50:12.367915+05:30	27	blackclover.jpg	3		13	1
1423	2020-02-19 17:50:12.50434+05:30	26	deathnote.jpg	3		13	1
1424	2020-02-19 17:50:12.51587+05:30	25	deathnote.jpg	3		13	1
1425	2020-02-19 17:50:12.528792+05:30	24	circuitverse.png	3		13	1
1426	2020-02-19 17:50:12.541587+05:30	23	blackclover.jpg	3		13	1
1427	2020-02-19 17:50:12.554141+05:30	22	circuitverse.png	3		13	1
1428	2020-02-19 17:50:12.566465+05:30	21	deathnote.jpg	3		13	1
1429	2020-02-19 17:50:12.579371+05:30	20	blackclover.jpg	3		13	1
1430	2020-02-19 17:50:12.592506+05:30	19	circuitverse.png	3		13	1
1431	2020-02-19 17:50:12.604697+05:30	18	deathparade.jpg	3		13	1
1432	2020-02-19 17:50:12.617113+05:30	17	circuitverse.png	3		13	1
1433	2020-02-19 17:50:12.629992+05:30	16	blackclover.jpg	3		13	1
1434	2020-02-19 17:50:12.643086+05:30	15	circuitverse.png	3		13	1
1435	2020-02-19 17:50:12.655742+05:30	14	blackclover.jpg	3		13	1
1436	2020-02-19 17:50:12.667703+05:30	13	circuitverse.png	3		13	1
1437	2020-02-19 17:50:12.680642+05:30	12	blackclover.jpg	3		13	1
1438	2020-02-19 17:50:12.693202+05:30	11	circuitverse.png	3		13	1
1439	2020-02-19 17:50:12.714066+05:30	10	blackclover.jpg	3		13	1
1440	2020-02-19 17:50:12.727058+05:30	9	circuitverse.png	3		13	1
1441	2020-02-19 17:50:12.739935+05:30	8	blackclover.jpg	3		13	1
1442	2020-02-19 17:50:12.752428+05:30	7	circuitverse.png	3		13	1
1443	2020-02-19 17:50:12.764757+05:30	6	deathparade.jpg	3		13	1
1444	2020-02-19 17:50:12.777788+05:30	5	Dororo.jpeg	3		13	1
1445	2020-02-19 17:50:12.790201+05:30	4	deathnote.jpg	3		13	1
1446	2020-02-19 17:50:12.802946+05:30	3	blackclover.jpg	3		13	1
1447	2020-02-19 17:50:12.815358+05:30	2	asdf	3		13	1
1448	2020-02-19 17:50:12.828374+05:30	1	asdf	3		13	1
1449	2020-02-19 19:15:46.455439+05:30	116	Water Resources Development and Management	3		7	1
1450	2020-02-19 19:15:46.741383+05:30	115	Physics	3		7	1
1451	2020-02-19 19:15:46.75346+05:30	114	Polymer and Process Engineering	3		7	1
1452	2020-02-19 19:15:46.766373+05:30	113	Paper Technology	3		7	1
1453	2020-02-19 19:15:46.779921+05:30	112	Metallurgical and Materials Engineering	3		7	1
1454	2020-02-19 19:15:46.791785+05:30	111	Mechanical and Industrial Engineering	3		7	1
1455	2020-02-19 19:15:46.804639+05:30	110	Mathematics	3		7	1
1456	2020-02-19 19:15:46.81704+05:30	109	Management Studies	3		7	1
1457	2020-02-19 19:15:46.830061+05:30	108	Hydrology	3		7	1
1458	2020-02-19 19:15:46.842492+05:30	107	Humanities and Social Sciences	3		7	1
1459	2020-02-19 19:15:46.920611+05:30	106	Electronics and Communication Engineering	3		7	1
1460	2020-02-19 19:15:46.990928+05:30	105	Electrical Engineering	3		7	1
1461	2020-02-19 19:15:47.003245+05:30	104	Earth Sciences	3		7	1
1462	2020-02-19 19:15:47.015963+05:30	103	Earthquake	3		7	1
1463	2020-02-19 19:15:47.029003+05:30	102	Computer Science and Engineering	3		7	1
1464	2020-02-19 19:15:47.041439+05:30	101	Civil Engineering	3		7	1
1465	2020-02-19 19:15:47.054544+05:30	100	Chemistry	3		7	1
1466	2020-02-19 19:15:47.066936+05:30	99	Chemical Engineering	3		7	1
1467	2020-02-19 19:15:47.080571+05:30	98	Biotechnology	3		7	1
1468	2020-02-19 19:15:47.092692+05:30	97	Architecture and Planning	3		7	1
1469	2020-02-19 19:15:47.105206+05:30	96	Applied Science and Engineering	3		7	1
1470	2020-02-19 19:15:47.175317+05:30	95	Hydro and Renewable Energy	3		7	1
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-08-31 03:34:25.204817+05:30
2	auth	0001_initial	2019-08-31 03:34:25.807013+05:30
3	admin	0001_initial	2019-08-31 03:34:26.870559+05:30
4	admin	0002_logentry_remove_auto_add	2019-08-31 03:34:27.013709+05:30
5	admin	0003_logentry_add_action_flag_choices	2019-08-31 03:34:27.066471+05:30
6	contenttypes	0002_remove_content_type_name	2019-08-31 03:34:27.113268+05:30
7	auth	0002_alter_permission_name_max_length	2019-08-31 03:34:27.129521+05:30
8	auth	0003_alter_user_email_max_length	2019-08-31 03:34:27.153178+05:30
9	auth	0004_alter_user_username_opts	2019-08-31 03:34:27.173814+05:30
10	auth	0005_alter_user_last_login_null	2019-08-31 03:34:27.196307+05:30
11	auth	0006_require_contenttypes_0002	2019-08-31 03:34:27.211548+05:30
12	auth	0007_alter_validators_add_error_messages	2019-08-31 03:34:27.254953+05:30
13	auth	0008_alter_user_username_max_length	2019-08-31 03:34:27.320613+05:30
14	auth	0009_alter_user_last_name_max_length	2019-08-31 03:34:27.36175+05:30
15	auth	0010_alter_group_name_max_length	2019-08-31 03:34:27.395961+05:30
16	auth	0011_update_proxy_permissions	2019-08-31 03:34:27.426645+05:30
17	corsheaders	0001_initial	2019-08-31 03:34:27.495425+05:30
18	rest_api	0001_initial	2019-08-31 03:34:27.558583+05:30
19	rest_api	0002_department_url	2019-08-31 03:34:27.58581+05:30
20	rest_api	0003_course	2019-08-31 03:34:27.647361+05:30
21	rest_api	0004_auto_20190830_2153	2019-08-31 03:34:27.784405+05:30
22	sessions	0001_initial	2019-08-31 03:34:28.216194+05:30
23	rest_api	0005_file	2019-08-31 04:33:40.929149+05:30
24	rest_api	0006_auto_20191003_1214	2019-10-03 17:47:55.066226+05:30
25	rest_api	0007_auto_20191003_1215	2019-10-03 17:47:55.239688+05:30
26	rest_api	0008_auto_20191003_1224	2019-10-03 17:54:04.879985+05:30
27	rest_api	0009_file_file	2019-10-07 21:11:48.327955+05:30
28	rest_api	0010_auto_20191007_1553	2019-10-07 21:23:37.785282+05:30
29	rest_api	0011_auto_20191007_1556	2019-10-07 21:26:40.4983+05:30
30	rest_api	0012_auto_20191007_1610	2019-10-07 21:40:17.000639+05:30
31	rest_api	0013_auto_20191007_1710	2019-10-07 22:40:24.640878+05:30
32	rest_api	0014_auto_20191007_1749	2019-10-07 23:20:01.380828+05:30
33	rest_api	0015_auto_20191007_2136	2019-10-08 03:06:47.055683+05:30
34	rest_api	0016_auto_20191014_1632	2019-10-14 22:02:32.792965+05:30
35	rest_api	0017_auto_20191014_1711	2019-10-14 22:41:56.57645+05:30
36	rest_api	0018_auto_20191014_1712	2019-10-14 22:42:34.027493+05:30
37	rest_api	0019_auto_20191022_1439	2019-10-22 20:09:59.266119+05:30
38	rest_api	0020_auto_20191030_1511	2019-10-30 20:41:48.124455+05:30
39	rest_api	0019_auto_20191031_1024	2019-10-31 15:54:13.209732+05:30
40	rest_api	0020_file_size	2019-10-31 16:16:23.467534+05:30
41	rest_api	0021_file_fileext	2019-10-31 16:40:11.160831+05:30
42	rest_api	0022_auto_20191031_1122	2019-10-31 16:52:21.111029+05:30
43	rest_api	0023_auto_20191103_1613	2019-11-03 21:44:02.623601+05:30
44	rest_api	0024_auto_20191124_1223	2019-11-24 17:53:45.66404+05:30
45	rest_api	0025_auto_20191126_1724	2019-11-26 22:55:12.679557+05:30
46	rest_api	0026_auto_20191126_1730	2019-11-26 23:00:59.217881+05:30
47	rest_api	0027_file_finalized	2019-11-26 23:44:57.418044+05:30
48	rest_api	0028_merge_20191226_0724	2019-12-26 12:54:21.360256+05:30
49	rest_api	0029_auto_20191226_0924	2019-12-26 14:54:47.499571+05:30
50	rest_api	0030_upload_title	2019-12-26 15:38:48.869386+05:30
51	rest_api	0031_auto_20191226_1027	2019-12-26 16:00:51.804372+05:30
52	rest_api	0032_auto_20191228_0928	2019-12-28 14:58:31.31823+05:30
53	rest_api	0033_auto_20191228_0958	2019-12-28 15:29:08.579078+05:30
54	rest_api	0034_auto_20200127_1608	2020-01-27 21:39:00.007069+05:30
55	rest_api	0035_upload_filetype	2020-01-29 05:15:36.287651+05:30
56	rest_api	0036_remove_user_department	2020-02-13 00:13:52.990389+05:30
57	rest_api	0037_user_courses	2020-02-13 14:41:10.006461+05:30
58	rest_api	0038_request_date	2020-02-18 00:32:41.947796+05:30
59	rest_api	0039_upload_date	2020-02-18 19:38:08.929326+05:30
60	rest_api	0040_auto_20200218_1534	2020-02-18 21:04:19.932249+05:30
61	rest_api	0041_courserequest	2020-02-18 21:20:28.990528+05:30
62	rest_api	0042_courserequest_date	2020-02-18 21:28:25.879881+05:30
63	rest_api	0043_upload_status	2020-02-19 17:59:38.750588+05:30
64	rest_api	0044_auto_20200407_2005	2020-04-08 01:35:24.558658+05:30
65	users	0001_initial	2020-04-08 01:35:24.998658+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7o4m4gi683ngfbgtrd4boqdr3ymhrmpo	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-09-14 03:36:15.6475+05:30
6u927wty7bauw3hrgjf05m9v7ceinqrr	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-10-05 03:42:23.466624+05:30
kcornx24qad8lybhmkdzxut0fbo0v24p	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-10-21 21:08:28.988476+05:30
k5dxdl9enq2r5iskqquhmx20g0kmv8zz	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-11-05 20:11:19.106654+05:30
i48mahob9r8em13vx0kwo4trairt9hbn	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-12-08 17:38:22.046113+05:30
xxay5199jkuedf2qbirjlnlhp28h1205	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2019-12-09 00:27:52.415646+05:30
b5p11uvqhzv93cqbtspwj691qxc5bwbd	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-01-09 14:55:15.002822+05:30
vsktfn59wa7s4pg0jr1zgtovfgmbtyxu	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-02-05 22:24:26.954061+05:30
xob8htr6a71jnw7ustfknm0jt9urgpft	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-02-27 00:11:12.609634+05:30
ruvywij1q91vup5hpc8i6i45aqpi11je	MGQwNzU0Y2FlMmY4OTVhMjc5NjQzMmVjZjIwYzgyNDU3NjYzZTE0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjQ2MWUyYjJiNWYxNjhkNWVkYWUxNWE5YjNkNmMwZTVmYWEyZTQ1In0=	2020-04-12 13:21:41.423674+05:30
\.


--
-- Data for Name: rest_api_department; Type: TABLE DATA; Schema: public; Owner: ayan
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
-- Data for Name: rest_api_course; Type: TABLE DATA; Schema: public; Owner: ayan
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
1691	Seminar	132	MAN-699
1692	SEMINAR	132	MAN-900
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
-- Data for Name: rest_api_file; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.rest_api_file (id, downloads, date_modified, filetype, course_id, driveid, title, size, fileext, finalized) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.users_user (id, falcon_id, username, email, profile_image, courses, role) FROM stdin;
\.


--
-- Data for Name: users_courserequest; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.users_courserequest (id, status, department, course, code, date, user_id) FROM stdin;
\.


--
-- Data for Name: users_filerequest; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.users_filerequest (id, filetype, status, title, date, course_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_upload; Type: TABLE DATA; Schema: public; Owner: ayan
--

COPY public.users_upload (id, driveid, resolved, status, title, filetype, date, course_id, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.corsheaders_corsmodel_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1470, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 65, true);


--
-- Name: rest_api_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.rest_api_course_id_seq', 1839, true);


--
-- Name: rest_api_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.rest_api_department_id_seq', 139, true);


--
-- Name: rest_api_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.rest_api_file_id_seq', 26, true);


--
-- Name: users_courserequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.users_courserequest_id_seq', 1, false);


--
-- Name: users_filerequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.users_filerequest_id_seq', 1, false);


--
-- Name: users_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.users_upload_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ayan
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

