--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-02-26 17:26:16

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
    NO MINVALUE
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
    fresult double precision
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

SELECT pg_catalog.setval('main_seq', 76, true);


--
-- TOC entry 2152 (class 0 OID 41002)
-- Dependencies: 184
-- Data for Name: t_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (29, 'q3.q1. a', 28, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (30, 'q3.q1. b', 28, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (31, 'q3.q1. c', 28, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (32, 'q3.q1. d', 28, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (34, 'q3.q2. a', 33, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (35, 'q3.q2. b', 33, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (36, 'q3.q2. c', 33, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (37, 'q3.q2. d', 33, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (39, 'Black', 38, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (40, 'Purple', 38, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (41, 'Red', 38, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (42, 'Yellow', 38, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (49, 'Sergey', 48, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (50, 'Eugin', 48, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (51, 'Alexandr', 48, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (52, 'George', 48, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (55, '5', 54, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (56, '9', 54, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (57, '3.5', 54, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (58, '14', 54, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (63, '', 62, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (64, '', 62, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (65, '', 62, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (66, '', 62, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (68, '', 67, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (69, '', 67, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (70, '', 67, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (71, '', 67, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (73, '10', 72, true);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (74, '1', 72, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (75, '2', 72, false);
INSERT INTO t_answers (id, vbody, nquestionid, biscorrect) VALUES (76, '3', 72, false);


--
-- TOC entry 2151 (class 0 OID 40976)
-- Dependencies: 183
-- Data for Name: t_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_questions (id, vbody, nquizid) VALUES (28, 'q3.q1', 7);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (33, 'q3.q2', 7);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (38, 'What is the color of the Moon', 7);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (48, 'What is the name of Pushkin', 8);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (54, 'How much it will be 2 x 7', 53);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (62, '', 6);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (67, '', 6);
INSERT INTO t_questions (id, vbody, nquizid) VALUES (72, 'How much will be 5 + 5', 6);


--
-- TOC entry 2150 (class 0 OID 40962)
-- Dependencies: 182
-- Data for Name: t_quizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (5, 'First Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (6, 'Second Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (7, 'Third Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (8, 'Forth Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (53, 'Fifth Quiz', 4, '2016-02-26', false);


--
-- TOC entry 2153 (class 0 OID 41015)
-- Dependencies: 185
-- Data for Name: t_results; Type: TABLE DATA; Schema: public; Owner: postgres
--



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

INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (1, 'Mouzitoto', 'Ruslan Babich', 'Mouzitoto@gmail.com', '123456', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (2, 'RinRin', 'Kate', 'baurym@gmail.com', '123456', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (3, 'Fareon', 'Arman', 'mk.Fareon@gmail.com', '987221', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (4, 'Baha', 'Baha Derzkiy', 'Baha@mail.ru', '112', true);
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive) VALUES (61, 'Pacman', 'Adrian', 'Pacman@yahoo.com', '123', true);


--
-- TOC entry 2155 (class 0 OID 41041)
-- Dependencies: 187
-- Data for Name: t_userstoroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (1, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (2, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (3, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (4, 10);
INSERT INTO t_userstoroles (nuserid, nroleid) VALUES (61, 10);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-26 17:26:16

--
-- PostgreSQL database dump complete
--

