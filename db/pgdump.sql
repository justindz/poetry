--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: avatars; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE avatars (
    id integer NOT NULL,
    user_id integer,
    parent_id integer,
    content_type character varying(255),
    filename character varying(255),
    thumbnail character varying(255),
    size integer,
    width integer,
    height integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.avatars OWNER TO app5137;

--
-- Name: avatars_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE avatars_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.avatars_id_seq OWNER TO app5137;

--
-- Name: avatars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE avatars_id_seq OWNED BY avatars.id;


--
-- Name: avatars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('avatars_id_seq', 3, true);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    poem_id integer,
    created_at timestamp without time zone,
    body text,
    is_private boolean,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO app5137;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO app5137;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE favorites (
    id integer NOT NULL,
    poem_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.favorites OWNER TO app5137;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE favorites_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO app5137;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE favorites_id_seq OWNED BY favorites.id;


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('favorites_id_seq', 5, true);


--
-- Name: friendships; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE friendships (
    id integer NOT NULL,
    user_id integer NOT NULL,
    friend_id integer NOT NULL,
    created_at timestamp without time zone,
    accepted_at timestamp without time zone
);


ALTER TABLE public.friendships OWNER TO app5137;

--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE friendships_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.friendships_id_seq OWNER TO app5137;

--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE friendships_id_seq OWNED BY friendships.id;


--
-- Name: friendships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('friendships_id_seq', 2, true);


--
-- Name: licenses; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE licenses (
    id integer NOT NULL,
    name character varying(255),
    embed text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.licenses OWNER TO app5137;

--
-- Name: licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE licenses_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.licenses_id_seq OWNER TO app5137;

--
-- Name: licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE licenses_id_seq OWNED BY licenses.id;


--
-- Name: licenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('licenses_id_seq', 6, true);


--
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying(255),
    assoc_type character varying(255),
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO app5137;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE open_id_authentication_associations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO app5137;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE open_id_authentication_associations_id_seq OWNED BY open_id_authentication_associations.id;


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('open_id_authentication_associations_id_seq', 5, true);


--
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying(255),
    salt character varying(255) NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO app5137;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE open_id_authentication_nonces_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO app5137;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE open_id_authentication_nonces_id_seq OWNED BY open_id_authentication_nonces.id;


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('open_id_authentication_nonces_id_seq', 120, true);


--
-- Name: poems; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE poems (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(255),
    body text,
    views integer DEFAULT 0,
    license_id integer,
    original_id integer
);


ALTER TABLE public.poems OWNER TO app5137;

--
-- Name: poems_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE poems_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.poems_id_seq OWNER TO app5137;

--
-- Name: poems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE poems_id_seq OWNED BY poems.id;


--
-- Name: poems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('poems_id_seq', 62, true);


--
-- Name: revisions; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE revisions (
    id integer NOT NULL,
    poem_id integer,
    created_at timestamp without time zone,
    title character varying(255),
    body text,
    updated_at timestamp without time zone
);


ALTER TABLE public.revisions OWNER TO app5137;

--
-- Name: revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE revisions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.revisions_id_seq OWNER TO app5137;

--
-- Name: revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE revisions_id_seq OWNED BY revisions.id;


--
-- Name: revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('revisions_id_seq', 80, true);


--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE schema_info (
    version integer
);


ALTER TABLE public.schema_info OWNER TO app5137;

--
-- Name: taggings; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying(255),
    created_at timestamp without time zone
);


ALTER TABLE public.taggings OWNER TO app5137;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE taggings_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO app5137;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('taggings_id_seq', 41, true);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tags OWNER TO app5137;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE tags_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO app5137;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('tags_id_seq', 27, true);


--
-- Name: urls; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE urls (
    id integer NOT NULL,
    user_id integer,
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.urls OWNER TO app5137;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE urls_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO app5137;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE urls_id_seq OWNED BY urls.id;


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('urls_id_seq', 7, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: app5137; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    crypted_password character varying(255),
    salt character varying(255),
    remember_token_expires_at timestamp without time zone,
    remember_token boolean,
    created_at date,
    updated_at date
);


ALTER TABLE public.users OWNER TO app5137;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: app5137
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO app5137;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app5137
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app5137
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE avatars ALTER COLUMN id SET DEFAULT nextval('avatars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE favorites ALTER COLUMN id SET DEFAULT nextval('favorites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE friendships ALTER COLUMN id SET DEFAULT nextval('friendships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE licenses ALTER COLUMN id SET DEFAULT nextval('licenses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_associations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_nonces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE poems ALTER COLUMN id SET DEFAULT nextval('poems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE revisions ALTER COLUMN id SET DEFAULT nextval('revisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE urls ALTER COLUMN id SET DEFAULT nextval('urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app5137
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: avatars; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY avatars (id, user_id, parent_id, content_type, filename, thumbnail, size, width, height, created_at, updated_at) FROM stdin;
1	\N	\N	image/jpeg	ac4fb2e7a05fa1e42c7d781454678098.jpeg	\N	2461	48	48	2008-11-26 11:40:20.5456	2008-12-01 10:26:41.470457
2	1	\N	image/jpeg	ac4fb2e7a05fa1e42c7d781454678098.jpg	\N	2464	48	48	2008-12-01 10:26:39.587716	2008-12-01 10:26:41.785977
3	2	\N	image/jpeg	ysbw.jpg	\N	1790	48	48	2008-12-03 21:19:19.216674	2008-12-03 21:19:20.746294
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY comments (id, user_id, poem_id, created_at, body, is_private, updated_at) FROM stdin;
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY favorites (id, poem_id, user_id, created_at, updated_at) FROM stdin;
1	16	1	2008-12-04 04:42:15.628285	2008-12-04 04:42:15.628285
2	29	1	2008-12-15 12:42:15.975437	2008-12-15 12:42:15.975437
3	46	1	2009-01-21 19:11:12.068393	2009-01-21 19:11:12.068393
4	51	1	2009-01-24 14:03:52.436793	2009-01-24 14:03:52.436793
5	56	1	2009-01-24 15:09:39.615454	2009-01-24 15:09:39.615454
\.


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY friendships (id, user_id, friend_id, created_at, accepted_at) FROM stdin;
1	1	2	2008-12-03 20:06:58.380595	2008-12-03 21:18:19.730561
2	1	4	2009-01-08 05:54:38.367728	\N
\.


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY licenses (id, name, embed, created_at, updated_at) FROM stdin;
1	by_nc_nd	<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-nd/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 Unported License</a>.	2008-11-26 11:38:33.70581	2008-11-26 11:38:33.70581
2	by_nc_sa	<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License</a>.	2008-11-26 11:38:33.741175	2008-11-26 11:38:33.741175
3	by_nc	<a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-Noncommercial 3.0 Unported License</a>.	2008-11-26 11:38:33.743194	2008-11-26 11:38:33.743194
4	by_nd	<a rel="license" href="http://creativecommons.org/licenses/by-nd/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nd/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nd/3.0/">Creative Commons Attribution-No Derivative Works 3.0 Unported License</a>.	2008-11-26 11:38:33.74512	2008-11-26 11:38:33.74512
5	by_sa	<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 Unported License</a>.	2008-11-26 11:38:33.747351	2008-11-26 11:38:33.747351
6	by	<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>.	2008-11-26 11:38:33.749419	2008-11-26 11:38:33.749419
\.


--
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
5	1232669392	1209599	{HMAC-SHA1}{49790acf}{Awn4hA==}	HMAC-SHA1	http://www.clickpass.com/openid_server	m*|\\244\\213\\246\\333\\245\\204\\027\\277\\327w\\261l\\264P[c\\227
\.


--
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
1	1227728363		Nan1VY
2	1228155063		KJDcRJ
3	1228234725		l2HifP
4	1228359973		sJ1Jq6
5	1228360532		g1Ex0X
6	1228363571		GrmxAf
7	1228398769		7n5Ah0
8	1228404090		xr9pX5
9	1228434346		F3um5v
10	1228522146		xl3PO0
11	1228523697		LAUDt9
12	1228569428		GJxrw9
13	1228573919		0S5zrL
14	1228574217		RXEugT
15	1228604094		e1EIn1
16	1228681681		X7SrMu
17	1228685215		7dlf07
18	1228685653		qMspv8
19	1228700922		fMZd2j
20	1228792052		va3Npy
21	1228831845		pIKtpd
22	1228852592		3WtDwX
23	1228869955		1hbhid
24	1228874496		D1BM5t
25	1228876368		y4UZyP
26	1228917738		q8M5yK
27	1228943114		guAFms
28	1229105794		xOh3fh
29	1229118974		wq8vTc
30	1229126829		uMqVJl
31	1229127797		jK8fUP
32	1229203748		fJlMt0
33	1229310269		nKH77W
34	1229348306		mCHsQc
35	1229381990		UNlaQ5
36	1229387180		50L63b
37	1229437178		QStamu
38	1229438123		Q4zR4F
39	1229460537		WNum9W
40	1229522729		dCP7TB
41	1229527381		osn1e9
42	1229527436		8cDdwV
43	1229527728		haiW7q
44	1229534302		cHDT07
45	1229534424		PkWys1
46	1229563598		wypS3o
47	1229570051		OjFRpx
48	1229602223		iEG0Mf
49	1229641119		XB1uFH
50	1229657707		kX4pWf
51	1229736400		3TO21V
52	1229796044		2dF0nL
53	1229808996		Rpl0wE
54	1229965774		IICndo
55	1230045494		6mZKvS
56	1230083323		n1xbQD
57	1230138431		2ZCtJJ
58	1230138466		wUEgxH
59	1230176751		pDJGRB
60	1230190698		KrmCdn
61	1230268835		iEsdwI
62	1230393845		66xmtY
63	1230535075		Un0vTx
64	1230720819		7t1DKL
65	1230907600		wfLqYl
66	1230954952		dYzkwp
67	1230992865		0Q76SM
68	1231038268		93McEe
69	1231085325		zt2mR3
70	1231104768		PqM50n
71	1231105034		BykVZq
72	1231118259		ZhecFf
73	1231126516		lCxxEx
74	1231150938		oJgdl0
75	1231161910		Tgfgqh
76	1231385377		RfQYX4
77	1231422867		wFmyTm
78	1231505738		AIaMxr
79	1231542102		9XQnU3
80	1231655670		LY8BzB
81	1231658674		94VxL2
82	1231792820		og2aWL
83	1231824362		FOicv0
84	1231882716		EnlL9W
85	1231963519		GIIug2
86	1232041379		eZxhFR
87	1232088432		6GBFxc
88	1232218075		gYpyLU
89	1232222659		Eh7cP7
90	1232332141		ccxWvO
91	1232340310		gWTa8q
92	1232369277		tfLkLZ
93	1232370388		LcoRnr
94	1232376379		lDHN5u
95	1232396197		GTjEZ3
96	1232399427		eKH9s4
97	1232406110		7Byii0
98	1232406921		mlIDNz
99	1232409512		wllkOg
100	1232416683		JlhVhW
101	1232417541		VdPcng
102	1232515509		pI18FN
103	1232515686		yEi8XM
104	1232581594		qt5CYH
105	1232669393		wA7bvS
106	1232670189		tXiSJH
107	1232674132		kxipei
108	1232716561		Edtx0N
109	1232746927		1vQsye
110	1232752672		SuejkI
111	1232752812		8bMjYs
112	1232771596		6OlZPr
113	1232811287		CViaFY
114	1232834880		nYNYKl
115	1232893509		P6pbD3
116	1232915112		j6eYCK
117	1232931257		j8T6yb
118	1232931879		o9rI9h
119	1232945605		Jkuo99
120	1233667489		Xqzvl5
\.


--
-- Data for Name: poems; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY poems (id, user_id, created_at, updated_at, title, body, views, license_id, original_id) FROM stdin;
21	2	2008-12-04 15:48:28.549213	2009-01-26 04:25:44.166781	Rapunzel	Rapunzel, Rapunzel\r\nlet your hair fall,\r\nRapunzel, dear Rapunzel,\r\ninto my visage;\r\nAnd I know it hurts,\r\nbut pain is beauty,\r\nor is beauty pain?\r\nOne a natural event,\r\nthe other a judgment, disdain.\r\n\r\nJust let me get you free.	28	5	\N
37	1	2009-01-03 06:36:29.194051	2009-01-17 07:23:25.548486	Good Morning, Facebook	HAPPY BIRTHDAY MOLO.\r\nRough night in the E.R.\r\n\r\nHas what's going around--\r\nthe better alternative to what is out there.\r\n\r\nLooking forward to her date tomorrow.\r\nAt least I wasn't faking a knee injury.\r\n\r\nCosmic bowling at the tap house,\r\nit's good to have lawyers on your side.\r\n	11	2	\N
24	1	2008-12-07 13:44:55.603048	2009-01-21 01:01:53.985115	Untitled	We're on a road trip to the grocery store.\nThe sun behind the cumulus clouds makes the\nedges radiant white, the middle parts\ndarker, like slowly fire-roasted marshmallows.\n\nHalf of the apples are on the trees and half\nare on the ground as we pass the USDA fruit\nresearch lab and on past the bank parking lot\nwhere the Jeep burned up on Monday.\n\nOrange and white traffic barrels line the\non-ramp to Route 9.  The colors alternate\nin bands like orange creme popsicles.\n\nOne day, everything here might be underwater.	24	2	\N
36	2	2008-12-24 23:58:12.832705	2009-01-17 09:29:03.215016	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nA picturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far too slowly,\nand my lead met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act III - The Ride To Hell)\n\nFalling far away from my grace,\nhis hat did meet the floor,\nas did also his body fall,\nhis soul beckoned for more,\n\nand the shot was heard for miles 'round,\nas clear as the church bell,\ni shot that man, right in the head,\nand now I'm go'n to Hell,\n\nbut even so, 'twas dest'ny before,\nmy hand was on the gun,\nhis blood lies now all ov'r the wall,\nit's sad when one's time comes.\n\nRegaining all my composure,\nI arose from the ground,\nmy six-shooter back in holster,\nI quickly flee to town,\n\nthe sheriffs chasing after me,\nI bound as fast I could,\nI ran all day, and ran all night,\nmy legs proving their good,\n\na testament to my harsh ways,\nthe sky beamed down on me,\nand I saw his face in heaven,\nbut yet he looked at peace;\n\nI cried to the pool of stars,\n"I'm sorry for what's done,\nthe devil lies now within me,\nI did not fire that gun,\n\nI beg only your forgiveness,\nplease understand my pain,\nyou have found some form of true peace,\nand I stuck here, with pain,\n\nbeg you for your understanding,\nthat's all I wish from you,\nwhat's done is ev'dently done,\nand now I seek but truth..."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe face in heaven gazed at me,\nwearing not a disguise,\nand I could see his decision,\nin his passionate eyes:\n\n"I can not absolve you at all,\nthat's not my job to do,\nbut, there is one favour granted,\nI can yet forgive you;\n\nI see the devil in your skin,\nand I do know your pain,\nfor he once rode me at all times,\n'twas much to my disdain,\n\nbut yes, I do now forgive you,\nif you can one thing:\nget the devil off of your back,\nhes not at all your king."\n\nLooking to the sky, I asked this:\n"But how can I such?\nI promise the devil my soul,\nhe is my helping crutch..."\n\n"My friend, the answer approaches,\njust don't deny it then,\nyou will soon find your one solvent,\nand your pain will then end."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act IV - Soliloquy the First [Minor])\n\nI look to the skies, and I see stories,\nof people, of cultures past, now set free,\nI see a world of confusion and pain,\nwith a fool like myself caught in the game...\n\nI don't know why I sold my soul to him,\nbut something spoke to me from deep within,\nI shook his hand and he took my one soul,\nhe shoved me down, left me in hellfire's hole...\n\nI'm dancing on the line of real'ty,\nWishing for a day when I could be free,\nLucifer's laugh lies lurking in my mind,\nTorment knowing no form of stopping time,\n\nbut I chose this path of life, 'twasn't forced,\nso I now must continue with remorse,\nThere is much of my story left to tell,\nof my gradual descent into Hell.\n\n	35	5	\N
40	2	2009-01-07 19:40:14.520392	2009-01-17 09:30:32.816048	Whenever The World Goes To Sleep...	the monsters under our beds wake up.\r\nwhenever the world goes to sleep\r\nI refuse to believe.\r\n\r\nWhenever the world goes to sleep,\r\nthe nightmares are gone.\r\n\r\nThe dream world is a mist.\r\nAnd the dream world is gone.\r\n\r\nWhenever the world goes to sleep,\r\nI dream of being awake.\r\n\r\nWhenever the world goes to sleep...\r\nI fear for being asleep as well.\r\n\r\n	11	5	\N
41	2	2009-01-09 05:00:49.382372	2009-01-17 10:35:37.037	Snow	I saw the queen sitting there, all confused,\r\nif but for a moment, curious to why\r\nbeing stuck is supposed to be "good thing."\r\n\r\nReflecting?\r\n\r\nHer skin was free of the curiousity;\r\nher clothes were free of any reason,\r\nher body and mind elegantly free,\r\nwho was the snow queen?\r\n\r\nI remember sitting there, in queue;\r\nenqueued, rather, looking around,\r\nthe walls looking back at me,\r\nand seeing the surprises that were held.\r\n\r\nSnow queen? Is that you?\r\nI don't think so. Why?\r\nSnow queen.	13	5	\N
35	2	2008-12-23 19:10:03.071121	2009-01-25 00:17:12.726259	Thirst for Youth	Where is your haven now,\r\na decrepit building rotting into nothing?\r\nWish for youth harder,\r\nthat way it will runaway ever faster.\r\n\r\nMisery is your oarman,\r\nand depression is your boat;\r\nRow, everybody, row,\r\ndown the river of life;\r\nDesolation, the river of life.\r\nRow harder, everbody,\r\nuntil you reach land.\r\n\r\nChase your youth forever,\r\nit's never coming back.\r\n	20	5	\N
42	2	2009-01-09 05:07:02.928543	2009-01-17 12:11:05.311186	Dear...	Why is it that, no matter how I try,\nit comes out to events like these,\nalways? Always this madness, \nalways I'm crying, on the inside,\ndo I deserve to be just the rest?\n\nBefore school, no less, the tears came,\nand I can understand that it had to be said,\nbut could it have not waited? My day...\nMy life? I don't know. \n\nLove and need are different, \nvery much so, and I understand,\nI can definitely take a hint,\nand you know what it sounds to me?\n\nSecrets are being kept always.\nDo you have any for me?\n\nThe wheels of time never stop turning.\n\nBut they do often slow down.\n\nThey mystify us and what do they bring?\nA horrible wave of unknowing.\n\nI know what it is to need,\nand I know what it is, more than most,\nto love;\n\nI know that you think that the need\noutweighs the love in some respect,\nbut over this subject, I never jest,\nI know for sure that the love is dominant;\nneed may be dominant, from time to time,\nbut i want you to know that\nthat is not this time;\nNeed can vary, just as can love,\nand in this case, 'tis love been given the shove\nto the top; need is not non-existent, but\ncomparatively speaking, 'tis small.\n\nRegularly speaking, 'tis not big,\nnot big enough to be dominant.\n\nWhy does this invariably happen?\nIs it your way of saying\nyou want someone else?\n\nIs it your way of saying\neverything I did was for naught?\n\nIs it your way of saying\nI'm tired of all of this?\n\nIs it your way?\n\nI'm sorry that I do what I do.\nThe past is past;\nI've changed heavily since,\nand I just, honestly, wish\nthat you would not use it against me.\n\nI'm sorry that I try.\n\nWhat happened to perfection?\nOr am I some infection?\n\nWhere are you now?\n\nWhere were the words?\n\nForgive me for all that I've done...\nWhat am I saying?	11	5	\N
39	4	2009-01-04 19:40:35.408674	2009-01-19 13:23:59.969574	The Preamble (no trans-paragraph line breaks mix)	I'm going to start off this poem with an introduction. I'll explain when I wrote the poem and why and tell you about the significance the poem has for me. A few of the literary devices might be too obtuse, so I will explain them up front. \n\nIn no way will I ever consider editing this poem. After all, what is poetry if not the spur of the moment dribble of the mind, which can be assumed to be in perfect and final form--against which any modification is punishable by an increased likelihood of publication and third-party appreciation. \n\nYou may be tempted to drift off while I read, given the abstractness and vagueness of the images I employ.  I use this technique to avoid sounding like I am talking about myself and my last girlfriend, even though I clearly am.  This preamble is important to get the point across, since you occupy your mind during the poem thinking about your glass of wine, plate of food, cup of tea or whether there is anyone in the restroom at the moment.\n\nAt this point, you are almost sure I'm done with the preamble and you are torn between both a desire to hear me continue, since the poem at this point can be nothing but horribly anti-climactic and the equal desire to hear the damn poem and judge it on its own merit.  All of which is to say that this preamble was pointless, except to waste your time, which is valued at anything from $6.75 to over $50 an hour, meaning that instead of my ostensible goal of describing the fleeting complexity and gravity of seemingly everyday moments of life, I have instead reminded you of work.	14	2	38
31	1	2008-12-17 17:33:08.972334	2009-01-19 18:26:07.779581	Betty Duewel	I helped carry my grandmother's casket\r\nto the burial plot on a windy day so windy\r\nthat memorial flowers careened across the\r\ngraveyard like tumbleweed.  So windy that\r\nmourner's suits caught the wind, billowed\r\nout and pushed them closer to the opening\r\nin the ground.\r\n\r\nI was not prepared for how heavy the\r\ncasket would be, holding my thin grandmother\r\nwho had been ravaged by dysentery in\r\nher early years trying to take polytheism\r\nfrom the Hindus.  Perhaps our spirits make our\r\nbodies lighter until they leave, but then\r\nI'm just in the kind of mood that takes\r\nyou sometimes after your distant relative\r\ntries to raise your grandma from the dead.\r\n\r\nI thought about this for a while.  One\r\nof the men lowering the casket dropped\r\nhis notebook and pen and had to climb\r\nin to retrieve them.  If she woke and\r\nsat up, then the service would have been\r\nover before it started, the embalming\r\nwould have been a bad idea in retrospect\r\nand I would have had to start loving others\r\nout of fear instead of loving others for the\r\nway it makes me feel the world is right.\r\n\r\nAfter I got home, I climbed on to the\r\nroof of my house and let the sun set\r\nbehind me while I sat on the shingles and\r\nfaced the East, following the line\r\ndescribed by an angel with a trumpet\r\non the Freemason's meeting house\r\nthree blocks down the street.  I thought\r\nabout how relieved I was that I didn't\r\ndrop the casket and about the nice things\r\npeople said about my grandmother that\r\nI never knew before.	15	2	\N
27	2	2008-12-10 17:14:38.334997	2009-01-20 00:56:30.792454	Do You Still Walk With Me, Jesu?	Everytime I look to the city\r\nI see lights passing out\r\n   civilization dying\r\nthe tears of a new firmament \r\n   God is crying.\r\n\r\nFor no reason is there madness?\r\nSurely it persists for something.\r\nFor more chaos? For less?\r\n\r\nAre you on the cross yet, Jesus?\r\nI'm here blaspheming like the rest,\r\nwhy am I not next to your hallowed blood?\r\nAm I not good enough?\r\n\r\nWill you save yourself?\r\n     Fade away to another day\r\n     until the time is nary a\r\n     creature of disgust.\r\n\r\nDid you mean to?\r\n\r\nDon't get me wrong,\r\nI've been here all along.\r\n\r\nDo you still walk by my side,\r\nChrist, when I:\r\n        When I destroy,\r\n        when I toy\r\n        with others?\r\n        My manipulation is heard;\r\n        When I steal,\r\n        maim,\r\n        rob,\r\n        kill, all for a thrill?\r\n\r\nForgive me father,\r\nfor I have sinned.\r\n\r\nI only had a question,\r\nbut blasphemy it beckons.\r\n\r\nMadness, I reckon.	18	5	\N
47	1	2009-01-19 07:44:27.387406	2009-01-24 18:23:36.375575	Late January	Snowflakes drift about\ncats curled on a blanket pile\nwhite powder rooftops	6	2	\N
38	1	2009-01-04 08:19:34.274268	2009-01-21 19:29:39.901927	The Preamble	I'm going to start off this poem with an introduction.\nI'll explain when I wrote the poem and why and\ntell you about the significance the poem has for me.\nA few of the literary devices might be too obtuse,\nso I will explain them up front.\n\nIn no way will I ever consider editing this poem.\nAfter all, what is poetry if not the spur of the\nmoment dribble of the mind, which can be assumed\nto be in perfect and final form--against which\nany modification is punishable by an increased\nlikelihood of publication and third-party\nappreciation.\n\nYou may be tempted to drift off while I read,\ngiven the abstractness and vagueness of the images\nI employ.  I use this technique to avoid sounding\nlike I am talking about myself and my last girlfriend,\neven though I clearly am.  This preamble is\nimportant to get the point across, since you occupy\nyour mind during the poem thinking about your\nglass of wine, plate of food, cup of tea or whether\nthere is anyone in the restroom at the moment.\n\nAt this point, you are almost sure I'm done\nwith the preamble and you are torn between both\na desire to hear me continue, since the poem at\nthis point can be nothing but horribly anti-climactic\nand the equal desire to hear the damn poem and\njudge it on its own merit.  All of which is to say\nthat this preamble was pointless, except to\nwaste your time, which is valued at anything from $6.75\nto over $50 an hour, meaning that instead of my\nostensible goal of describing the fleeting complexity\nand gravity of seemingly everyday moments of life,\nI have instead reminded you of work.	40	2	\N
28	2	2008-12-10 17:16:06.789398	2009-01-23 18:26:58.488134	Memories of Yesterday	Don't you remember when\r\n    you smiled?\r\n\r\nOr is that time too far gone?\r\n	26	5	\N
6	1	2008-12-03 20:08:12.023354	2009-01-24 15:39:55.386547	Black Friday	Black Friday has come and gone. I am\nalone in Shepherstown, lugging my\nlaptop, a few books, my cell phone\nand a few uncommitted lines.\n\nThe temperature is below freezing,\nbut the sunlight is so good.  Warm on\nmy charcoal coat, sitting on a bench\nat the Wall, shortly before the\nbell rings out noon.  The sunlight\nis so good.\n\nBlack Friday has come and gone.  We'll\nfocus on retail performance until\nChristmas. Then we'll focus on the\nretail items themselves, ripping\nin to wrapping paper, the shredding\nsound of gross domestic product\naccompanied by squeals of childish\ndelight.	13	2	\N
7	1	2008-12-03 20:09:40.856837	2009-01-24 17:02:48.495	Gen Y	The sunrise outside my apartment window\nNewly-fallen leaves litter the sidewalk\n\nCan't find my digital camera\nProbably upstairs in the bedroom\nGotta buy another\nCan't miss a scene like this\nFriends and comments I'll never get\n\nChatting with you turns me on\nI hope you're not a bot\nI hope you're a girl\nIt's just... you don't have a search trail\nYour punctuation so fresh\nYour network so daunting	28	2	\N
51	1	2009-01-20 18:49:29.140787	2009-01-24 17:06:04.561408	The Obama Inaugural Address (Poem Remix)	Every so often the oath is taken\namidst gathering clouds and raging\nstorms, amidst a nagging fear\nthat the next generation must\nlower its sights.\n\nBut, the time has come to set aside\nchildish things.\n\nWe must pick ourselves up,\ndust ourselves off,\nreject as false the choice between\nour safety and our ideals.\n\nWe are shaped by every language\nand culture drawn from every\nend of this Earth.\n\nWe will extend a hand\nif you are willing to unclench\nyour fist.\n\nKnow that\nyour people\nwill judge you on what you can build,\nnot what you can destroy.\n\nLet it be told to the future world,\nlet it be said by our children's children\nthat when we were tested we refused\nto let this journey end.	14	2	\N
9	2	2008-12-03 21:22:14.980436	2009-01-24 18:40:58.779856	Behold!	O, behold!\n   Go down, go down to the riverbed,\n   Find your lord, find your head,\nO, be wary!\n   Open your eyes and flee this land\n   Away from oppression's hand,\nO, my brother,\n   Walk with me as I walk with the light\n   And we can escape on into the night\nO, my sister,\n   Take my hand on this unending path\n   And escape with me from all this wrath\nO, this world,\n   I find harder and harder to bare!\n\nO, behold!\n   Thy many wonders, grand world!\n   In a many short days, they were unfurled,\nO, respect!\n   Let me walk your green miles forever,\n   Let me see your unending beauty,\n   Brother, sister, let us sow our seeds in this Earth,\n   So that this beauty the future can see.\n\n	13	5	\N
56	1	2009-01-23 13:49:20.322759	2009-01-24 18:54:18.880415	Old Kodak Snap Labeled "Justin"	Asleep in the Hanged Man's posture,\r\na soft bed of wall-to-wall carpeting,\r\npaper bag color.  This three-year-old\r\nkid, three-year-old wind-up toy, has\r\nrun out of string for a few half-hours,\r\nuntil some cartoon pulls it again.\r\n\r\nHe dreams of following a baby dragon\r\nacross an island of tangerines,\r\nhopping sand dunes and scrambling\r\nup child-sized cliffs, wearing\r\nthe same comfortable denim overalls and\r\nstriped cotton shirt as the kid\r\npassed out on the floor.\r\n\r\nHe snoozes next to a piano leg in the\r\nupper left corner of the photograph.\r\nIn his dream, the boy and the dragon\r\nstop to rest under a great polished tree with\r\nivory leaves that harmonize in the breeze.\r\nLater, he saves the dragon from a\r\nvicious man-eating fern like the one he'd\r\nbattled with in the living room before\r\npassing out on the floor.	8	1	\N
57	1	2009-01-23 15:49:40.468184	2009-01-24 20:16:24.217724	Industrialize	You can't read the tea leaves steeped in a bag,\nthe leaves stay in and the future is uncertain.\n\nDraw the curtain.  They might live next door and\nyou might know their names, you might have a yard\nand twelve seconds of fame.\n\nGet off the airport after a week in the East and\neveryone looks like balloons, fat and empty,\nbut skin pocked like the Moon.\n\nIndustrialize.  Butylated hydroxytoluene, some\nnew fad, drag and jag.  Skip the tea leaves and\nread the tea stains.  That cup is empty, guys.	6	2	\N
45	2	2009-01-10 23:25:30.745361	2009-01-24 22:26:21.111602	Avant (Part 2)	The soul has a new adage, a passage\r\ninto the past age, the spiritual pastiche,\r\nPlastic clashes dispatch the chaste,\r\nblast down the mast, and the spells are cast,\r\nthe unseen observer, feasting on his fast,\r\nrunning out of ballast, there's no way to last,\r\nhe's tearing out his eyes and screaming for help,\r\nbut the ignorance is his bliss, his guest\r\nthe best that the god above will bless,\r\nwe're the wicked, where's our rest?\r\nwaiting with the mock-up clock, tick tock,\r\nanother second, another instant, another less extant,\r\nanother persistence, too insistent, the thoughts militant,\r\nand are you content to be so distant? \r\nthe child in the car seat, sitting back and crying,\r\nyour tears of sweet redemption are falsehoods, \r\nsacrificing your operation for the greater good,\r\nthe majority is irresponsible, not a syllable\r\nis heard, just the overall word, minority clawing\r\nat your doorstep, are you awake yet?\r\n\r\nThe clarity is rapping at your door, so begs he for more\r\nevery ultimatum is now on your agenda, a mind so tender\r\nso as to beg for forgiveness is the world's first jest;\r\nexploring every depth of your body, the spy studies\r\nand he is breaking himself down into the air you breathe\r\ntearing himself apart and fading in through your teeth\r\ninhale your own private observer, it's good to be heard!\r\n\r\nGo out and buy your own happiness for your soul,\r\nmanipulate yourself, your will is whole\r\nselling yourself out into an endless hole\r\nthe pit is an unforgiving place, and it's a disgrace\r\na seeming end point for all those of the human race\r\nthe condition that sentience surely isn't missing\r\nwith no construction or structure to speak of\r\nyou've lost yourself to the push end of the shove\r\nare you content to be a toy?\r\n\r\nGirls and boys holding hands under artillery\r\nand they know that they'll be set free\r\ntogether at the pearly gates of heaven, barring sin\r\nall the evil is clearly an invention that's human\r\nnot so sure what to do when you see Satan\r\ndisguised as Common Earth, America, Mexico,\r\ncorporate identities are on your wrist when you slice\r\nand they're on your neck when you find suicide\r\nand they're in your head when you shoot inside\r\nthe agenda of businesses is to be your abscesses, \r\nextraneous necessities? it's immortality's recipe\r\nto give yourself up to the barcode on your head\r\nlabel you directly to infinity and back\r\nanother number on a notepad.\r\n\r\nBuild yourself into your software without despair,\r\nand find yourself only under curiousity's air,\r\nyour opcodes are lost, are you the grand compiler,\r\nor perhaps just another glitch in the system\r\nlost yourself to all the worms therein\r\ntroy is at your gate with a present\r\na magnificent horse of unimaginable ascent\r\ndon't run from the world, you're just one instance\r\nunaware of your own presence, where is your _this_,\r\ncaught in the endless iteration, without consideration\r\nuninterpretable, garbage in and you're garbage out,\r\nthe garbage collection came and ended your clout,\r\ntakin' you from standard in, barring you from standard out,\r\nhoping that you can come and bust the stack\r\nbut your operation itself is a shoddy hack\r\ntry to ascend further, but root's not yours,\r\ndig harder, and you'll end up a martyr;\r\nwill you ever learn, or is it too much,\r\ncaught up in your yearning and such?\r\n\r\nAnd the spy is back in physical form\r\na creature made of animosity and war\r\nwatching you from miles away and more\r\nwhere are you now, and where were you then?\r\n\r\nAre you awake yet?\r\n\r\n	23	6	\N
33	2	2008-12-23 18:55:19.064521	2009-01-24 23:11:04.206435	Wind Resistance	Erosion is tearing away.\r\nI feel water under my roots,\r\nand wind in my leaves;\r\nI feel the land betwixt the water\r\nand I fading away faster and\r\nfaster into an obligatory nothing;\r\nwith your breath in my ears\r\nI can taste your fears.\r\n\r\nGrab my roots, I'll save your life\r\nand at what cost to you?\r\nNothing. \r\nMy leaves fall out and I am left\r\nalone in this madness, with the rest.\r\n\r\nTake my hand? What hand?\r\nTake my leaves? They're gone.\r\nMy roots are gnarled,\r\nmy skin is rotten and\r\nmy husk is a decrepit shell;\r\nmy soul is stuck in this hell,\r\nwaiting to be set free.	19	5	\N
44	2	2009-01-10 22:49:45.857402	2009-01-25 00:40:59.263407	The Queen	I saw her sitting away from the road,\r\na style all her own, her visage a mirror,\r\nreflecting the will of the viewer.\r\n\r\nI saw her sitting alone, enthralled,\r\na style defining her eloquence and beauty,\r\nsetting emotion and thoughts free.\r\n\r\nHer legs enticed the world around her,\r\na skin of pale wonders and unbroken majesty,\r\ndots of sunlight, ornamental touches,\r\nthe Gods shining their gazes softly.\r\n\r\nThe silk fell down from her head so smoothly,\r\nlocks of black denying the sunlight passage,\r\na shirt barring cover, stripes of red and white,\r\naccording itself to its own adage.\r\n\r\nAre you a human, creature? It can not be such;\r\nI fear you will shy away at the slightest touch.\r\n\r\nYour frame reaches out for my mind,\r\ntake me away from this world, distract me,\r\nenter now into my thoughts,\r\nand then you can surely set me free...\r\n\r\nDistinct thoughts become general concepts\r\nand hurricanes are tearing through my lucidity;\r\nI'm surely dreaming.	13	6	\N
34	2	2008-12-23 19:04:45.934595	2009-01-25 03:35:24.420301	Derelict	There's a rig somewhere out at sea\r\nwaiting out there for you and me;\r\nThere's a beauty waiting to be seen.\r\n\r\nTake my hand and walk into the forest,\r\namongst all the trees, homes of the best,\r\nhomes of the long forgotten, and newly born,\r\na confusing mess of left and right lost\r\ninto a reality of understanding without\r\nthe madness that is so necessary to life.\r\n\r\nDo you remember that one day,\r\nwhen I told you I'd stay?\r\nI sure do; I will never forget it,\r\nfor it's a promise I will keep,\r\nfor as long as I live.\r\nBut to what extent does it extend?\r\nUntil time itself doth end?\r\n\r\nI feel comfortable in myself, secure in nothing;\r\nsecure in everything, lost in my gazes into\r\ninfinity, haunting my reality with images\r\nof inanity and depravity;\r\nof beauty and understanding.\r\n\r\nSwim with me in the ocean,\r\nand feel the water on your skin;\r\nwith the aquarian creatures, \r\nI feel at home;\r\nwith the land acronauts, \r\nI feel at home;\r\nWith you, \r\nI feel at home.\r\n\r\nBut who are you?\r\nAnd why do you haunt my mind?\r\nWhy can you not just be there?\r\nWhy are you so hard to find?\r\n\r\nCome to me, and let me know\r\nwhat I have to do for your understanding,\r\nwhat I have to do for you,\r\nwhat I have to do to be free,\r\nwhat I have to do to know you,\r\nwhat I have to do,\r\nto do.\r\n\r\nI hung up my mind to a painful hell\r\nexpecting bliss in return;\r\nWhere is my head now?\r\n\r\nMy arms extend through the world\r\nmy body is the essence of life itself\r\ndecomposing back to nature, I feel\r\nlost in this conglomerated essence;\r\nRambling winds carry me forever.\r\n\r\n\r\n\r\n	20	5	\N
32	1	2008-12-17 17:41:20.204517	2009-01-25 05:49:04.083686	Second Poem from Bangalore	The motorcycle gangs are pudgy women in\nsaris, helmet optional, not a spike,\nchain or tattoo in sight.  Some\ncarry their babies in one arm over\nthe side of the bike as they trike\nthrough the mess in the street.\n\nThe kid with the useless legs (they look\nlike dead swans), crab-walks down Commercial\nstreet in the same spot that I saw him last\nyear when the rain wasn't here.\n\n(Don't watch the clouds.  Watch the crowds.  Put\none foot in front of the other.  The curry stand\nsmells so good.  Mind your bags.)\n\nOf the three of us, one\noverdosed on Ambien, one\nbought bracelets and one\nwalked by a dead man lying\non the sidewalk at M.G. Road.	22	2	\N
12	2	2008-12-03 21:40:12.465845	2009-01-25 07:08:31.517672	Pen Ink	Black, blue, red, my pens bleed words;\r\nInk spills forth,\r\nand the thoughts won't stop.\r\n\r\nWhite noise echoes around me,\r\nall I truly hear, feel, is the\r\ntouch of the pen on paper, the\r\nsound of ink meeting paper,\r\nthe paper so properly taking this.\r\n\r\nMy mind is rushing:\r\n"Beowulf is dead!"\r\njust like the paper he was\r\nso written on,\r\n  stories fill up my mind\r\nas though an empty clay vessel\r\n  with precious water\r\n\r\nMy words come in logorrheic\r\nfashions, and I can not\r\ndeny these hypergraphic\r\nurges.\r\n\r\nThis pen is my disciple,\r\nthis paper, my gospel,\r\nAnd this world, my muse...\r\n\r\nYou, my muse.	15	5	\N
15	2	2008-12-03 21:43:09.851789	2009-01-25 08:08:36.24393	Classroom Days	Early morning, awake for a new day,\r\nGet dressed, sleep, and reawaken;\r\npassed out on the hardened floors,\r\nmy backpack is calling my name;\r\nBeep beep, the car is calling me in\r\nthe radio tuned to some bit of\r\ndeep white noise\r\n\r\nThe road is seemingly never-ending,\r\neach passing second is another notch\r\n        in my mind;\r\nThe white noise is getting ever\r\nlouder, my heart is beating\r\nmy mind racing, so many\r\nquestions left unanswered.\r\n\r\nMy phone is vibrating,\r\nrumbling on my skin,\r\nreaching to open it I see\r\nwords that bring a smile to my\r\nface; the day has gotten better.\r\n\r\nStopping in front of the school,\r\nI am forced to exit, I see\r\nchildren, adults, walls, windows...\r\n\r\nFirst period, I am at aphelion;\r\nthe milky way divulges the secrets\r\nof its heliocentricism;\r\nThe universe tells  me its\r\nsecrets, satellites flying out\r\ninto the void; velocities, angles,\r\nmeasurements, numbers.\r\n\r\nHallways are full, and I\r\n       want to cry.\r\n\r\nSecond period, computer screens\r\nlighting up my eyes, the sound\r\nof keyboards, mouses, and mind,\r\nthe words never cease.\r\n\r\nHallways congest and dissipate;\r\nthere is no peace in this madness\r\n              STOP!\r\n\r\nThree periods and I'm falling,\r\nmy apex long past gone\r\nand I hear the story of\r\nthe most honoured of warriors,\r\nGeatish bringer of death; a dragon,\r\na pen, and infinite potential.\r\n\r\nOutside the school,\r\nI await the vessel from this\r\nevil place...\r\n\r\nAnd yet, I don't want to leave.	14	5	\N
43	2	2009-01-09 15:09:50.913444	2009-01-25 08:22:27.677438	Avant	Open what door there is to charge\r\nI forgive the night despite all my spite,\r\nThe spy is observing your every movement,\r\nevery moment.\r\nMomentous occasions, tumultuous situations,\r\nhis entropic touch gripping you, caught you in his clutch,\r\nhis car rolling at the hands of a ghost, an unseen host,\r\nflippant and distant, dismissing of all admission,\r\nit's coming apart in society's mind like nuclear fission\r\nI'm caught sitting alone in remission:\r\na comatose dramatic, traumatic lack in,\r\nI'm back in the black end, maps hack and attack men,\r\nyour GPS can't guide you, nor find true north,\r\nwith your mind coming forth, and up in the mirth\r\ncaught ya right up in the hearth, dip in the drink,\r\nin the surf our turf is expanding back to his attitude,\r\nhis altitude, humanity for hire and we're higher\r\nwe never tire, our souls ablaze with fire, happy liars,\r\nour combined voices and choices are all the sacrificing us to the fall\r\nBreak your heart and fake your part, I and I in thrall\r\nenthralled in your halls, is that all of your placid wrath?\r\nSecrets and Jesus are comin' down your path,\r\nObservant muses disappropriate the most humane of hate,\r\neuthanasia is tears and fears bliss for this\r\nIgnorance is, hence, our tense and ever since...\r\nWe woke up.	29	6	\N
55	2	2009-01-21 19:51:33.934641	2009-01-25 12:24:03.5606	Jealous Sol	He opened his eyes and looked to the west:\r\na brilliant, blinding light, a beautiful sight,\r\nhe could not help but follow it;\r\nhis path was littered with many a difficult passage,\r\nfollowing the Polaris of his love, he was guided\r\nuntil he came to a point where the light \r\nwas at his zenith;\r\n\r\nHe reached up into the sky, hoping to clasp\r\nand return to Earth, some stardust in his grasp;\r\nher remains? No, her offerings, a guide further\r\nin his persisting quuest to locate her.\r\n\r\nAnd so he roams the lands for days and years\r\ncasting away all of his foolish fears\r\nuntil he finds himself at the point of giving up...\r\n\r\n"You never had to come this far in the first place"\r\nsaid she as she appeared beside him, lifted him up,\r\nbrushed off his face, and gave him a kiss.\r\n\r\nHe looked at her, a smile too weak a word for his expression,\r\nand returned the kiss with at least doubled passion;\r\nwhen it was over with, he found himself engulfed in her body,\r\nencloaked by her arms, but she also by his, and such would he\r\nalways rather, if it were his choice, have it be.\r\n\r\nHis arms refused to let her from his grasp, \r\nand his lips finally find their target at last.\r\n\r\nThe world around them began to disappear into darkness\r\nleaving them in a void of green, red, the spectrum,\r\nenveloping them in a beauty unimaginable by mere mortals;\r\nthey would, thereafter, never leave each other's arms\r\nforever protecting each other from the world's harms.\r\n\r\nHe kissed her softly once more, and then once thereafter,\r\n"I would have wandered endlessly for you, writing my chapters\r\nas each new moment would pass along, the thought of you fuels me\r\nand shows me that soon i will find something to set me free."\r\n\r\nHis hand slipped from her back up to her hair,\r\nand he found himself at home, the softness there\r\nwould lead his hand around in my different circles,\r\nangles, shapes on her head; he would not stop at all.\r\n\r\nAnd so the story would go on, from day to night\r\nthe two together, love at it's purest;\r\nfor her, he would forever fight.\r\n\r\n	10	5	\N
59	2	2009-01-24 12:03:12.0637	2009-01-25 12:25:01.335113	A Family	He stands there, his hair cascading\r\nand falling out onto his shoulders\r\nrunnning down his body to his breasts\r\nhis arms wrapped around her, his eyes\r\ngazing directly into hers, into her soul.\r\n\r\nShe stands there inside his arms\r\na smile permanently plastered on her face\r\nhearing every last bit of his non-ending grace\r\nhis sweetest words falling into her ears\r\nand into her mind, residing permanently.\r\n\r\nHe goes forward, and meets his lips with hers\r\nembodying his love for her with a single contact.\r\n\r\nJealous eyes on the horizon observe\r\nand watch something they could never have:\r\na connection like this, a love like this.\r\n\r\nHe pulls from her slightly, so he can see her\r\neyes again; he lets a few words fall out:\r\n"To say I love you would be too weak a statement\r\nto express my most deepest of sentiments;\r\nto say that you mean everything in this world to me\r\nwould be too little to explain exactly what you mean;\r\nto tell you that you are the best thing to happen to me\r\nis too weak a statement to explain how much you've set me free."\r\n\r\nHe goes forth to kiss her once more,\r\nand she as well, their lips meeting\r\nin a moment of sheer ecstasy that lasts\r\nfrom now until forever.	8	6	\N
60	2	2009-01-24 14:13:50.413146	2009-01-25 12:31:41.296452	Still Life	Freeze frame image of a smiling face\r\nlittered with freckles, a gap in his teeth\r\nhis hair short but definitive,\r\na little boy in suspenders smiling \r\nfor daddy's camera.\r\n\r\nHis eyes, his hair, his tone are a\r\nspirit lost to the majesty\r\nof black and white photography;\r\nhis left hand holding a lollipop\r\nand his right in his pockets.\r\n\r\nThe dog is running about the yard\r\ncaptured in this little bit of\r\neternity, howling and barking and\r\nchasing his tail, chasing the cats\r\nchasing the squirrels, chasing life.\r\n\r\nOn the ground lies matchbox cars\r\nset up in random fashions to belie\r\nsome form of false reality;\r\nrace cars chasing minivans and \r\nmonster trucks parked by S.U.V.'s;\r\na streetwasher in the grass, cleansing\r\neach and every individual blade with\r\nwhat power it can muster, a bulldozer\r\ntrying to tear up the cement, a complete\r\nscene of the Young Mind's Nirvana.	6	6	\N
5	2	2008-12-03 19:37:23.111054	2009-01-25 15:35:21.161501	MAN OF BAT	I AM BAT MAN\r\nDESTROYER NOW\r\nHAIL, ARTISAN\r\nTHIS IS MY TOWN\r\nGIVE ME YOUR WARES\r\nAND I WILL NOT KILL\r\nOR AT LEAST TRY NOT TO\r\nTHE URGE LURKS STILL.	15	6	\N
58	2	2009-01-24 11:36:08.507549	2009-01-25 17:04:49.370345	Polaroid	Man and woman, porch swing,\r\nchildren running about in the yard,\r\na dog chasing them throughout.\r\n\r\nA pie sitting on the windowsill,\r\n5 o' clock is rolling around,\r\nand Grandma beckons everyone in.\r\n\r\nThanks has been given,\r\nthe turkey is passed around,\r\nthe stuffing as well.\r\n\r\nFamily laughing, dog yipping,\r\nchildren smiling, parents grinning,\r\nhappiness is everywhere.\r\n\r\nA picture is worth as many words\r\nas you will let it be.	6	6	\N
30	1	2008-12-17 17:32:24.220842	2009-01-25 17:53:38.884889	The Wind is Taken into Consideration	The sun is bright outside my office window,\nreflecting off of the snow huddled around the\noutside edges of the sparsely populated\nparking lot between my office and the\noff-white house-ocean with yards barely\nwide enough to fit a mower between the\nfence and the porch.\n\nJapanese girls are asleep right now, resting\ntheir bloody thumbs from furiously drafting\ncell phone novels about angst, passion, clothes\nand infectious disease on the long ride from\nsomewhere to elsewhere on another train in\na long line of trains into tunnels in the dark.	18	2	\N
11	2	2008-12-03 21:38:40.162341	2009-01-25 20:31:48.038517	My Mind	I close my eyes,\r\nI see you standing there;\r\n\r\nI ask for a surprise,\r\nand I feel your stare;\r\n\r\nI wish for just a bit of help,\r\nand what do I get?\r\nThe thought of your voice\r\ncreeping through every crack\r\nand bit of darkness in my mind,\r\nand I can not help but smile.	12	5	\N
54	2	2009-01-21 17:14:23.684103	2009-01-25 20:52:19.137497	BUH-R8 (New Waiver)	I hear that you are one of those new ones.\r\n\r\nWell, I've come here today for an announcement:\r\nPlease put your name on the dotted line\r\nand be sure to turn in the white and pink \r\nonly; the yellow is yours to keep.\r\n\r\nAnd be sure that you sign your signature in pen,\r\npencil leaves marks that are far too thin.\r\n\r\nYes, we expect you to get hurt, and so, to be safe\r\nwe ask you to sign away your life to a piece of paper;\r\nthat's the price of having fun, don't you know?\r\nIt's safety or a signature voiding our responsibility,\r\nbut it's not like it's that unsafe: only the unimportant die\r\n(though countless have been hurt on this ride)\r\nbut you didn't hear that.\r\n\r\nRelinquish your soul, or just go somewhere else;\r\nbut we're the main proprietors anyways.\r\nGood luck finding someone better.	10	6	\N
17	2	2008-12-03 21:45:20.351763	2009-01-25 21:30:20.488878	Breathe	Life is a dream.\r\nLife is a dream;\r\nA comatose paradise.\r\n\r\nI await the day of return,\r\nWith anxious thoughts.\r\n\r\nI can easily pretend,\r\nThat I don't want it to end,\r\nBut the truth is evident,\r\nIn all that I say and do,\r\nAll that I think of you,\r\nAnd words flow like water\r\nin a constricted place\r\ncompressed into no space;\r\nmove forward, mind,\r\nmove forward, time.\r\n\r\nWill you be waiting\r\nat the end of the road?\r\n\r\nWake up from your dream;\r\nWake up, damn it!\r\n(there's a letter for you\r\nwaiting on the table\r\nif only you were able.)\r\n\r\nSo now, are you just\r\na text document on my computer?\r\nSo now, are you just\r\nbytes upon bytes, nothing further?\r\nAre you a jpeg, a gif, a png,\r\nor a truly more wonderful thing?\r\n\r\nThere were a few dots in the way,\r\nBut I read on because it is you,\r\nSomething for a rainy day,\r\nor a beautiful day,\r\nA time with no dismay?\r\nHeavens.\r\n\r\nWhy reduce yourself to a mere memory?\r\nYou can easily be more, you see?\r\n\r\nI await your return. 	27	5	\N
10	2	2008-12-03 21:31:01.55971	2009-01-25 22:19:35.603237	Breadcrumbs	Am I following a never-ending path\r\ntowards a chasm of despair,\r\nsitting here without you?\r\nYou sit so far away\r\nand yet I feel you here,\r\nhow do you do this voodoo?\r\n\r\nAre you more than the pixels I see?\r\nSurely, surely, you must be,\r\nfor I feel you in the depths of my soul;\r\nyou are more than the text files\r\nthat make up your logs,\r\nand you are more than the picture\r\nput up on all your blogs.\r\n\r\nYou are more than just a few words\r\nbroadcasting through my ethernet,\r\nmy most faithful of wireless networks,\r\nthe fidelity therefrom unmatched\r\njust so I can see your picture\r\nand see your words; so I can speak\r\nand be spoken to.\r\n\r\nSo I can get on my messenger,\r\nand see you sitting there,\r\nwith a smile and two free hands\r\nready to type, \r\nto let your fingers dance.\r\n\r\n(The internet is a crazy thing,\r\ndon't you think?\r\nI went from barely knowing you,\r\nto holding a love so true,\r\nwithin less than a day;\r\nIn fact, 'twas a mere three hours,\r\nand the same was said of you;\r\nthis network holds insurmountable power,\r\nguiding us to truth.)	23	5	\N
20	1	2008-12-04 04:47:30.716449	2009-01-26 05:52:42.165819	Answering Machine	*BEEP*\n\nAbsolve me\nforgive me\nteach me\nreach me\nlead me\nneed me\nleave me.\n\n_Structure._\n\nTell me\nhelp me\nfell me\nsell me.\n\n_Give me more._\n\nStomp down the road.\nStomp d- *STOP*\n\nRecorded.\n\nClick. Pick up.\nDial.\nLet it ring.\n\n*BEEP*\n\nStomp down the road.\nKnock on my front door.	62	6	16
26	2	2008-12-09 18:47:44.342645	2009-01-25 23:47:55.333699	Eskimo	You shan't worry at all,\r\nnever could I see you fall.\r\n\r\nDoes the snow look beautiful\r\nfalling down from the sky?\r\nSurely, never more beautiful\r\nthan:\r\n      your words,\r\n      your thoughts,\r\n      your self,\r\n      your life?\r\nSurely, never more beautiful.\r\n\r\nClose your eyes and see \r\nbeauty;\r\nwill you find yourself\r\n   on the beach?\r\n   'twixt the trees?\r\n\r\nLay down under the sheets\r\n    toss and turn and\r\n    reside in your mind;\r\n    let me take your hand.\r\n    I will guide you \r\n    through all this madness,\r\ndon't speak, just think.\r\n    Don't worry, don't fear,\r\n    my soul is always near,\r\ndon't worry your beautiful mind\r\njust close your eyes and find\r\nthe beauty inherent inside.\r\n\r\nO, Lady N'raya:\r\n   lover\r\n   savior\r\n   benefactor\r\n   my sister\r\n   my friend\r\n   my kin\r\nHow lucky am I\r\nto have you in my world?\r\n\r\nDon't fret, don't worry\r\n   you will survive\r\n   you will persist\r\n   such I heartily insist.\r\n\r\nJust close your eyes\r\n    and lay down\r\n    be there, be here\r\n    be far, be near\r\n    just be.\r\n\r\nI will walk with you\r\n   through the valley of death\r\n   through the valley of life\r\n   to the event horizon\r\n   and further beyond\r\nI will stand by you\r\n   in harshness and in\r\n   beauty;\r\n   in pain, suffering,\r\n   and in elation.\r\n\r\nUntil time itself distorts\r\nand severs reality;\r\nuntil eternity no more is\r\nand reality is just a\r\nlost concept\r\n  a lost art\r\nI will be in service to you \r\n       be there for you.\r\n\r\nThis I promise.\r\n\r\nThis I cannot deny\r\n   such a truth?\r\n   nary a lie.\r\n\r\nClose your eyes and...\r\n     sleep.\r\n     I will be there\r\n     just as you are here.\r\n\r\nWrap up in the cold, and\r\n     feel me there\r\n     for I am there.\r\n\r\nEskimo, it is never too cold.\r\nTake my essence\r\n     I will share\r\n     forevermore.\r\n\r\nClose our eyes,\r\n    drift off to sleep\r\n    counting all your sheep.\r\n    \r\n    Fret never.\r\n    I remain;\r\n    this I promise.\r\n       	20	5	\N
18	2	2008-12-03 21:46:47.276569	2009-01-26 00:48:46.772302	Essence (Of)	Compromises dangle,\r\npour like streams of\r\nnever-ending bliss,\r\nwater fountains ringing out\r\ndispensing vitality\r\nnutrition\r\nvolition\r\ntradition...\r\nHealth?\r\n\r\nEars betray;\r\nfalse soundscapes,\r\necho (echo?)\r\necho;\r\nlet go.\r\n\r\nSoul at rest,\r\nactively enough,\r\ncrying eyes,\r\ndrying eyes,\r\nare you there?\r\nIt's me, the truth;\r\nit's me, essence.\r\nI am of you,\r\nare you of me?	22	5	\N
46	1	2009-01-17 12:17:51.095841	2009-01-26 01:00:04.092162	Avant (Brand Recognition Slam Mix)	Open what door there is to change.\nForgive the night despite all your spite.\nThe spy is observing your every movement\nmomentous occasions, edge situations,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind went forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars.\nBreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls.\nSearching is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	10	2	43
23	2	2008-12-05 16:14:07.870265	2009-01-26 01:23:44.437545	I'm waiting.	I'm waiting here for you.\r\nRing, ring, ring,\r\nmaybe you'll pick up this time.\r\nMaybe you'll say hello,\r\nand bring a smile to my face,\r\nor maybe you'll just say no,\r\nand cause my heart to race.\r\n\r\nRing.\r\n\r\nThe ringing won't stop now.\r\nI hear a voice mail message;\r\none of those preset ones.\r\nWhy couldn't it have been your voice?\r\nWhy this annoyance, this robotic thing?\r\nI guess I'll leave a message,\r\nand later resume calling.\r\n\r\nRing.\r\n\r\nIt's still ringing in my head.\r\nConstant rings are invading my privacy:\r\nmy mind, my ears, my soul,\r\ncasting me down into a deep hole.\r\n\r\nClick.\r\n\r\nThe ringing persists.\r\n	28	5	\N
29	2	2008-12-10 17:19:33.581084	2009-01-26 04:16:25.521493	Pessimist	My memories are stains on the counter.\r\nOrange juice spilled upon the ground,\r\nthe remnants of the carrots I sliced,\r\nonions, neatly sorted and diced.\r\n\r\nMy memories are the corn in the can,\r\nthe vegetables contained by machines,\r\nby metal and a welcoming label,\r\nwaiting to be opened by someone.\r\n\r\nDo you remember when,\r\n   we were our own generation?\r\n\r\nDo you remember when,\r\n   I fell down and you assisted me,\r\n   heaved me back up,\r\n   handed me a band-aid and a smile?\r\n\r\nMy memories are scars on reality.\r\n\r\nMy memories are beauty;\r\nwhat are yours?	39	5	\N
52	2	2009-01-21 16:10:08.578422	2009-01-26 05:55:38.515785	Stop	Stop going on about your nothingness;\r\na bunch of suits sitting in a row\r\nplanning out their fates, yours, \r\nand mine as though it were their job\r\nto determine exactly how we live\r\nhow we breathe, how we eat,\r\nand how we are supposed to think.\r\n\r\nStop being pragmatic static, \r\nnoise on the plates, that's your fate.\r\n\r\nYou can't take control of freedom,\r\nbarring out free will? That's a good one;\r\nbut I'm glad you are working for a better tomorrow;\r\nmaybe it will be better than these horrible todays,\r\nthese horrible, tragic days met with much sorrow,\r\nwith suffering and loss, depression at a high;\r\ncan you fix it? Sure, it's always worth a try.	9	6	\N
14	2	2008-12-03 21:42:20.63152	2009-01-26 06:00:37.283347	Choices	A cool breeze would lift,\r\nIf I were meant to be lifted;\r\nI can't feel much, other than\r\nthe air blowing my hair;\r\nThe pain in my chest;\r\nThe pain in my head;\r\na rising sickness.\r\n\r\nDecisions are so grand,\r\nlike happening upon a new life.\r\n\r\nMy breath is shorter and such,\r\nand I wish I could just\r\npick the phone up...\r\nA few numbers are not fear,\r\nand your presence is oh so near.\r\n\r\nChildren on swings, adults smiling.\r\na cool breeze should lift.\r\n\r\nI can see from here, there,\r\nand alone in my pursuit,\r\nI wish for naught but a sound.\r\n\r\nSplit navigation is in my mind...\r\nLeft path or right? Or do I\r\njust wander around aimlessly?\r\nWhy can't I be guided?\r\n       I will listen...\r\n\r\nHappiness, prosperity; words!\r\n\r\nLists will defeat the purpose;\r\nMy mind rushes here now,\r\nand I feel nothing more here.\r\n\r\nI want too much, or perhaps\r\nI am just selfish;\r\nSelfish as Midas himself.\r\n\r\nI just want to understand.\r\n\r\nCars pass by, and I resist;\r\nmy mind tells me to give up,\r\nbut I can hear that sound.\r\n\r\n\r\nFinishing touches\r\nand it's such a bright layer...\r\nBlindness.	12	5	\N
13	2	2008-12-03 21:41:51.394926	2009-01-26 08:54:32.932885	Wishful Thinking	The vision that my eyes so lust after\na creature, a being, a wondrous thing\nI feel so undeserving and puny;\n\nWhen I do close my eyes, what do I see?\nA pain-ridden, fallen angel crying,\nAnd all I want is to offer my help;\n\nBut then I open my eyes, and she's gone,\nIn my dreams, she comes, sits, and smiles with me,\nWith the beauty and purity of a fawn,\nIt's with this dear jewel I wish to be,\nA being like none other before her,\nIs this feeling just lust, or is it love?\nEither way, she's a gift from above.\n\nAnd when I look to her face and see her tears,\nAll I wish to do is wipe them away,\nBe the comfort from all of her dark fears,\nAnd let her know that I am here to stay;\n\nDark skinned containers of knowledge express,\nThat which mere words could never do alone,\nLike a tome detailing all of my love,\nDedicated only to her, the best,\nThe one I wish to call only my own,\nSimply precious and pure, as though a dove;\n\nAnd when I look at myself, I feel naught,\nAs I were so wholly undeserving,\nOf such an angelic creature;\n\nIf only the world would work differently...\nMaybe in that case, it truly could be,\nA time in which it could be her and me...\nWith time, perhaps such a thing will be seen.\n\n	10	5	\N
53	2	2009-01-21 17:00:44.842867	2009-01-26 10:16:41.028408	Morse Code	Dots and dashes are in your mouth\r\nand words are pouring forth\r\ninto an endless stream of pessimism,\r\na world which obliviates you\r\njust as soon as it incorporates you\r\nand shows you its true north.\r\n\r\nA structure was built in your mind\r\na transmission relay inside you and me\r\nare you willing to lose the right to be free?\r\nThe world closes in and locks you in,\r\nconfines you to a canvas of black and lighter\r\nbut no true hue or saturation to be found;\r\njust darkness and low contrast in every last\r\nminute detail of the world around you.\r\n\r\nThis world is a memory, waiting to forget you\r\njust as you are waiting to forget it.	7	6	\N
61	2	2009-01-26 10:08:22.650143	2009-01-26 13:05:37.051883	Nature Nouveau	(World is spinning)\r\n\r\nTree sits firmly still\r\nnever to be overcome\r\nthe wind blows softly.\r\n\r\n(River is running)\r\n\r\nA fish swims deftly\r\nreluctant to be captured\r\nthe fisherman sighs.\r\n\r\n(Waterfalls cascade)\r\n\r\nFor many a foot\r\nthe water falls ever down\r\ndetermined to fly.\r\n	2	6	\N
62	2	2009-01-26 11:24:43.853053	2009-01-26 13:06:02.669861	The Form Of Love	He takes her hand in his, and, smiling\r\nplants a kiss on the backside of it.\r\n\r\nHe runs his hand through her hair,\r\ngazing intently into her eyes, an expression\r\nof love piercing through from his soul \r\ninto his visage, into his eyes, transmitting\r\nitself directly to her.\r\n\r\nHe wraps his arms around her, \r\nkissing her on the forehead, on the cheek,\r\non her lips, on her very soul.\r\n\r\nHe goes to her ear, and whispers promises,\r\nbeautiful words of an indescribable nature,\r\nspeaking to her of his love for her, of his\r\nunfathomable devotion and dedication to her.\r\n\r\nHe pulls himself back, looking her in the face,\r\nand what a beautiful face it is, he would say;\r\n"Never before have I met one like you, and\r\nnever after now do I want to meet another;\r\nall I want to do is take your hand in mine,\r\nand become one with every bit of your being."\r\n\r\nHe lays one more kiss upon her lips,\r\nthen lays down on the bed, pulling her down\r\nwith him; he smiles at her as the two fall\r\nasleep in each other's arms.	2	5	\N
25	1	2008-12-09 06:15:53.962519	2009-01-26 13:47:33.721419	Summer, 2001	Remember when she flooded the kitchen, trying to wash\nher muddy jeans in the dishwasher?\n\nA quarter bought a whole block of fresh\ntofu out of the ice cold buckets.\n\nDan ate bananas covered in chocolate\nsauce on the couch.\n\nWe found seven lush, potted plants in the shower\nin an empty dorm room.\n\nDean found a D-Cell battery in\nthe desk of another.\n\nThe price on kiwi was good.\nI had a mattress on the floor.\nYou had a son.	36	2	\N
4	2	2008-12-03 19:34:13.026606	2009-01-26 14:40:06.442697	Westernmost Slice of Aspect	Three thousand and\r\nmore climbing upwards;\r\nholding the hand\r\nof the shepherd's herds,\r\nhe wanders through time;\r\nAn aspect of *MIND*.	15	5	\N
16	2	2008-12-03 21:44:39.673546	2009-01-26 16:25:55.71099	Simply Difficult	"If you called this number, you know who I am. Leave a message at the tone."\r\n\r\nThe tone?\r\n\r\nBEEP.\r\n\r\nAbsolve me\r\nforgive me\r\nteach me\r\nreach me\r\nlead me\r\nneed me\r\nleave me.\r\n\r\nAre you the structure?\r\n\r\nTell me\r\nhelp me\r\nfell me\r\nsell me.\r\n\r\nI look to your eyes for forgiveness\r\nand see pools of black despair;\r\nsurely this is not the best\r\nthat you can spare?\r\n\r\nStomp down the road.\r\nStomp d-\r\nSTOP.\r\n\r\n"This message has reached the longest length allowable. To send your message, press 1. To hear your message, press 2. To rereco-"\r\n\r\nOne.\r\n\r\nClick. Pick up.\r\n\r\nDial.\r\n\r\nRing. Ring. Ring.\r\n\r\n"If you called this number, you know who I am. Leave a message at the tone."\r\n\r\nAh, the tone.\r\n\r\nBEEP.\r\n\r\nStomp down the road.\r\n\r\nWill you save me?\r\nWill you set me free?\r\nI love you, words.\r\n\r\nMy mind awaits you.\r\n\r\nCLICK.\r\n\r\nNo one likes using the phone anyways.	34	6	\N
22	2	2008-12-04 15:51:18.438271	2009-02-02 23:59:45.425441	My World	I am (Gary Warman)\nA name is all it is;\nReality is defined by my hand,\nto the extent which I\nallow;\n\nI am (a poet)\nI use words to\nEnlighten me,\nEnlighten you.\n\nI am.\n\nI am green, blue, red,\nmany colors;\nI am alive, breathing, *dead*\nmany different states;\nI am here,\nand only here.	31	5	\N
19	2	2008-12-03 21:47:32.426208	2009-02-03 00:01:41.761263	Comatose State	Darkness. Darkness. Darkness.\r\nFlashing glimpse of light;\r\ndarkness.\r\n\r\nSounds permeate;\r\nlife penetrates,\r\ndigs into unseen depths,\r\ndarkness lessens,\r\nflashing lights return,\r\ndarkness is sin,\r\ndarkness is safety,\r\ndarkness is free;\r\ndarkness is here.\r\n\r\n"please wake up\r\nplease wake up\r\ni need you\r\nto wake up for me;\r\nyou've got to wake up\r\nyou've gotta,\r\ndon't you see?\r\nplease..."\r\n\r\nComatose;\r\nBlocked out from the world.	33	5	\N
8	1	2008-12-03 20:10:13.310803	2009-02-03 00:28:49.020145	Predictive Text	I'm looking for the new\ngeneration of poets,\ntexting lines back and\nforth.\n\nThumbing on their cells.\nWriting while they move\nNo need to sit down or\neven stop.	41	2	\N
\.


--
-- Data for Name: revisions; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY revisions (id, poem_id, created_at, title, body, updated_at) FROM stdin;
13	9	2008-12-03 21:24:36.296803	Behold!	O, behold!\r\n   Go down, go down to the riverbed,\r\n   Find your lord, find your head,\r\nO, be wary!\r\n   Open your eyes and flee this land\r\n   Away from oppression's hand,\r\nO, my brother,\r\n   Walk with me as I walk with the light\r\n   And we can escape on into the night\r\nO, my sister,\r\n   Take my hand on this unending path\r\n   And escape with me from all this wrath\r\nO, this world,\r\n   I can no longer bare at all to take.\r\n\r\nO, behold!\r\n   Thy many wonders, grand world!\r\n   In a many short days, they were unfurled,\r\nO, respect!\r\n   Let me walk your green miles forever,\r\n   Let me see your unending beauty,\r\n   Brother, sister, let us sow our seeds in this Earth,\r\n   So that this beauty the future can see.	2008-12-03 21:24:36.296803
14	9	2008-12-03 21:24:50.810655	Behold!	O, behold!\n   p(. Go down, go down to the riverbed,\n   Find your lord, find your head,\nO, be wary!\n   p(. Open your eyes and flee this land\n   Away from oppression's hand,\nO, my brother,\n   p(. Walk with me as I walk with the light\n   And we can escape on into the night\nO, my sister,\n   p(. Take my hand on this unending path\n   And escape with me from all this wrath\nO, this world,\n   p(. I can no longer bare at all to take.\n\nO, behold!\n   p(. Thy many wonders, grand world!\n   In a many short days, they were unfurled,\nO, respect!\n   p(. Let me walk your green miles forever,\n   Let me see your unending beauty,\n   Brother, sister, let us sow our seeds in this Earth,\n   So that this beauty the future can see.\n\n	2008-12-03 21:24:50.810655
15	9	2008-12-03 21:25:34.504008	Behold!	O, behold!\n   p(. Go down, go down to the riverbed, .)\n   Find your lord, find your head,\nO, be wary!\n   p(. Open your eyes and flee this land\n   Away from oppression's hand,\nO, my brother,\n   p(. Walk with me as I walk with the light\n   And we can escape on into the night\nO, my sister,\n   p(. Take my hand on this unending path\n   And escape with me from all this wrath\nO, this world,\n   p(. I can no longer bare at all to take.\n\nO, behold!\n   p(. Thy many wonders, grand world!\n   In a many short days, they were unfurled,\nO, respect!\n   p(. Let me walk your green miles forever,\n   Let me see your unending beauty,\n   Brother, sister, let us sow our seeds in this Earth,\n   So that this beauty the future can see.\n\n	2008-12-03 21:25:34.504008
16	13	2008-12-03 21:42:50.033797	Wishful Thinking	The vision that my eyes so lust after\r\na creature, a being, a wondrous thing\r\nI feel so undeserving and puny;\r\n\r\nWhen I do close my eyes, what do I see?\r\nA pain-ridden, fallen angel crying,\r\nAnd all I want is to offer my help;\r\n\r\nBut then I open my eyes, and she's gone,\r\nIn my dreams, she comes, sits, and smiles with me,\r\nWith the beauty and purity of a fawn,\r\nIt's with this dear jewel I wish to be,\r\nA being like none other before her,\r\nIs this feeling just lust, or is it love?\r\nEither way, she's a git from above;\r\n\r\nAnd when I look to her face and see her tears,\r\nAll I wish to do is wipe them away,\r\nBe the comfort from all of her dark fears,\r\nAnd let her know that I am here to stay;\r\n\r\nDark skinned containers of knowledge express,\r\nThat which mere words could never do alone,\r\nLike a tome detailing all of my love,\r\nDedicated only to her, the best,\r\nThe one I wish to call only my own,\r\nSimply precious and pure, as though a dove;\r\n\r\nAnd when I look at myself, I feel naught,\r\nAs I were so wholly undeserving,\r\nOf such an angelic creature;\r\n\r\nIf only the world would work differently...\r\nMaybe in that case, it truly could be,\r\nA time in which it could be her and me...\r\nWith time, perhaps such a thing will be seen.\r\n\r\n	2008-12-03 21:42:50.033797
17	20	2008-12-04 04:49:10.146506	Answering Machine	*BEEP*\r\n\r\nAbsolve me\r\nforgive me\r\nteach me\r\nreach me\r\nlead me\r\nneed me\r\nleave me.\r\n\r\n_Structure._\r\n\r\nTell me\r\nhelp me\r\nfell me\r\nsell me.\r\n\r\n_Give me more._\r\n\r\nStomp down the road.\r\nStomp d-\r\n*STOP*\r\nRecorded beyond retraction.\r\n\r\nClick. Pick up.\r\nDial.\r\nRing. Ring. Ring.\r\n\r\n*BEEP*\r\n\r\nStomp down the road.\r\nKnock on my front door.	2008-12-04 04:49:10.146506
18	20	2008-12-04 05:00:22.373735	Answering Machine	*BEEP*\n\nAbsolve me\nforgive me\nteach me\nreach me\nlead me\nneed me\nleave me.\n\n_Structure._\n\nTell me\nhelp me\nfell me\nsell me.\n\n_Give me more._\n\nStomp down the road.\nStomp d-\n\n*STOP*\n\nRecorded.\n\nClick. Pick up.\nDial.\nLet it ring.\n\n*BEEP*\n\nStomp down the road.\nKnock on my front door.	2008-12-04 05:00:22.373735
19	22	2008-12-04 15:51:37.29855	My World	I am (Gary Warman)\r\nA name is all it is;\r\nReality is defined by my hand,\r\nto the extent which I\r\nallow;\r\n\r\nI am (a poet)\r\nI used words to\r\nEnlighten me,\r\nEnlighten you.\r\n\r\nI am.\r\n\r\nI am green, blue, red,\r\nmany colors;\r\nI am alive, breathing, *dead*\r\nmany different states;\r\nI am here,\r\nand only here.	2008-12-04 15:51:37.29855
20	7	2008-12-06 06:34:27.51209	Gen Y	The sunrise outside my apartment window\r\nNewly-fallen leaves litter the sidewalk\r\n\r\nCan't find my digital camera\r\nProbably upstairs in the bedroom\r\nGotta buy another\r\nCan't miss a scene like this\r\nFriends and comments I'll never get\r\n\r\nChatting with you turns me on\r\nI hope you're not a bot\r\nI hope you're a girl\r\nIt's just... you don't have a search trail\r\nYour punctuation so fresh\r\nYour network so daunting\r\n\r\nI sent you an email\r\nI can feel Carnivore breathing	2008-12-06 06:34:27.51209
21	6	2008-12-06 06:35:13.054277	Black Friday	Black Friday has come and gone. I am\r\nalone in Shepherstown, lugging my\r\nlaptop, a few books, my cell phone\r\nand a few uncommitted lines still\r\nforming in my head.\r\n\r\nThe temperature is below freezing,\r\nbut the sunlight is so good.  Warm on\r\nmy charcoal coat, sitting on a bench\r\nat the Wall, shortly before the\r\nbell rings out noon.  The sunlight\r\nis so good.\r\n\r\nI contribute to the nation's economy\r\nby buying an ice cream at the grocery\r\nstore.  Non-essential consumer\r\nspending.  The mint and chocolate\r\nchips fail to taste like freedom.\r\n\r\nBlack Friday has come and gone.  Retail\r\nnumbers will be God until Christmas.\r\nThen we switch our worship to the\r\npurchases themselves, undressing them\r\nwith a passion that mocks the\r\nSong of Solomon.	2008-12-06 06:35:13.054277
22	6	2008-12-06 06:35:41.516125	Black Friday	Black Friday has come and gone. I am\nalone in Shepherstown, lugging my\nlaptop, a few books, my cell phone\nand a few uncommitted lines.\n\nThe temperature is below freezing,\nbut the sunlight is so good.  Warm on\nmy charcoal coat, sitting on a bench\nat the Wall, shortly before the\nbell rings out noon.  The sunlight\nis so good.\n\nI contribute to the nation's economy\nby buying an ice cream at the grocery\nstore.  Non-essential consumer\nspending.  The mint and chocolate\nchips fail to taste like freedom.\n\nBlack Friday has come and gone.  Retail\nnumbers will be God until Christmas.\nThen we switch our worship to the\npurchases themselves, undressing them\nwith a passion that mocks the\nSong of Solomon.	2008-12-06 06:35:41.516125
23	6	2008-12-06 14:59:08.584982	Black Friday	Black Friday has come and gone. I am\nalone in Shepherstown, lugging my\nlaptop, a few books, my cell phone\nand a few uncommitted lines.\n\nThe temperature is below freezing,\nbut the sunlight is so good.  Warm on\nmy charcoal coat, sitting on a bench\nat the Wall, shortly before the\nbell rings out noon.  The sunlight\nis so good.\n\nI contribute to the nation's economy\nby buying an ice cream at the grocery\nstore.  Non-essential consumer\nspending.  The mint and chocolate\nchips fail to taste like freedom.\n\nBlack Friday has come and gone.  Retail\nnumbers will be God until Christmas.\nThen we switch our worship to the\npurchases themselves, undressing them\nwith a fragment of the passion of the\nSong of Solomon.	2008-12-06 14:59:08.584982
24	6	2008-12-06 16:12:06.846535	Black Friday	Black Friday has come and gone. I am\nalone in Shepherstown, lugging my\nlaptop, a few books, my cell phone\nand a few uncommitted lines.\n\nThe temperature is below freezing,\nbut the sunlight is so good.  Warm on\nmy charcoal coat, sitting on a bench\nat the Wall, shortly before the\nbell rings out noon.  The sunlight\nis so good.\n\nBlack Friday has come and gone.  We'll\nfocus on retail performance until\nChristmas. Then we'll focus on the\nretail items themselves, ripping\nin to wrapping paper, the paper-\nshredding sound of gross domestic\nproduct accompanied by squeals\nof childish delight.	2008-12-06 16:12:06.846535
25	8	2008-12-06 16:22:49.318042	Predictive Text	Where the new\r\ngeneration of poets,\r\ntexting lines back and\r\nforth?\r\n\r\nThumbing on their cells.\r\nWriting while they\r\nexperience, no need to\r\nsit down or even stop\r\nmoving.\r\n\r\nPredictive text is only\r\ntrue one word at a time.\r\n	2008-12-06 16:22:49.318042
26	8	2008-12-08 08:38:33.561433	Predictive Text	I'm looking for the new\ngeneration of poets,\ntexting lines back and\nforth.\n\nThumbing on their cells.\nWriting while move\naround, no need to\nsit down or even stop\nmoving.	2008-12-08 08:38:33.561433
27	9	2008-12-08 19:09:11.855516	Behold!	O, behold!\n   Go down, go down to the riverbed,\n   Find your lord, find your head,\nO, be wary!\n   Open your eyes and flee this land\n   Away from oppression's hand,\nO, my brother,\n   Walk with me as I walk with the light\n   And we can escape on into the night\nO, my sister,\n   Take my hand on this unending path\n   And escape with me from all this wrath\nO, this world,\n   I find harder and harder to bare!\n\nO, behold!\n   Thy many wonders, grand world!\n   In a many short days, they were unfurled,\nO, respect!\n   Let me walk your green miles forever,\n   Let me see your unending beauty,\n   Brother, sister, let us sow our seeds in this Earth,\n   So that this beauty the future can see.\n\n	2008-12-08 19:09:11.855516
28	25	2008-12-09 06:16:52.956608	Summer, 2001	Remember when she flooded the kitchen, trying to wash\r\nher muddy jeans in the dishwasher?\r\n\r\nA quarter bought a whole block of fresh\r\ntofu out of the water-filled baskets.\r\n\r\nDan ate bananas covered in chocolate\r\nsauce on the couch.\r\n\r\nWe found seven lush, potted plants in the shower\r\nin an empty dorm room.\r\n\r\nDean found a D-Cell battery in\r\nthe desk of another.\r\n\r\nThe price on kiwi was good.\r\nI had a mattress on the floor.\r\nI started writing again.	2008-12-09 06:16:52.956608
29	25	2008-12-09 06:17:15.103433	Summer, 2001	Remember when she flooded the kitchen, trying to wash\nher muddy jeans in the dishwasher?\n\nA quarter bought a whole block of fresh\ntofu out of the ice cold buckets.\n\nDan ate bananas covered in chocolate\nsauce on the couch.\n\nWe found seven lush, potted plants in the shower\nin an empty dorm room.\n\nDean found a D-Cell battery in\nthe desk of another.\n\nThe price on kiwi was good.\nI had a mattress on the floor.\n\nI started writing again.	2008-12-09 06:17:15.103433
30	25	2008-12-09 06:17:24.535345	Summer, 2001	Remember when she flooded the kitchen, trying to wash\np(. her muddy jeans in the dishwasher?\n\nA quarter bought a whole block of fresh\ntofu out of the ice cold buckets.\n\nDan ate bananas covered in chocolate\nsauce on the couch.\n\nWe found seven lush, potted plants in the shower\nin an empty dorm room.\n\nDean found a D-Cell battery in\nthe desk of another.\n\nThe price on kiwi was good.\nI had a mattress on the floor.\n\nI started writing again.	2008-12-09 06:17:24.535345
31	25	2008-12-09 12:00:48.997216	Summer, 2001	Remember when she flooded the kitchen, trying to wash\nher muddy jeans in the dishwasher?\n\nA quarter bought a whole block of fresh\ntofu out of the ice cold buckets.\n\nDan ate bananas covered in chocolate\nsauce on the couch.\n\nWe found seven lush, potted plants in the shower\nin an empty dorm room.\n\nDean found a D-Cell battery in\nthe desk of another.\n\nThe price on kiwi was good.\nI had a mattress on the floor.\n\nI started writing again.	2008-12-09 12:00:48.997216
32	25	2008-12-09 18:02:28.811882	Summer, 2001	Remember when she flooded the kitchen, trying to wash\nher muddy jeans in the dishwasher?\n\nA quarter bought a whole block of fresh\ntofu out of the ice cold buckets.\n\nDan ate bananas covered in chocolate\nsauce on the couch.\n\nWe found seven lush, potted plants in the shower\nin an empty dorm room.\n\nDean found a D-Cell battery in\nthe desk of another.\n\nThe price on kiwi was good.\nI had a mattress on the floor.\nI bought those sneakers.	2008-12-09 18:02:28.811882
33	25	2008-12-15 05:39:49.453456	Summer, 2001	Remember when she flooded the kitchen, trying to wash\nher muddy jeans in the dishwasher?\n\nA quarter bought a whole block of fresh\ntofu out of the ice cold buckets.\n\nDan ate bananas covered in chocolate\nsauce on the couch.\n\nWe found seven lush, potted plants in the shower\nin an empty dorm room.\n\nDean found a D-Cell battery in\nthe desk of another.\n\nThe price on kiwi was good.\nI had a mattress on the floor.\nYou were having a son.	2008-12-15 05:39:49.453456
34	24	2008-12-15 12:43:26.02178	Untitled	We're on a road trip to the grocery store.\r\nWe stopped at the grocery store 5 minutes\r\nfrom our house to get gas to drive an hour\r\nto the eco-friendly grocery store near the\r\nbeltway.\r\n\r\nThe sun behind the cumulus clouds makes the\r\nedges radiant white, the middle parts\r\ndarker, like slowly fire-roasted marshmallows.\r\n\r\nHalf of the apples are on the trees and half\r\nare on the ground as we pass the USDA fruit\r\nresearch lab and on past the bank parking lot\r\nwhere the Jeep burned up on Monday.\r\n\r\nOrange and white traffic barrels line the\r\non-ramp to Route 9.  The colors alternate\r\nin bands like orange creme popsicles.\r\n\r\nOne day, everything here might be underwater.\r\nExcept for the marshmallows.	2008-12-15 12:43:26.02178
35	32	2008-12-18 19:38:40.550601	Second Poem from Bangalore	The motorcycle gangs are pudgy women in\r\nsaris, helmet optional, not a spike,\r\nchain or tattoo in sight.  Some of them\r\ncarry their babies as they jerk\r\nthrough the endless traffic.\r\n\r\nThe kid with the useless legs (they look\r\nlike dead swans), scoots down Commercial street.\r\nHe's one year older than last year.\r\n\r\nDanger is watching the clouds even for\r\na minute and taking your eye off the simple\r\ntask of putting one foot in front of\r\nthe other.\r\n\r\nOf the three of us, one\r\noverdosed on Ambien, one bought\r\ntwelve pairs of shoes and\r\none walked by a dead man lying\r\non the sidewalk at M.G. Road.	2008-12-18 19:38:40.550601
36	32	2008-12-18 19:44:04.985517	Second Poem from Bangalore	The motorcycle gangs are pudgy women in\nsaris, helmet optional, not a spike,\nchain or tattoo in sight.  Some of them\ncarry their babies as they jerk\nthrough the endless traffic.\n\nThe kid with the useless legs (they look\nlike dead swans), crab-walks down Commercial\nstreet in the same spot that I saw him last\nyear when the rain wasn't here.\n\n(Don't watch the clouds.  Watch the crowds.  Put\none foot in front of the other.  The curry stands\nsmell like heaven.  Focus, and hold your bags.)\n\nOf the three of us, one\noverdosed on Ambien, one bought\ntwelve pairs of shoes and\none walked by a dead man lying\non the sidewalk at M.G. Road.	2008-12-18 19:44:04.985517
37	36	2008-12-25 21:43:32.801411	Fallen From Grace	(Act I - Introduction)\r\n\r\nThey call me the opium's death,\r\na man far past his prime,\r\nwandering the plains of this Earth,\r\ncondemned for no man's crime;\r\n\r\nThey call me Saul the decrepit,\r\nA human, not the best,\r\nI roam these lands, telling my tales,\r\nUntil my soul doth rest;\r\n\r\nNow my story, 'tis an old one,\r\nIt began long ago,\r\nIn the dusty state of Texas,\r\nWhere my soul once did glow;\r\n\r\nThe devil came 'pon me one day,\r\nhis pitchfork in his hand,\r\nA contract of beauty and lust,\r\namongst the shifting sand,\r\n\r\nA picturesque background of death,\r\nPortrayal of the end,\r\nI shook the devil's hand, the grip burned,\r\nAnd agreed to my sin;\r\n\r\nThe soul was ripped from my body,\r\nThe devil walked away,\r\nHis footprints fading to nothing,\r\nin fading light of day;\r\n\r\nI wandered up to an oil rig,\r\nmy body tired and weak.\r\nThe pearl of my body now gone,\r\ngreed and lust I doth seek;\r\n\r\nOh, to be a human again,\r\nmy identity's gone,\r\nI wander these lands nowadays,\r\nThe devil's weakest pawn;\r\n\r\nThey call me Saul the decrepit,\r\nA human, not the best,\r\nI roam these lands, telling my tales,\r\nUntil my soul doth rest;\r\n\r\nThe devil dances inside me,\r\nhis pitchfork in my skin,\r\nDragging me further down to hell,\r\nThis world was my one sin;\r\n\r\nAnd I will never see heaven,\r\nNo sign of the above,\r\nno land where I set myself free,\r\nA sparrow, not a dove;\r\n\r\nThey call me imperfect and gone,\r\nBut I won't take it back;\r\nI wander these plains, day to day,\r\nWith naught but a rucksack;	2008-12-25 21:43:32.801411
38	36	2008-12-25 23:11:42.617892	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nAapicturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far to slowly,\nand my shot met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...	2008-12-25 23:11:42.617892
39	36	2008-12-26 23:23:12.38855	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nA picturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far to slowly,\nand my shot met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...	2008-12-26 23:23:12.38855
40	36	2008-12-26 23:31:52.664009	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nA picturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far to slowly,\nand my lead met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act III - The Ride To Hell)\n\nFalling far away from my grace,\nhis hat did meet the floor,\nas did also his body fall,\nhis soul beckoned for more,\n\nand the shot was heard for miles 'round,\nas clear as the church bell,\ni shot that man, right in the head,\nand now I'm go'n to Hell,\n\nbut even so, 'twas dest'ny before,\nmy hand was on the gun,\nhis blood lies now all ov'r the wall,\nit's sad when one's time comes.\n\nRegaining all my composure,\nI arose from the ground,\nmy six-shooter back in holster,\nI quickly flee to town,\n\nthe sheriffs chasing after me,\nI bound as fast I could,\nI ran all day, and ran all night,\n	2008-12-26 23:31:52.664009
41	36	2008-12-28 23:35:51.405889	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nA picturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far to slowly,\nand my lead met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act III - The Ride To Hell)\n\nFalling far away from my grace,\nhis hat did meet the floor,\nas did also his body fall,\nhis soul beckoned for more,\n\nand the shot was heard for miles 'round,\nas clear as the church bell,\ni shot that man, right in the head,\nand now I'm go'n to Hell,\n\nbut even so, 'twas dest'ny before,\nmy hand was on the gun,\nhis blood lies now all ov'r the wall,\nit's sad when one's time comes.\n\nRegaining all my composure,\nI arose from the ground,\nmy six-shooter back in holster,\nI quickly flee to town,\n\nthe sheriffs chasing after me,\nI bound as fast I could,\nI ran all day, and ran all night,\nmy legs proving their good,\n\na testament to my harsh ways,\nthe sky beamed down on me,\nand I saw his face in heaven,\nbut yet he looked at peace;\n\nI cried to the pool of stars,\n"I'm sorry for what's done,\nthe devil lies now within me,\nI did not fire that gun,\n\nI beg only your forgiveness,\nplease understand my pain,\nyou have found some form of true peace,\nand I stuck here, with pain,\n\nbeg you for your understanding,\nthat's all I wish from you,\nwhat's done is ev'dently done,\nand now I seek but truth..."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe face in heaven gazed at me,\nwearing not a disguise,\nand I could see his decision,\nin his passionate eyes:\n\n"I can not absolve you at all,\nthat's not my job to do,\nbut, there is one favour granted,\nI can yet forgive you;\n\nI see the devil in your skin,\nand I do know your pain,\nfor he once rode me at all times,\n'twas much to my disdain,\n\nbut yes, I do now forgive you,\nif you can one thing:\nget the devil off of your back,\nhes not at all your king."\n\nLooking to the sky, I asked this:\n"But how can I such?\nI promise the devil my soul,\nhe is my helping crutch..."\n\n"My friend, the answer approaches,\njust don't deny it then,\nyou will soon find your one solvent,\nand your pain will then end."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...	2008-12-28 23:35:51.405889
42	36	2008-12-28 23:35:57.648354	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nA picturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far to slowly,\nand my lead met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act III - The Ride To Hell)\n\nFalling far away from my grace,\nhis hat did meet the floor,\nas did also his body fall,\nhis soul beckoned for more,\n\nand the shot was heard for miles 'round,\nas clear as the church bell,\ni shot that man, right in the head,\nand now I'm go'n to Hell,\n\nbut even so, 'twas dest'ny before,\nmy hand was on the gun,\nhis blood lies now all ov'r the wall,\nit's sad when one's time comes.\n\nRegaining all my composure,\nI arose from the ground,\nmy six-shooter back in holster,\nI quickly flee to town,\n\nthe sheriffs chasing after me,\nI bound as fast I could,\nI ran all day, and ran all night,\nmy legs proving their good,\n\na testament to my harsh ways,\nthe sky beamed down on me,\nand I saw his face in heaven,\nbut yet he looked at peace;\n\nI cried to the pool of stars,\n"I'm sorry for what's done,\nthe devil lies now within me,\nI did not fire that gun,\n\nI beg only your forgiveness,\nplease understand my pain,\nyou have found some form of true peace,\nand I stuck here, with pain,\n\nbeg you for your understanding,\nthat's all I wish from you,\nwhat's done is ev'dently done,\nand now I seek but truth..."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe face in heaven gazed at me,\nwearing not a disguise,\nand I could see his decision,\nin his passionate eyes:\n\n"I can not absolve you at all,\nthat's not my job to do,\nbut, there is one favour granted,\nI can yet forgive you;\n\nI see the devil in your skin,\nand I do know your pain,\nfor he once rode me at all times,\n'twas much to my disdain,\n\nbut yes, I do now forgive you,\nif you can one thing:\nget the devil off of your back,\nhes not at all your king."\n\nLooking to the sky, I asked this:\n"But how can I such?\nI promise the devil my soul,\nhe is my helping crutch..."\n\n"My friend, the answer approaches,\njust don't deny it then,\nyou will soon find your one solvent,\nand your pain will then end."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act IV - Soliloquy the First [Minor])\n\nI look to the skies, and I see stories,\nof people, of cultures past, now set free,\nI see a world of confusion and pain,\nwith a fool like myself caught in the game...\n\nI don't know why I sold my soul to him,\nbut something spoke to me from deep within,\nI shook his hand and he took my one soul,\nhe shoved me down, left me in hellfire's hole...\n\nI'm dancing on the line of real'ty,\nWishing for a day when I could be free,\nLucifer's laugh lies lurking in my mind,\nTorment knowing no form of stopping time,\n\nbut I chose this path of life, 'twasn't forced,\nso I now must continue with remorse,\nThere is much of my story left to tell,\nof my gradual descent into Hell.\n\n	2008-12-28 23:35:57.648354
43	36	2008-12-31 02:53:57.602623	Fallen From Grace	(Act I - Introduction)\n\nThey call me the opium's death,\na man far past his prime,\nwandering the plains of this Earth,\ncondemned for no man's crime;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nNow my story, 'tis an old one,\nit began long ago,\nin the dusty state of Texas,\nwhere my soul once did glow.\n\nThe devil came 'pon me one day,\nhis pitchfork in his hand,\na contract of beauty and lust,\namongst the shifting sand,\n\nA picturesque background of death,\nportrayal of the end,\nI shook the devil's hand, the grip burned,\nand agreed to my sin;\n\nthe soul was ripped from my body,\nthe devil walked away,\nhis footprints fading to nothing,\nin fading light of day;\n\nI wandered up to an oil rig,\nmy body tired and weak.\nThe pearl of my body now gone,\ngreed and lust I did seek;\n\noh, to be a human again,\nmy identity's gone,\nI wander these lands nowadays,\nthe devil's weakest pawn.\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe devil dances inside me,\nhis pitchfork in my skin,\ndragging me further down to Hell,\nthis world was my one sin;\n\nand I will never see heaven,\nno sign of the above,\nno land where I set myself free,\na sparrow, not a dove;\n\nthey call me imperfect and gone,\nbut I won't take it back;\nI wander these plains, day to day,\nwith naught but a rucksack.\n\n(Act II - Exposition)\n\nNow I will tell of my flawed ways,\nof my opiate sin,\nof my days wandering this Earth,\nand all my thoughts within.\n\nI woke up that one faithful day,\na headache tearing me,\na whiskey bottle on the floor,\nit must have set me free,\n\nfor I awoke, a nod to pain,\na knife wound on my arm,\ncongealed blood ran throughout my clothes,\na sign of utter harm,\n\nand in my mind, distorted thoughts,\nan image of the wind,\nstumbling right on out of my bed,\nI let my day begin...\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nStumbling about in light of day,\nit was a form of art,\nthe way I insulted my soul,\nas I played my old part,\n\nthe townsfolk cast remorseful eyes,\nfeeling sorrow for my sins,\nbut to each of them, I say nay,\nthey're but means to an end.\n\nI wandered to the local shop,\nmy breath reeking of gin\nand whiskey; shopkeep looked at me,\nwith eyes say'ng "not again..."\n\nI fumbled then for my wallet,\nlooking at the shopkeep,\n"I jes' want some chew'n tobac'er,\n'tis my burden to reap."\n\nThe shopkeep found the tobacco,\nand handed me it then,\nbut my wallet could not be found,\njust a six-shot; my kin.\n\nI looked towards the shopkeeper,\ndeath's glint was in my eye,\nand at that instant, he then knew,\nthat something went awry;\n\nHe reached down beneath the counter,\na rifle pulled forth he,\nhe aimed it right towards my face,\nintent on "nothing free."\n\nAt that moment I fell groundward,\npulling my gun to hand,\nhe reacted far to slowly,\nand my lead met his head;\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act III - The Ride To Hell)\n\nFalling far away from my grace,\nhis hat did meet the floor,\nas did also his body fall,\nhis soul beckoned for more,\n\nand the shot was heard for miles 'round,\nas clear as the church bell,\ni shot that man, right in the head,\nand now I'm go'n to Hell,\n\nbut even so, 'twas dest'ny before,\nmy hand was on the gun,\nhis blood lies now all ov'r the wall,\nit's sad when one's time comes.\n\nRegaining all my composure,\nI arose from the ground,\nmy six-shooter back in holster,\nI quickly flee to town,\n\nthe sheriffs chasing after me,\nI bound as fast I could,\nI ran all day, and ran all night,\nmy legs proving their good,\n\na testament to my harsh ways,\nthe sky beamed down on me,\nand I saw his face in heaven,\nbut yet he looked at peace;\n\nI cried to the pool of stars,\n"I'm sorry for what's done,\nthe devil lies now within me,\nI did not fire that gun,\n\nI beg only your forgiveness,\nplease understand my pain,\nyou have found some form of true peace,\nand I stuck here, with pain,\n\nbeg you for your understanding,\nthat's all I wish from you,\nwhat's done is ev'dently done,\nand now I seek but truth..."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest.\n\nThe face in heaven gazed at me,\nwearing not a disguise,\nand I could see his decision,\nin his passionate eyes:\n\n"I can not absolve you at all,\nthat's not my job to do,\nbut, there is one favour granted,\nI can yet forgive you;\n\nI see the devil in your skin,\nand I do know your pain,\nfor he once rode me at all times,\n'twas much to my disdain,\n\nbut yes, I do now forgive you,\nif you can one thing:\nget the devil off of your back,\nhes not at all your king."\n\nLooking to the sky, I asked this:\n"But how can I such?\nI promise the devil my soul,\nhe is my helping crutch..."\n\n"My friend, the answer approaches,\njust don't deny it then,\nyou will soon find your one solvent,\nand your pain will then end."\n\nThey call me Saul the decrepit,\na human, not the best,\nI roam these lands, telling my tales,\nuntil my soul doth rest...\n\n(Act IV - Soliloquy the First [Minor])\n\nI look to the skies, and I see stories,\nof people, of cultures past, now set free,\nI see a world of confusion and pain,\nwith a fool like myself caught in the game...\n\nI don't know why I sold my soul to him,\nbut something spoke to me from deep within,\nI shook his hand and he took my one soul,\nhe shoved me down, left me in hellfire's hole...\n\nI'm dancing on the line of real'ty,\nWishing for a day when I could be free,\nLucifer's laugh lies lurking in my mind,\nTorment knowing no form of stopping time,\n\nbut I chose this path of life, 'twasn't forced,\nso I now must continue with remorse,\nThere is much of my story left to tell,\nof my gradual descent into Hell.\n\n	2008-12-31 02:53:57.602623
44	32	2009-01-02 06:47:02.036893	Second Poem from Bangalore	The motorcycle gangs are pudgy women in\nsaris, helmet optional, not a spike,\nchain or tattoo in sight.  Some\ncarry their babies in one arm over\nthe side of the bike as they trike\nthrough the mess in the street.\n\nThe kid with the useless legs (they look\nlike dead swans), crab-walks down Commercial\nstreet in the same spot that I saw him last\nyear when the rain wasn't here.\n\n(Don't watch the clouds.  Watch the crowds.  Put\none foot in front of the other.  The curry stand\nsmells so good.  Clutch your bags.)\n\nOf the three of us, one\noverdosed on Ambien, one\nbought bracelets and one\nwalked by a dead man lying\non the sidewalk at M.G. Road.	2009-01-02 06:47:02.036893
45	30	2009-01-03 07:24:45.760648	The Wind is Taken into Consideration	The sun is bright outside my office window,\r\nreflecting off of the snow huddled around the\r\noutside edges of the sparsely populated\r\nparking lot between my office and the\r\noff-white house-ocean with yards barely\r\nwide enough to fit a mower between the\r\nfence and the porch.\r\n\r\nJapanese girls are asleep right now, resting\r\ntheir bloody thumbs from furiously drafting\r\ncell phone novels about angst, passion, clothes\r\nand infectious disease on the long ride from\r\nsomewhere to elsewhere on another train in\r\na long line of trains into tunnels in the dark.\r\n\r\nThere are far too many songs about sex in\r\nbedrooms and far too few about the woods and\r\nthe pool at the bottom of the waterfall where\r\nyou might interrupt a monk with his beads,\r\nworking them through his hands as the falling\r\nwater pushes down on his shoulders leaving\r\nthumb prints, without blood and cool but\r\nnot as cold as the window pane and the\r\nplastic hanging blinds next to my desk.	2009-01-03 07:24:45.760648
46	38	2009-01-04 08:21:11.484827	The Preamble	I'm going to start off this poem with an introduction.\r\nI'll explain when I wrote the poem and why and\r\ntell you about the significance the poem has for me.\r\nA few of the literary devices might be too obtuse,\r\nso I will explain them up front.\r\n\r\nIn no way will I ever consider editing this poem.\r\nAfter all, what is poetry if not the spur of the\r\nmoment dribble of the mind, which can be assumed\r\nto be in perfect and final form--against which\r\nany modification is punishable by an increased\r\nlikelihood of publication and exterior comprehension.\r\n\r\nYou may be tempted to drift off while I read,\r\ngiven the abstractness and vagueness of the images\r\nI employ.  I use this technique to avoid sounding\r\nlike I am talking about myself and my last girlfriend,\r\neven though I clearly am.  This preamble is\r\nimportant to get the point across, since you occupy\r\nyour mind during the poem thinking about your\r\nglass of wine, plate of food, cup of tea or whether\r\nthere is anyone in the restroom at the moment.\r\n\r\nAt this point, you are almost sure I'm done\r\nwith the preamble and you are torn between both\r\na desire to hear me continue, since the poem at\r\nthis point can be nothing but horribly anti-climactic\r\nand the equal desire to hear the damn poem and\r\njudge it on its own merit.  All of which is to say\r\nthat this preamble was pointless, except to\r\nwaste your time, which is valued at anything from $6.75\r\nto over $50 an hour, meaning that instead of my\r\nostensible goal of describing the fleeting complexity\r\nand gravity of seemingly everyday moments of life,\r\nI have instead reminded you of work.	2009-01-04 08:21:11.484827
47	38	2009-01-04 08:21:19.247519	The Preamble	I'm going to start off this poem with an introduction.\nI'll explain when I wrote the poem and why and\ntell you about the significance the poem has for me.\nA few of the literary devices might be too obtuse,\nso I will explain them up front.\n\nIn no way will I ever consider editing this poem.\nAfter all, what is poetry if not the spur of the\nmoment dribble of the mind, which can be assumed\nto be in perfect and final form--against which\nany modification is punishable by an increased\nlikelihood of publication and third-party\nappreciation.\n\nYou may be tempted to drift off while I read,\ngiven the abstractness and vagueness of the images\nI employ.  I use this technique to avoid sounding\nlike I am talking about myself and my last girlfriend,\neven though I clearly am.  This preamble is\nimportant to get the point across, since you occupy\nyour mind during the poem thinking about your\nglass of wine, plate of food, cup of tea or whether\nthere is anyone in the restroom at the moment.\n\nAt this point, you are almost sure I'm done\nwith the preamble and you are torn between both\na desire to hear me continue, since the poem at\nthis point can be nothing but horribly anti-climactic\nand the equal desire to hear the damn poem and\njudge it on its own merit.  All of which is to say\nthat this preamble was pointless, except to\nwaste your time, which is valued at anything from $6.75\nto over $50 an hour, meaning that instead of my\nostensible goal of describing the fleeting complexity\nand gravity of seemingly everyday moments of life,\nI have instead reminded you of work.	2009-01-04 08:21:19.247519
48	39	2009-01-04 19:43:56.858917	The Preamble (no trans-paragraph line breaks mix)	I'm going to start off this poem with an introduction. I'll explain when I wrote the poem and why and tell you about the significance the poem has for me. A few of the literary devices might be too obtuse, so I will explain them up front. In no way will I ever consider editing this poem. After all, what is poetry if not the spur of the moment dribble of the mind, which can be assumed to be in perfect and final form--against which any modification is punishable by an increased likelihood of publication and third-party appreciation. You may be tempted to drift off while I read, given the abstractness and vagueness of the images I employ.  I use this technique to avoid sounding\r\nlike I am talking about myself and my last girlfriend, even though I clearly am.  This preamble is\r\nimportant to get the point across, since you occupy your mind during the poem thinking about your\r\nglass of wine, plate of food, cup of tea or whether there is anyone in the restroom at the moment.\r\nAt this point, you are almost sure I'm done with the preamble and you are torn between both\r\na desire to hear me continue, since the poem at this point can be nothing but horribly anti-climactic\r\nand the equal desire to hear the damn poem and judge it on its own merit.  All of which is to say\r\nthat this preamble was pointless, except to waste your time, which is valued at anything from $6.75\r\nto over $50 an hour, meaning that instead of my ostensible goal of describing the fleeting complexity\r\nand gravity of seemingly everyday moments of life, I have instead reminded you of work.	2009-01-04 19:43:56.858917
49	39	2009-01-04 19:45:20.048894	The Preamble (no trans-paragraph line breaks mix)	I'm going to start off this poem with an introduction. I'll explain when I wrote the poem and why and tell you about the significance the poem has for me. A few of the literary devices might be too obtuse, so I will explain them up front. \n\nIn no way will I ever consider editing this poem. After all, what is poetry if not the spur of the moment dribble of the mind, which can be assumed to be in perfect and final form--against which any modification is punishable by an increased likelihood of publication and third-party appreciation. \n\nYou may be tempted to drift off while I read, given the abstractness and vagueness of the images I employ.  I use this technique to avoid sounding like I am talking about myself and my last girlfriend, even though I clearly am.  This preamble is important to get the point across, since you occupy your mind during the poem thinking about your glass of wine, plate of food, cup of tea or whether there is anyone in the restroom at the moment.\n\nAt this point, you are almost sure I'm done with the preamble and you are torn between both\na desire to hear me continue, since the poem at this point can be nothing but horribly anti-climactic\nand the equal desire to hear the damn poem and judge it on its own merit.  All of which is to say\nthat this preamble was pointless, except to waste your time, which is valued at anything from $6.75\nto over $50 an hour, meaning that instead of my ostensible goal of describing the fleeting complexity\nand gravity of seemingly everyday moments of life, I have instead reminded you of work.	2009-01-04 19:45:20.048894
50	42	2009-01-09 05:09:35.059296	Dear you,	Why is it that, no matter how I try,\r\nit comes out to events like these,\r\nalways? Always this madness, \r\nalways I'm crying, on the inside,\r\ndo I deserve to be just the rest?\r\n\r\nBefore school, no less, the tears came,\r\nand I can understand that it had to be said,\r\nbut could it have not waited? My day...\r\nMy life? I don't know. \r\n\r\nLove and need are different, \r\nvery much so, and I understand,\r\nI can definitely take a hint,\r\nand you know what it sounds to me?\r\n\r\nSecrets are being kept always.\r\nDo you have any for me?\r\n\r\nThe wheels of time never stop turning.\r\n\r\nBut they do often slow down.\r\n\r\nThey mystify us and what do they bring?\r\nA horrible wave of unknowing.\r\n\r\nI know what it is to need,\r\nand I know what it is, more than most,\r\nto love;\r\n\r\nI know that you think that the need\r\noutweighs the love in some respect,\r\nbut over this subject, I never jest,\r\nI know for sure that the love is dominant;\r\nneed may be dominant, from time to time,\r\nbut i want you to know that\r\nthat is not this time;\r\nNeed can vary, just as can love,\r\nand in this case, 'tis love been given the shove\r\nto the top; need is not non-existent, but\r\ncomparatively speaking, 'tis small.\r\n\r\nRegularly speaking, 'tis not big,\r\nnot big enough to be dominant.\r\n\r\nWhy does this invariably happen?\r\nIs it your way of saying\r\nyou want someone else?\r\n\r\nIs it your way of saying\r\neverything I did was for naught?\r\n\r\nIs it your way of saying\r\nI'm tired of all of this?\r\n\r\nIs it your way?\r\n\r\nI'm sorry that I do what I do.\r\nThe past is past;\r\nI've changed heavily since,\r\nand I just, honestly, wish\r\nthat you would not use it against me.\r\n\r\nI'm sorry that I try.	2009-01-09 05:09:35.059296
51	43	2009-01-09 15:15:26.213134	Avant	Open what door there is to charge\r\nI forgive the night despite all my spite,\r\nThe spy is observing your every movement,\r\nevery moment.\r\nMomentous occasions, tumultuous situations,\r\nhis entropic touch gripping you, caught you in his clutch,\r\nhis car rolling at the hands of a ghost, an unseen host,\r\nflippant and distant, dismissing of all admission,\r\nit's coming apart in society's mind like nuclear fission\r\nI'm caught sitting alone in remission:\r\na comatose dramatic, traumatic lack in,\r\nI'm back in the back end, maps hack and attack men,\r\nyour GPS can't guide you, nor find true north,\r\nwith your mind coming forth, and up in the mirth\r\ncaught ya right up in the hearth, dip in the drink,\r\nin the surf our turf is expanding back to his attitude,\r\nhis altitude, humanity for hire and we're higher\r\nwe never tire, our souls ablaze with fire, happy liars,\r\nwould you like some guilt with your happy meal?\r\nBreak your heart and fake your part, I and I in thrall\r\nenthralled in your halls, can I get you some fries with that?\r\nSecrets and Jesus are comin' down your path,\r\nObservant muses disappropriate the most humane of hate,\r\neuthanasia is tears and fears bliss for this\r\nIgnorance is, hence, our tense and ever since...\r\nWe woke up.	2009-01-09 15:15:26.213134
52	43	2009-01-17 12:07:17.950829	Avant	Open what door there is to charge\nI forgive the night despite all my spite,\nThe spy is observing your every movement,\nevery moment.\nMomentous occasions, tumultuous situations,\nhis entropic touch gripping you, caught you in his clutch,\nhis car rolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing of all admission,\nit's coming apart in society's mind like nuclear fission\nI'm caught sitting alone in remission:\na comatose dramatic, traumatic lack in,\nI'm back in the black end, maps hack and attack men,\nyour GPS can't guide you, nor find true north,\nwith your mind coming forth, and up in the mirth\ncaught ya right up in the hearth, dip in the drink,\nin the surf our turf is expanding back to his attitude,\nhis altitude, humanity for hire and we're higher\nwe never tire, our souls ablaze with fire, happy liars,\nwould you like some guilt with your happy meal?\nBreak your heart and fake your part, I and I in thrall\nenthralled in your halls, can I get you some fries with that?\nSecrets and Jesus are comin' down your path,\nObservant muses disappropriate the most humane of hate,\neuthanasia is tears and fears bliss for this\nIgnorance is, hence, our tense and ever since...\nWe woke up.	2009-01-17 12:07:17.950829
53	43	2009-01-17 12:07:20.427984	Avant	Open what door there is to charge\nI forgive the night despite all my spite,\nThe spy is observing your every movement,\nevery moment.\nMomentous occasions, tumultuous situations,\nhis entropic touch gripping you, caught you in his clutch,\nhis car rolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing of all admission,\nit's coming apart in society's mind like nuclear fission\nI'm caught sitting alone in remission:\na comatose dramatic, traumatic lack in,\nI'm back in the black end, maps hack and attack men,\nyour GPS can't guide you, nor find true north,\nwith your mind coming forth, and up in the mirth\ncaught ya right up in the hearth, dip in the drink,\nin the surf our turf is expanding back to his attitude,\nhis altitude, humanity for hire and we're higher\nwe never tire, our souls ablaze with fire, happy liars,\nour combined voices and choices are all the sacrificing us to the fall\nBreak your heart and fake your part, I and I in thrall\nenthralled in your halls, is that all of your placid wrath?\nSecrets and Jesus are comin' down your path,\nObservant muses disappropriate the most humane of hate,\neuthanasia is tears and fears bliss for this\nIgnorance is, hence, our tense and ever since...\nWe woke up.	2009-01-17 12:07:20.427984
54	43	2009-01-17 12:07:22.065268	Avant	Open what door there is to charge\nI forgive the night despite all my spite,\nThe spy is observing your every movement,\nevery moment.\nMomentous occasions, tumultuous situations,\nhis entropic touch gripping you, caught you in his clutch,\nhis car rolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing of all admission,\nit's coming apart in society's mind like nuclear fission\nI'm caught sitting alone in remission:\na comatose dramatic, traumatic lack in,\nI'm back in the black end, maps hack and attack men,\nyour GPS can't guide you, nor find true north,\nwith your mind coming forth, and up in the mirth\ncaught ya right up in the hearth, dip in the drink,\nin the surf our turf is expanding back to his attitude,\nhis altitude, humanity for hire and we're higher\nwe never tire, our souls ablaze with fire, happy liars,\nour combined voices and choices are all the sacrificing us to the fall\nBreak your heart and fake your part, I and I in thrall\nenthralled in your halls, is that all of your placid wrath?\nSecrets and Jesus are comin' down your path,\nObservant muses disappropriate the most humane of hate,\neuthanasia is tears and fears bliss for this\nIgnorance is, hence, our tense and ever since...\nWe woke up.	2009-01-17 12:07:22.065268
55	46	2009-01-18 18:22:10.160722	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\r\nI forgive the night despite all my spite\r\nthe spy is observing your every movement\r\nmomentous occasions, edge situations,\r\nentropy gripping you, caught in his clutch,\r\nrolling at the hands of a ghost, an unseen host,\r\nflippant and distant, dismissing all admission\r\nit's coming apart like nuclear fission\r\ncaught sitting alone in remission:\r\na comatose dramatic, traumatic lack in\r\nback in the black end, map hacks and attack men,\r\nGPS can't guide you in, can't find true north\r\nwhere your mind put forth and opened your heart\r\ncaught right from the start, dipped in the drink\r\nin the surf our turf is expanding back in latitude,\r\nhis altitude, people for hire and we're nigh 'cause\r\nwe never tire, ablaze with fire, we're happy liars\r\nbreak your heart and fake your part, me in thrall\r\nenrolled in your halls, playing roles to the walls\r\neuthanasia is tears and fears, bliss for this\r\nignorance is, hence, our tense and ever since\r\nwe woke up, went smoke up, forgotten prince	2009-01-18 18:22:10.160722
56	46	2009-01-18 18:30:21.020721	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nI forgive the night despite all my spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing all admission\nit's coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, ablaze with fire, we're happy liars\nbreak your heart and fake your part, me in thrall\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince	2009-01-18 18:30:21.020721
57	46	2009-01-18 18:35:14.643391	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nI forgive the night despite all my spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing all admission\nit's coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, ablaze with fire, we're happy liars\nbreak your heart and fake your part, me in thrall\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-18 18:35:14.643391
58	46	2009-01-18 18:39:26.588233	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nI forgive the night despite all my spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nit's coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, ablaze with fire, we're happy liars\nbreak your heart and fake your part, me in thrall\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-18 18:39:26.588233
59	46	2009-01-19 05:56:27.545837	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nit's coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, ablaze with fire, we're happy liars\nbreak your heart and fake your part, me in thrall\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 05:56:27.545837
60	46	2009-01-19 06:02:23.99896	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nit's coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, ablaze with fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:02:23.99896
61	46	2009-01-19 06:04:15.062199	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, ablaze with fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:04:15.062199
62	46	2009-01-19 06:07:53.776764	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:07:53.776764
63	46	2009-01-19 06:10:26.834434	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls,\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:10:26.834434
64	46	2009-01-19 06:19:44.821795	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls,\neuthanasia is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:19:44.821795
65	46	2009-01-19 06:20:34.657014	Avant (Brand Recognition Slam Mix)	Open what door there is to charge.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls.\nSearching is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:20:34.657014
66	46	2009-01-19 06:23:09.210326	Avant (Brand Recognition Slam Mix)	Open what door there is to change.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nentropy gripping you, caught in his clutch,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls.\nSearching is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:23:09.210326
67	46	2009-01-19 06:25:16.087036	Avant (Brand Recognition Slam Mix)	Open what door there is to change.\nForgive the night despite all your spite\nthe spy is observing your every movement\nmomentous occasions, edge situations,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls.\nSearching is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 06:25:16.087036
68	43	2009-01-19 06:47:18.175852	Avant	Open what door there is to charge\nI forgive the night despite all my spite,\nThe spy is observing your every movement,\nevery moment.\nMomentous occasions, tumultuous situations,\nhis entropic touch gripping you, caught you in his clutch,\nhis car rolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing of all admission,\nit's coming apart in society's mind like nuclear fission\nI'm caught sitting alone in remission:\na comatose dramatic, traumatic lack in,\nI'm back in the black end, maps hack and attack men,\nyour GPS can't guide you, nor find true north,\nwith your mind coming forth, and up in the mirth\ncaught ya right up in the hearth, dip in the drink,\nin the surf our turf is expanding back to his attitude,\nhis altitude, humanity for hire and we're higher\nwe never tire, our souls ablaze with fire, happy liars,\nour combined voices and choices are all the sacrificing us to the fall\nBreak your heart and fake your part, I and I in thrall\nenthralled in your halls, is that all of your placid wrath?\nSecrets and Jesus are comin' down your path,\nObservant muses disappropriate the most humane of hate,\neuthanasia is tears and fears bliss for this\nIgnorance is, hence, our tense and ever since...\nWe woke up.	2009-01-19 06:47:18.175852
69	46	2009-01-19 07:15:45.67366	Avant (Brand Recognition Slam Mix)	Open what door there is to change.\nForgive the night despite all your spite.\nThe spy is observing your every movement\nmomentous occasions, edge situations,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars\nbreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls.\nSearching is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 07:15:45.67366
70	47	2009-01-19 12:18:28.270871	Late January	Snow falls outside\r\ncats curled on blanket piles\r\nwhite powder rooftops	2009-01-19 12:18:28.270871
71	46	2009-01-19 18:42:17.333528	Avant (Brand Recognition Slam Mix)	Open what door there is to change.\nForgive the night despite all your spite.\nThe spy is observing your every movement\nmomentous occasions, edge situations,\nrolling at the hands of a ghost, an unseen host,\nflippant and distant, dismissing admission\nand coming apart like nuclear fission\ncaught sitting alone in remission:\na comatose dramatic, traumatic lack in\nback in the black end, map hacks and attack men,\nGPS can't guide you in, can't find true north\nwhere your mind put forth and opened your heart,\ncaught right from the start, dipped in the drink,\nwe never tire, lit on fire, we're happy liars.\nBreak your heart and fake your part, me in thrall,\nenrolled in your halls, playing roles to the walls.\nSearching is tears and fears, bliss for this\nignorance is, hence, our tense and ever since\nwe woke up, went smoke up, forgotten prince.	2009-01-19 18:42:17.333528
72	47	2009-01-19 18:52:16.716015	Late January	Snow flakes outside\ncats curled on blanket piles\nwhite powder rooftops	2009-01-19 18:52:16.716015
73	47	2009-01-19 18:58:57.667995	Late January	Snow flakes outside\ncats curled on a blanket pile\nwhite powder rooftops	2009-01-19 18:58:57.667995
74	47	2009-01-19 19:01:46.37064	Late January	Snowflakes outside\ncats curled on a blanket pile\nwhite powder rooftops	2009-01-19 19:01:46.37064
75	47	2009-01-19 19:10:49.570034	Late January	Snowflakes drift down\ncats curled on a blanket pile\nwhite powder rooftops	2009-01-19 19:10:49.570034
76	51	2009-01-20 18:51:48.297742	Obama's Inaugural Address (Poem Remix)	Every so often the oath is taken\r\namidst gathering clouds and raging\r\nstorms, amidst a nagging fear\r\nthat the next generation must\r\nlower its sights.\r\n\r\nBut, the time has come to set aside\r\nchildish things.\r\n\r\nWe must pick ourselves up,\r\ndust ourselves off,\r\nreject as false the choice between\r\nour safety and our ideals.\r\n\r\nWe are shaped by every language\r\nand culture drawn from every\r\nend of this Earth.\r\n\r\nWe will extend a hand\r\nif you are willing to unclench\r\nyour fist.\r\n\r\nKnow that\r\nyour people\r\nwill judge you on what you can build,\r\nnot what you can destroy.\r\n\r\nLet it be told to the future world,\r\nlet it be said by our children's children\r\nthat when we were tested we refused\r\nto let this journey end.	2009-01-20 18:51:48.297742
77	51	2009-01-20 18:53:00.896988	The 44th Inaugural Address (Poem Remix)	Every so often the oath is taken\namidst gathering clouds and raging\nstorms, amidst a nagging fear\nthat the next generation must\nlower its sights.\n\nBut, the time has come to set aside\nchildish things.\n\nWe must pick ourselves up,\ndust ourselves off,\nreject as false the choice between\nour safety and our ideals.\n\nWe are shaped by every language\nand culture drawn from every\nend of this Earth.\n\nWe will extend a hand\nif you are willing to unclench\nyour fist.\n\nKnow that\nyour people\nwill judge you on what you can build,\nnot what you can destroy.\n\nLet it be told to the future world,\nlet it be said by our children's children\nthat when we were tested we refused\nto let this journey end.	2009-01-20 18:53:00.896988
78	54	2009-01-22 16:25:02.994945	Buh-R8 (New Waiver)	I hear that you are one of those new ones.\r\n\r\nWell, I've come here today for an announcement:\r\nPlease put your name on the dotted line\r\nand be sure to turn in the white and pink \r\nonly; the yellow is yours to keep.\r\n\r\nAnd be sure that you sign your signature in pen,\r\npencil leaves marks that are far too thin.\r\n\r\nYes, we expect you to get hurt, and so, to be safe\r\nwe ask you to sign away your life to a piece of paper;\r\nthat's the price of having fun, don't you know?\r\nIt's safety or a signature voiding our responsibility,\r\nbut it's not like it's that unsafe: only the unimportant die\r\n(though countless have been hurt on this ride)\r\nbut you didn't hear that.\r\n\r\nRelinquish your soul, or just go somewhere else;\r\nbut we're the main proprietors anyways.\r\nGood luck finding someone better.	2009-01-22 16:25:02.994945
79	57	2009-01-23 15:50:29.451349	Industrialize	The old art of tasseomancy faced the Lipton bag\r\none day, and the future was suddenly uncertain.\r\n\r\nDraw the curtain.  They might live next door and\r\nyou might know their names, you might have a yard\r\nand fifteen minutes of fame.\r\n\r\nGet off the airport after a week in the East and\r\neveryone just looks like balloons, fat and empty,\r\nbut skin pocked like the Moon.\r\n\r\nIndustrialize.  Butylated hydroxytoluene, some\r\nnew fad, drag and jag.  Skip the tea leaves and\r\nread the tea stains.  That cup is empty, guys.	2009-01-23 15:50:29.451349
80	57	2009-01-24 07:36:58.754143	Industrialize	The old art of tasseomancy faced the Lipton bag\none day, and the future was suddenly uncertain.\n\nDraw the curtain.  They might live next door and\nyou might know their names, you might have a yard\nand twelve seconds of fame.\n\nGet off the airport after a week in the East and\neveryone looks like balloons, fat and empty,\nbut skin pocked like the Moon.\n\nIndustrialize.  Butylated hydroxytoluene, some\nnew fad, drag and jag.  Skip the tea leaves and\nread the tea stains.  That cup is empty, guys.	2009-01-24 07:36:58.754143
\.


--
-- Data for Name: schema_info; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY schema_info (version) FROM stdin;
11
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY taggings (id, tag_id, taggable_id, taggable_type, created_at) FROM stdin;
2	2	24	Poem	2008-12-08 08:37:39.696678
3	3	36	Poem	2008-12-26 23:16:35.589029
4	4	36	Poem	2008-12-26 23:16:35.663691
5	5	36	Poem	2008-12-26 23:16:47.987127
6	6	36	Poem	2008-12-26 23:16:47.992452
7	7	36	Poem	2008-12-26 23:16:47.997578
8	8	36	Poem	2008-12-26 23:16:48.002597
9	9	47	Poem	2009-01-19 18:24:40.998788
10	10	46	Poem	2009-01-19 18:24:57.937931
11	11	38	Poem	2009-01-19 18:25:22.160541
12	12	32	Poem	2009-01-19 18:25:52.359213
13	13	32	Poem	2009-01-19 18:25:52.366359
14	14	31	Poem	2009-01-19 18:26:10.740769
15	15	54	Poem	2009-01-21 18:58:41.897085
16	16	54	Poem	2009-01-21 18:58:51.196324
17	17	54	Poem	2009-01-21 18:58:51.201512
18	18	53	Poem	2009-01-21 18:59:11.512801
19	15	53	Poem	2009-01-21 18:59:11.516219
20	17	53	Poem	2009-01-21 18:59:11.519236
21	18	52	Poem	2009-01-21 18:59:36.251781
22	19	52	Poem	2009-01-21 18:59:36.257747
23	20	51	Poem	2009-01-22 18:11:57.004906
24	21	25	Poem	2009-01-22 18:12:35.891533
25	22	56	Poem	2009-01-23 13:54:50.232691
26	23	56	Poem	2009-01-23 13:54:50.251526
27	24	56	Poem	2009-01-23 13:54:50.257085
28	15	58	Poem	2009-01-24 12:05:57.978338
29	25	58	Poem	2009-01-24 12:05:58.020282
30	15	59	Poem	2009-01-24 12:06:13.819205
31	17	59	Poem	2009-01-24 12:06:13.822459
32	26	59	Poem	2009-01-24 12:06:13.858088
33	18	59	Poem	2009-01-24 12:06:13.861255
34	18	58	Poem	2009-01-24 12:06:23.505302
35	25	60	Poem	2009-01-24 14:24:30.022511
36	18	60	Poem	2009-01-24 14:24:30.068842
37	15	60	Poem	2009-01-24 14:24:30.072113
38	27	55	Poem	2009-01-25 12:25:34.01419
39	18	55	Poem	2009-01-25 12:25:34.030216
40	15	55	Poem	2009-01-25 12:25:34.033105
41	26	55	Poem	2009-01-25 12:25:34.036134
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY tags (id, name) FROM stdin;
1	junk
2	food
3	ballad
4	traditional
5	blues
6	devil
7	soul
8	hell
9	haiku
10	slam
11	satire
12	travel
13	india
14	family
15	experimental
16	open,
17	abstract
18	open
19	stream
20	politics
21	college
22	photograph
23	childhood
24	dream
25	concrete
26	love
27	couplets
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY urls (id, user_id, url, created_at, updated_at) FROM stdin;
1	1	http://www.clickpass.com/id/st7wunchr3fk	2008-11-26 11:39:27.091131	2008-11-26 11:39:27.091131
2	1	http://clickpass.com/public/justindz	2008-11-26 11:39:50.654709	2008-11-26 11:39:50.654709
3	2	http://www.clickpass.com/id/gaywm6bghilp	2008-12-03 19:15:45.949338	2008-12-03 19:15:45.949338
4	1	http://openid.aol.com/dzjustin	2008-12-17 07:23:30.756388	2008-12-17 07:23:30.756388
5	3	http://www.clickpass.com/id/gykjjgogimbs	2008-12-20 10:00:46.208452	2008-12-20 10:00:46.208452
6	4	http://www.clickpass.com/id/gdffuk2ynx7w	2009-01-04 19:35:18.737765	2009-01-04 19:35:18.737765
7	5	http://www.clickpass.com/id/mhb5v74ocb0y	2009-01-25 16:54:20.790344	2009-01-25 16:54:20.790344
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: app5137
--

COPY users (id, name, email, crypted_password, salt, remember_token_expires_at, remember_token, created_at, updated_at) FROM stdin;
1	Justin D-Z	justindz@gmail.com	\N	\N	\N	\N	2008-11-26	2008-11-26
2	Malformed XML Element	malformedxmlelement@yahoo.com	\N	\N	\N	\N	2008-12-03	2008-12-03
3	JT		\N	\N	\N	\N	2008-12-20	2008-12-20
4	dustin		\N	\N	\N	\N	2009-01-04	2009-01-04
5	\N	\N	\N	\N	\N	\N	2009-01-25	2009-01-25
\.


--
-- Name: avatars_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- Name: poems_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY poems
    ADD CONSTRAINT poems_pkey PRIMARY KEY (id);


--
-- Name: revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY revisions
    ADD CONSTRAINT revisions_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: urls_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: app5137; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: app5137; Tablespace: 
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type; Type: INDEX; Schema: public; Owner: app5137; Tablespace: 
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type ON taggings USING btree (taggable_id, taggable_type);


--
-- PostgreSQL database dump complete
--

