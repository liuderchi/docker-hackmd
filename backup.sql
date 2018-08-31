--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

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


--
-- Name: enum_Notes_permission; Type: TYPE; Schema: public; Owner: hackmd
--

CREATE TYPE public."enum_Notes_permission" AS ENUM (
    'freely',
    'editable',
    'limited',
    'locked',
    'protected',
    'private'
);


ALTER TYPE public."enum_Notes_permission" OWNER TO hackmd;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Authors; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Authors" (
    id integer NOT NULL,
    color character varying(255),
    "noteId" uuid,
    "userId" uuid,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public."Authors" OWNER TO hackmd;

--
-- Name: Authors_id_seq; Type: SEQUENCE; Schema: public; Owner: hackmd
--

CREATE SEQUENCE public."Authors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Authors_id_seq" OWNER TO hackmd;

--
-- Name: Authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hackmd
--

ALTER SEQUENCE public."Authors_id_seq" OWNED BY public."Authors".id;


--
-- Name: Notes; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Notes" (
    id uuid NOT NULL,
    "ownerId" uuid,
    content text,
    title text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    shortid character varying(255) DEFAULT '0000000000'::character varying NOT NULL,
    permission character varying(255) DEFAULT 'private'::character varying NOT NULL,
    viewcount integer DEFAULT 0,
    "lastchangeuserId" uuid,
    "lastchangeAt" timestamp with time zone,
    alias character varying(255),
    "savedAt" timestamp with time zone,
    authorship text,
    "deletedAt" timestamp with time zone
);


ALTER TABLE public."Notes" OWNER TO hackmd;

--
-- Name: Revisions; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Revisions" (
    id uuid NOT NULL,
    "noteId" uuid,
    patch text,
    "lastContent" text,
    content text,
    length integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    authorship text
);


ALTER TABLE public."Revisions" OWNER TO hackmd;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO hackmd;

--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Sessions" OWNER TO hackmd;

--
-- Name: Temp; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Temp" (
    id character varying(255) NOT NULL,
    date text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public."Temp" OWNER TO hackmd;

--
-- Name: Temps; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Temps" (
    id character varying(255) NOT NULL,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Temps" OWNER TO hackmd;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: hackmd
--

CREATE TABLE public."Users" (
    id uuid NOT NULL,
    profileid character varying(255),
    profile text,
    history text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "accessToken" text,
    "refreshToken" text,
    email text,
    password text,
    "deleteToken" uuid
);


ALTER TABLE public."Users" OWNER TO hackmd;

--
-- Name: Authors id; Type: DEFAULT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Authors" ALTER COLUMN id SET DEFAULT nextval('public."Authors_id_seq"'::regclass);


--
-- Data for Name: Authors; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Authors" (id, color, "noteId", "userId", "createdAt", "updatedAt") FROM stdin;
1	#2cb25f	7e5b5bf1-d0b1-4760-b937-7987d2655420	7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	2018-08-31 07:50:27.163+00	2018-08-31 07:50:27.163+00
2	#aefcc5	f9a183bd-2c54-45d6-935a-107778fcd6fa	7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	2018-08-31 07:50:38.124+00	2018-08-31 07:50:38.124+00
\.


--
-- Name: Authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hackmd
--

SELECT pg_catalog.setval('public."Authors_id_seq"', 2, true);


--
-- Data for Name: Notes; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Notes" (id, "ownerId", content, title, "createdAt", "updatedAt", shortid, permission, viewcount, "lastchangeuserId", "lastchangeAt", alias, "savedAt", authorship, "deletedAt") FROM stdin;
e0bf4564-fd7d-46eb-b98b-4f59fcb70c31	\N	# MCS Website Guide React 套件調查\n\n\n## Date\n\n- 2018-08-31\n\n---\n\n## Description\n\n- 搜尋適合 Scene 的網頁引導套件\n\n---\n\n### 搜尋方法\n\n- Github 上面主題為 tour 的 JavaScript 套件：[`/topics/tour?l=javascript`](https://github.com/topics/tour?l=javascript)\n\n\n---\n\n### Comparison\n\n| 名稱                              | 如何取得元件位置？                    | 縮圖            | 特性                                                                                                                                         |\n| --------------------------------- | ------------------------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |\n| 🥈 [reactour][reactour]           | CSS classname, Html 屬性              | ![shot1][shot1] | - 觸發方式：單一位置按鈕或是頁面讀取後 <br> - 可以客製化部分 Tooltip <br> - 可以監聽 UI 變化來顯示 <br> - 最新版有問題，套件相依性多 [\\*][1] |\n| 🥇 [react-joyride][react-joyride] | CSS classname, Html 屬性, Ref [\\*][2] | ![shot2][shot2] | - 觸發方式：[信號元件][3] / 按鈕 / 頁面讀取後 <br> - 可以彈性客製化 Tooltip                                                                  |\n\n[reactour]: https://github.com/elrumordelaluz/reactour\n[react-joyride]: https://github.com/gilbarbara/react-joyride\n[1]: https://github.com/elrumordelaluz/reactour/issues/72\n[2]: https://github.com/gilbarbara/react-joyride/blob/master/docs/step.md#and-you-can-use-these\n[3]: https://2zpjporp4p.codesandbox.io/custom\n[shot1]: https://user-images.githubusercontent.com/4994705/44892085-70038f00-ad15-11e8-9ad3-82c18e9c59fe.png\n[shot2]: https://user-images.githubusercontent.com/4994705/44892082-6e39cb80-ad15-11e8-97e6-b2d7b727313c.png\n\n### 作法\n\n- `styled.attrs({ 'data-some-attr': 'someValue' })`\n\n**WIP 2018-08-31**\n	MCS Website Guide React 套件調查	2018-08-31 03:14:45.126+00	2018-08-31 07:44:33.602+00	ryasG4UP7	freely	5	\N	2018-08-31 06:51:11.585+00	\N	2018-08-31 06:54:26.821+00	[]	\N
fb7fe2c5-4ad2-4292-9888-f5519eb0312c	\N		Untitled	2018-08-31 07:45:08.533+00	2018-08-31 07:45:18.205+00	S1a-MOLv7	freely	1	\N	\N	\N	2018-08-31 07:45:08.562+00	\N	\N
e2140ee3-1049-44d2-ad6a-c36667e63d7e	\N	# test1 	test1	2018-08-31 07:45:46.68+00	2018-08-31 07:54:24.152+00	rJ7VG_8w7	freely	0	\N	2018-08-31 07:48:10.704+00	\N	2018-08-31 07:54:24.128+00	[]	\N
cab65d59-791d-4e47-8b20-67f363169311	\N	# test 3	test 3	2018-08-31 07:46:27.787+00	2018-08-31 07:54:24.155+00	Bk3LfO8DQ	freely	0	\N	2018-08-31 07:48:26.732+00	\N	2018-08-31 07:54:24.136+00	[]	\N
7e5b5bf1-d0b1-4760-b937-7987d2655420	7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	# test 1	test 1	2018-08-31 07:50:15.98+00	2018-08-31 07:59:23.93+00	HyeS7uUP7	editable	0	7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	2018-08-31 07:50:29.066+00	\N	2018-08-31 07:59:23.915+00	[["7d8fd3a9-a91d-45c4-a670-3fe5c38ce641",0,8,1535701827155,1535701828142]]	\N
f9a183bd-2c54-45d6-935a-107778fcd6fa	7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	# test 2	test 2	2018-08-31 07:50:33.511+00	2018-08-31 07:59:23.933+00	SkZ87OUPm	editable	0	7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	2018-08-31 07:50:40.091+00	\N	2018-08-31 07:59:23.92+00	[["7d8fd3a9-a91d-45c4-a670-3fe5c38ce641",0,8,1535701838118,1535701839597]]	\N
\.


--
-- Data for Name: Revisions; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Revisions" (id, "noteId", patch, "lastContent", content, length, "createdAt", "updatedAt", authorship) FROM stdin;
9ba6227d-d31c-4429-bc5c-52b61835d13c	e0bf4564-fd7d-46eb-b98b-4f59fcb70c31	\N		null	0	2018-08-31 03:14:45.151+00	2018-08-31 03:24:35.024+00	[]
b3910b97-1838-45eb-a925-57fdb07669a3	e0bf4564-fd7d-46eb-b98b-4f59fcb70c31	@@ -1,71 +1,1731 @@\n # \n-%F0%9F%9A%82\n+MCS\n  \n-PLAY\n+Website \n G\n+uide \n R\n-OUN\n+eact %E5%A5%97%E4%BB%B6%E8%AA%BF%E6%9F%A5%0A%0A%0A## \n D\n+ate\n %0A%0A-\n+ 2018\n -\n+08\n -\n+31\n %0A%0A\n+---%0A\n %0A## \n-w\n+Description%0A%0A- %E6%90%9C%E5%B0%8B%E9%81%A9%E5%90%88 Scen\n e\n+ %E7%9A%84%E7%B6%B2%E9%A0%81%E5%BC%95%E5%B0%8E%E5%A5%97%E4%BB%B6%0A%0A---%0A%0A### %E6%90%9C%E5%B0%8B%E6%96%B9%E6%B3%95%0A%0A- Githu\n b\n+ %E4%B8%8A%E9%9D%A2%E4%B8%BB%E9%A1%8C%E7%82%BA tour %E7%9A%84 JavaScript %E5%A5%97%E4%BB%B6%EF%BC%9A%5B%60/topic\n s\n+/tour?l=javascript%60%5D(https://g\n it\n+hub.com/topics/tour?l=javascript)%0A%0A%0A---%0A%0A### Comparison%0A%0A%7C %E5%90%8D%E7%A8%B1                              %7C %E5%A6%82%E4%BD%95%E5%8F%96%E5%BE%97%E5%85%83%E4%BB%B6%E4%BD%8D%E7%BD%AE%EF%BC%9F                    %7C %E7%B8%AE%E5%9C%96            %7C %E7%89%B9%E6%80%A7                                                                                                                                         %7C%0A%7C --------------------------------- %7C ------------------------------------- %7C --------------- %7C -------------------------------------------------------------------------------------------------------------------------------------------- %7C%0A%7C %F0%9F%A5%88 %5Br\n e\n+actour%5D%5Breactour%5D\n  \n+          %7C CSS classname, Html %E5%B1%AC%E6%80%A7              %7C !%5Bshot1%5D%5Bshot1%5D %7C - %E8%A7%B8%E7%99%BC%E6%96%B9%E5%BC%8F%EF%BC%9A%E5%96%AE%E4%B8%80%E4%BD%8D%E7%BD%AE%E6%8C%89%E9%88%95%E6%88%96%E6%98%AF%E9%A0%81%E9%9D%A2%E8%AE%80%E5%8F%96%E5%BE%8C %3Cbr%3E - %E5%8F%AF%E4%BB%A5%E5%AE%A2%E8%A3%BD%E5%8C%96%E9%83%A8%E5%88%86 Tooltip %3Cbr%3E - %E5%8F%AF%E4%BB%A5%E7%9B%A3%E8%81%BD UI %E8%AE%8A%E5%8C%96%E4%BE%86%E9%A1%AF%E7%A4%BA %3Cbr%3E - %E6%9C%80%E6%96%B0%E7%89%88%E6%9C%89%E5%95%8F%E9%A1%8C%EF%BC%8C%E5%A5%97%E4%BB%B6%E7%9B%B8%E4%BE%9D%E6%80%A7%E5%A4%9A %5B%5C*%5D%5B1%5D %7C%0A%7C %F0%9F%A5%87 %5Breact-joyride%5D%5Breact-joyride%5D %7C CSS classname, Html %E5%B1%AC%E6%80%A7, Ref %5B%5C*%5D%5B2%5D %7C !%5Bshot2%5D%5Bshot2%5D %7C - %E8%A7%B8%E7%99%BC%E6%96%B9%E5%BC%8F%EF%BC%9A%5B%E4%BF%A1%E8%99%9F%E5%85%83%E4%BB%B6%5D%5B3%5D / %E6%8C%89%E9%88%95 / %E9%A0%81%E9%9D%A2%E8%AE%80%E5%8F%96%E5%BE%8C %3Cbr%3E - %E5%8F%AF%E4%BB%A5%E5%BD%88%E6%80%A7%E5%AE%A2%E8%A3%BD%E5%8C%96 Tooltip                                                                  %7C%0A%0A%5Breactour%5D: https://\n g\n+ith\n u\n+b.com/elrumordelaluz/reactour%0A%5Breact-joyr\n ide\n+%5D:\n  \n+https://g\n i\n+thub.com/gilbarbara/react-joyride%0A%5B1%5D: https://github.com/elrumordelaluz/reactour/issues/72%0A%5B2%5D: https://github.com/gilbarbara/react-joyride/blob/master/docs/step.md#a\n n\n+d-you-can-use-these%0A%5B3%5D:\n  \n-R\n+https://2zpjporp4p.cod\n e\n+s\n a\n+ndbox.io/\n c\n+us\n t\n+om\n %0A\n+%5Bshot1%5D: https://user-images.githubusercontent.com/4994705/44892085-70038f00-ad15-11e8-9ad3-82c18e9c59fe.png\n %0A\n+%5Bshot2%5D: https://user\n -\n+images.githubusercontent.com/4994705/44892082\n -\n+6e39cb80\n -\n+ad15-11e8-97e6-b2d7b727313c.png\n %0A%0A### \n-C\n+%E4%BD%9C%E6%B3%95%0A%0A- %60styled.attrs(%7B 'data-s\n om\n-p\n+e-\n a\n+tt\n r\n-i\n+': '\n so\n-n\n+meValue' %7D)%60\n %0A%0A\n+**WIP 2018-08-31**%0A\n	\N	# MCS Website Guide React 套件調查\n\n\n## Date\n\n- 2018-08-31\n\n---\n\n## Description\n\n- 搜尋適合 Scene 的網頁引導套件\n\n---\n\n### 搜尋方法\n\n- Github 上面主題為 tour 的 JavaScript 套件：[`/topics/tour?l=javascript`](https://github.com/topics/tour?l=javascript)\n\n\n---\n\n### Comparison\n\n| 名稱                              | 如何取得元件位置？                    | 縮圖            | 特性                                                                                                                                         |\n| --------------------------------- | ------------------------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |\n| 🥈 [reactour][reactour]           | CSS classname, Html 屬性              | ![shot1][shot1] | - 觸發方式：單一位置按鈕或是頁面讀取後 <br> - 可以客製化部分 Tooltip <br> - 可以監聽 UI 變化來顯示 <br> - 最新版有問題，套件相依性多 [\\*][1] |\n| 🥇 [react-joyride][react-joyride] | CSS classname, Html 屬性, Ref [\\*][2] | ![shot2][shot2] | - 觸發方式：[信號元件][3] / 按鈕 / 頁面讀取後 <br> - 可以彈性客製化 Tooltip                                                                  |\n\n[reactour]: https://github.com/elrumordelaluz/reactour\n[react-joyride]: https://github.com/gilbarbara/react-joyride\n[1]: https://github.com/elrumordelaluz/reactour/issues/72\n[2]: https://github.com/gilbarbara/react-joyride/blob/master/docs/step.md#and-you-can-use-these\n[3]: https://2zpjporp4p.codesandbox.io/custom\n[shot1]: https://user-images.githubusercontent.com/4994705/44892085-70038f00-ad15-11e8-9ad3-82c18e9c59fe.png\n[shot2]: https://user-images.githubusercontent.com/4994705/44892082-6e39cb80-ad15-11e8-97e6-b2d7b727313c.png\n\n### 作法\n\n- `styled.attrs({ 'data-some-attr': 'someValue' })`\n\n**WIP 2018-08-31**\n	1731	2018-08-31 06:54:26.821+00	2018-08-31 06:54:26.821+00	[]
bf98d6bd-2930-4894-9176-8ec349669191	e0bf4564-fd7d-46eb-b98b-4f59fcb70c31	@@ -0,0 +1,71 @@\n+# %F0%9F%9A%82 PLAYGROUND%0A%0A---%0A%0A%0A## website guide in React%0A%0A---%0A%0A### Comparison%0A%0A\n	\N	null	71	2018-08-31 03:24:35.017+00	2018-08-31 06:54:26.83+00	[]
3c69388e-ee0b-4d25-94b0-d3b761028906	fb7fe2c5-4ad2-4292-9888-f5519eb0312c	\N		\N	0	2018-08-31 07:45:08.562+00	2018-08-31 07:45:08.562+00	[]
615504d0-73c3-45bd-b516-78a4f4abeb2a	e2140ee3-1049-44d2-ad6a-c36667e63d7e	@@ -0,0 +1,8 @@\n+# test1 \n	\N	# test1 	8	2018-08-31 07:54:24.128+00	2018-08-31 07:54:24.128+00	[]
e8b6eb90-a7fb-4e3c-8682-f74e52f7a30e	cab65d59-791d-4e47-8b20-67f363169311	@@ -0,0 +1,8 @@\n+# test 3\n	\N	# test 3	8	2018-08-31 07:54:24.136+00	2018-08-31 07:54:24.136+00	[]
cfa9b164-54d7-4a81-91a0-fb24a03477d1	e2140ee3-1049-44d2-ad6a-c36667e63d7e	\N		null	0	2018-08-31 07:45:46.692+00	2018-08-31 07:54:24.143+00	[]
aa47e5de-20d0-49aa-aa32-361e25f47b02	cab65d59-791d-4e47-8b20-67f363169311	\N		null	0	2018-08-31 07:46:27.804+00	2018-08-31 07:54:24.148+00	[]
e4f9673d-1c6a-4e49-a6b6-71aa904fa657	7e5b5bf1-d0b1-4760-b937-7987d2655420	@@ -0,0 +1,8 @@\n+# test 1\n	\N	# test 1	8	2018-08-31 07:59:23.915+00	2018-08-31 07:59:23.915+00	[["7d8fd3a9-a91d-45c4-a670-3fe5c38ce641",0,8,1535701827155,1535701828142]]
566718b7-1ddb-435d-bcc7-0af2c2fc41c1	f9a183bd-2c54-45d6-935a-107778fcd6fa	@@ -0,0 +1,8 @@\n+# test 2\n	\N	# test 2	8	2018-08-31 07:59:23.92+00	2018-08-31 07:59:23.92+00	[["7d8fd3a9-a91d-45c4-a670-3fe5c38ce641",0,8,1535701838118,1535701839597]]
12e21ab3-e2ec-4b2e-b6d7-de8d3c8067a6	7e5b5bf1-d0b1-4760-b937-7987d2655420	\N		null	0	2018-08-31 07:50:15.997+00	2018-08-31 07:59:23.925+00	[]
6ee1ccd4-76c3-4870-bf46-0c10c20c7eb7	f9a183bd-2c54-45d6-935a-107778fcd6fa	\N		null	0	2018-08-31 07:50:33.532+00	2018-08-31 07:59:23.927+00	[]
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."SequelizeMeta" (name) FROM stdin;
20150504155329-create-users.js
20150508114741-create-notes.js
20150515125813-create-temp.js
20150702001020-update-to-0_3_1.js
20150915153700-change-notes-title-to-text.js
20160112220142-note-add-lastchange.js
20160420180355-note-add-alias.js
20160515114000-user-add-tokens.js
20160607060246-support-revision.js
20160703062241-support-authorship.js
20161009040430-support-delete-note.js
20161201050312-support-email-signin.js
20171009121200-longtext-for-mysql.js
20180209120907-longtext-of-authorship.js
20180306150303-fix-enum.js
20180326103000-use-text-in-tokens.js
20180525153000-user-add-delete-token.js
\.


--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
ekDbfl6LQqQeixduITrn5R6ruk1qioeB	2018-09-14 08:20:51.762+00	{"cookie":{"originalMaxAge":1209600000,"expires":"2018-09-14T07:50:10.844Z","httpOnly":true,"path":"/"},"flash":{},"passport":{"user":"7d8fd3a9-a91d-45c4-a670-3fe5c38ce641"}}	2018-08-31 03:14:38.237+00	2018-08-31 08:20:51.763+00
\.


--
-- Data for Name: Temp; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Temp" (id, date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Temps; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Temps" (id, data, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: hackmd
--

COPY public."Users" (id, profileid, profile, history, "createdAt", "updatedAt", "accessToken", "refreshToken", email, password, "deleteToken") FROM stdin;
7d8fd3a9-a91d-45c4-a670-3fe5c38ce641	\N	\N	[{"id":"fltb8dCxR2C5N3mH0mVUIA","text":"test 1","time":1535701828142,"tags":[]},{"id":"-aGDvSxURdaTWhB3ePzW-g","text":"test 2","time":1535701839597,"tags":[]}]	2018-08-31 07:50:01.009+00	2018-08-31 07:50:40.101+00	\N	\N	derek.liu@mediatek.com	736372797074000e000000080000000154e4b04db0eeb424d49bc81099450fe52aec1e914a128c4a231a13e49fb414ba62780a686329c2e6c22850361f3d48708a9e3988c2e8259ecfbdc1db49cf2b2b0cacd859d0f69b6d5e24e4b80ef042a5	732f4f1c-7557-4453-8da3-648a1df6b998
\.


--
-- Name: Authors Authors_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Authors"
    ADD CONSTRAINT "Authors_pkey" PRIMARY KEY (id);


--
-- Name: Notes Notes_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Notes"
    ADD CONSTRAINT "Notes_pkey" PRIMARY KEY (id);


--
-- Name: Revisions Revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Revisions"
    ADD CONSTRAINT "Revisions_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Temp Temp_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Temp"
    ADD CONSTRAINT "Temp_pkey" PRIMARY KEY (id);


--
-- Name: Temps Temps_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Temps"
    ADD CONSTRAINT "Temps_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_profileid_key; Type: CONSTRAINT; Schema: public; Owner: hackmd
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_profileid_key" UNIQUE (profileid);


--
-- Name: authors_note_id_user_id; Type: INDEX; Schema: public; Owner: hackmd
--

CREATE UNIQUE INDEX authors_note_id_user_id ON public."Authors" USING btree ("noteId", "userId");


--
-- Name: notes_alias; Type: INDEX; Schema: public; Owner: hackmd
--

CREATE UNIQUE INDEX notes_alias ON public."Notes" USING btree (alias);


--
-- Name: notes_shortid; Type: INDEX; Schema: public; Owner: hackmd
--

CREATE UNIQUE INDEX notes_shortid ON public."Notes" USING btree (shortid);


--
-- PostgreSQL database dump complete
--

