--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-03-14 20:26:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE quiz;
--
-- TOC entry 2160 (class 1262 OID 16393)
-- Name: quiz; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE quiz WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE quiz OWNER TO postgres;

\connect quiz

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 188 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 188
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 180 (class 1259 OID 16394)
-- Name: main_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE main_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE main_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 41002)
-- Name: t_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_answers (
    id numeric NOT NULL,
    vbody character varying,
    nquestionid numeric,
    biscorrect boolean
);


ALTER TABLE t_answers OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 40976)
-- Name: t_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_questions (
    id numeric NOT NULL,
    vbody character varying,
    nquizid numeric
);


ALTER TABLE t_questions OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 40962)
-- Name: t_quizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_quizes (
    id numeric NOT NULL,
    vname character varying,
    nuserid numeric,
    dcreatedate date,
    bisactive boolean
);


ALTER TABLE t_quizes OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 41015)
-- Name: t_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_results (
    id numeric NOT NULL,
    nquizid numeric,
    nuserid numeric,
    dstartdate date,
    denddate date,
    fresult double precision,
    vanswerids character varying
);


ALTER TABLE t_results OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 41033)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_roles (
    id numeric NOT NULL,
    vname character varying
);


ALTER TABLE t_roles OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16396)
-- Name: t_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_users (
    id numeric NOT NULL,
    vlogin character varying,
    vfullname character varying,
    vemail character varying,
    vpasswordhash character varying,
    bisactive boolean
);


ALTER TABLE t_users OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 41041)
-- Name: t_userstoroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_userstoroles (
    nuserid numeric,
    nroleid numeric
);


ALTER TABLE t_userstoroles OWNER TO postgres;

--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 180
-- Name: main_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_seq', 163, true);


--
-- TOC entry 2152 (class 0 OID 41002)
-- Dependencies: 184
-- Data for Name: t_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (4, 'Milk', 3, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (5, 'Bread', 3, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (6, 'Grass', 3, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (7, 'Stones', 3, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (9, 'Purple', 8, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (10, 'Green', 8, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (11, 'Orange', 8, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (12, 'Blue', 8, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (14, 'Cat', 13, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (15, 'Frog', 13, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (16, 'Dog', 13, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (17, 'Elephant', 13, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (19, 'Oslo', 18, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (20, 'Tom', 18, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (21, 'Jerry', 18, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (22, 'Brian', 18, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (24, 'Dog', 23, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (25, 'Wolf', 23, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (26, 'Sheep', 23, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (27, 'Cat', 23, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (29, 'Frog', 28, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (30, 'Dog', 28, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (31, 'Pig', 28, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (32, 'Sheep', 28, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (36, '5', 35, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (37, '1', 35, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (38, '0', 35, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (39, '4', 35, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (41, '4', 40, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (42, '3', 40, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (43, '11', 40, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (44, '7', 40, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (46, '0', 45, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (47, '12', 45, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (48, '24', 45, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (49, '1', 45, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (51, '36', 50, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (52, '65', 50, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (53, '30', 50, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (54, '1', 50, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (56, '11', 55, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (57, '23', 55, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (58, '25', 55, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (59, '24', 55, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (61, '24', 60, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (62, '83', 60, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (63, '5', 60, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (64, '2', 60, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (66, '6', 65, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (67, '5', 65, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (68, '120', 65, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (69, '80', 65, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (75, 'Moscow', 74, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (76, 'Kair', 74, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (77, 'Karaganda', 74, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (78, 'Belov', 74, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (80, 'Almaty', 79, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (81, 'Aktau', 79, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (82, 'Astana', 79, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (83, 'Pavlodar', 79, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (85, 'Texas', 84, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (86, 'New York', 84, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (87, 'Columb', 84, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (88, 'Washington', 84, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (90, 'Yoyoyoyo', 89, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (91, 'Pekin', 89, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (92, 'Urumchi', 89, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (93, 'Chikatin', 89, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (95, 'Manchester', 94, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (96, 'London', 94, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (97, 'Sapog', 94, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (98, 'Burningham', 94, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (105, 'Cairo', 104, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (106, 'Kiar', 104, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (107, 'Biton', 104, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (108, 'Saulton', 104, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (100, 'Leon', 99, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (101, 'Milan', 99, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (102, 'Paris', 99, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (103, 'Montero', 99, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (117, '20', 116, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (118, '40', 116, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (119, '10', 116, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (120, '50', 116, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (122, 'Poncho', 121, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (123, 'Kitaro', 121, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (124, 'Abiskus', 121, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (125, 'Parrish', 121, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (127, 'Yes', 126, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (128, 'No', 126, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (129, 'Im thinking about it', 126, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (130, 'What?', 126, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (132, 'Green', 131, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (133, 'Yellow', 131, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (134, 'Black', 131, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (135, 'Indigo', 131, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (137, 'Very long', 136, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (138, 'Not so long', 136, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (139, 'Long', 136, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (140, 'The longest', 136, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (142, 'Check me', 141, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (143, 'Me too', 141, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (144, 'Both of us', 141, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (145, 'What am I doing here?', 141, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (147, 'Batman', 146, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (148, 'Banana', 146, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (149, 'Flowers', 146, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (150, 'Underground party', 146, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (152, 'Blue sky', 151, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (153, 'No brain', 151, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (154, 'Ability to fly', 151, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (155, 'No body', 151, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (157, 'Chair', 156, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (158, 'Notebook', 156, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (159, 'Key', 156, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (160, 'Picture', 156, true);


--
-- TOC entry 2151 (class 0 OID 40976)
-- Dependencies: 183
-- Data for Name: t_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_questions (id, vbody, nquizid) VALUES (3, 'What can we get from cow?', 2);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (8, 'What is the color of the lion?', 2);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (13, 'Who says woof woof?', 2);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (18, 'What is the name of cat in the cartoon "Tom and Jerry"?', 2);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (23, 'Who sleeps more than half a day?', 2);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (28, 'Who eats insects?', 2);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (35, '2 + 2', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (40, '11 - 7', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (45, '12 - 12', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (50, '6 * 5', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (55, '24 / 1', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (60, '8 * 3', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (65, '100 / 20', 34);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (74, 'The capital of Russia', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (79, 'The capital of Kazakhstan', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (84, 'The capital of USA', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (89, 'The capital of China', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (94, 'The capital of Great Britain', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (104, 'The capital of Egypt', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (99, 'The capital of France', 73);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (116, 'How much?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (121, 'What was his name yesterday?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (126, 'Delete?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (131, 'What is the color?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (136, 'How long?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (141, 'So?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (146, 'What is in the end?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (151, 'Freedom?', 115);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (156, 'The last one...', 115);


--
-- TOC entry 2150 (class 0 OID 40962)
-- Dependencies: 182
-- Data for Name: t_quizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (2, 'Pets quiz', 1, '2016-03-14', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (34, 'Math quiz', 33, '2016-03-14', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (73, 'Capitals', 72, '2016-03-14', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (115, 'Check ur intuition', 114, '2016-03-14', false);


--
-- TOC entry 2153 (class 0 OID 41015)
-- Dependencies: 185
-- Data for Name: t_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (70, 2, 33, '2016-03-14', '2016-03-14', 66, '6,11,16,22,27,29');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (109, 34, 72, '2016-03-14', '2016-03-14', 85, '39,41,46,52,59,61,67');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (110, 2, 72, '2016-03-14', '2016-03-14', 33, '4,9,14,19,24,29');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (111, 2, 71, '2016-03-14', '2016-03-14', 83, '4,11,16,20,26,29');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (112, 34, 71, '2016-03-14', '2016-03-14', 42, '36,41,46,51,56,61,66');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (113, 73, 71, '2016-03-14', '2016-03-14', 28, '75,80,85,90,95,100,105');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (161, 73, 114, '2016-03-14', '2016-03-14', 33, '76,81,87,91,96,106');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (162, 34, 114, '2016-03-14', '2016-03-14', 14, '37,42,47,52,57,62,67');
INSERT INTO t_results (id, nquizid, nuserid, dstartdate, denddate, fresult, vanswerids) VALUES (163, 2, 114, '2016-03-14', '2016-03-14', 16, '7,12,16,22,25,31');


--
-- TOC entry 2154 (class 0 OID 41033)
-- Dependencies: 186
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_roles (id, vname) VALUES (9, 'admin');
INSERT INTO t_roles (id, vname) VALUES (10, 'user');


--
-- TOC entry 2149 (class 0 OID 16396)
-- Dependencies: 181
-- Data for Name: t_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (1, 'Alex', 'Alex', 'alex@yahoo.com', 'alex123', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (33, 'Gilbert', 'Gilbert', 'gb@gmail.com', 'gb07', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (71, 'Baha', 'Baha Derzkiy', 'Baha@mail.ru', '112', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (72, 'Zozo', 'Zondo Abrams', 'zozo@yandex.ru', 'zzz', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (114, 'Tony', 'Tony', 'tonyindahause@party.net', 'montana', true);


--
-- TOC entry 2155 (class 0 OID 41041)
-- Dependencies: 187
-- Data for Name: t_userstoroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (1, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (33, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (71, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (72, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (114, 10);


--
-- TOC entry 2020 (class 2606 OID 41009)
-- Name: t_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_answers
    ADD CONSTRAINT t_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 2018 (class 2606 OID 40983)
-- Name: t_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_questions
    ADD CONSTRAINT t_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2016 (class 2606 OID 40969)
-- Name: t_quizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_quizes
    ADD CONSTRAINT t_quizes_pkey PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 41022)
-- Name: t_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_results
    ADD CONSTRAINT t_results_pkey PRIMARY KEY (id);


--
-- TOC entry 2024 (class 2606 OID 41040)
-- Name: t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2013 (class 2606 OID 40961)
-- Name: t_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_users
    ADD CONSTRAINT t_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2014 (class 1259 OID 40975)
-- Name: fki_t_quizes_fkey_nuserid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_t_quizes_fkey_nuserid ON t_quizes USING btree (nuserid);


--
-- TOC entry 2025 (class 1259 OID 41058)
-- Name: fki_t_userstoroles_fkey_nroleid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_t_userstoroles_fkey_nroleid ON t_userstoroles USING btree (nroleid);


--
-- TOC entry 2026 (class 1259 OID 41052)
-- Name: fki_t_userstoroles_fkey_nuserid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_t_userstoroles_fkey_nuserid ON t_userstoroles USING btree (nuserid);


--
-- TOC entry 2029 (class 2606 OID 41010)
-- Name: t_questions_fkey_nquestionid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_answers
    ADD CONSTRAINT t_questions_fkey_nquestionid FOREIGN KEY (nquestionid) REFERENCES t_questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2028 (class 2606 OID 40984)
-- Name: t_questions_fkey_nquizid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_questions
    ADD CONSTRAINT t_questions_fkey_nquizid FOREIGN KEY (nquizid) REFERENCES t_quizes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2027 (class 2606 OID 40970)
-- Name: t_quizes_fkey_nuserid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_quizes
    ADD CONSTRAINT t_quizes_fkey_nuserid FOREIGN KEY (nuserid) REFERENCES t_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2030 (class 2606 OID 41023)
-- Name: t_results_fkey_nquizid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_results
    ADD CONSTRAINT t_results_fkey_nquizid FOREIGN KEY (nquizid) REFERENCES t_quizes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2031 (class 2606 OID 41028)
-- Name: t_results_fkey_nuserid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_results
    ADD CONSTRAINT t_results_fkey_nuserid FOREIGN KEY (nuserid) REFERENCES t_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2033 (class 2606 OID 49230)
-- Name: t_userstoroles_nroleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_userstoroles
    ADD CONSTRAINT t_userstoroles_nroleid_fkey FOREIGN KEY (nroleid) REFERENCES t_roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2032 (class 2606 OID 49225)
-- Name: t_userstoroles_nuserid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_userstoroles
    ADD CONSTRAINT t_userstoroles_nuserid_fkey FOREIGN KEY (nuserid) REFERENCES t_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-03-14 20:26:30

--
-- PostgreSQL database dump complete
--

