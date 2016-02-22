--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-02-22 12:36:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE quiz;
--
-- TOC entry 2142 (class 1262 OID 16393)
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
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 186 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 186
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
-- TOC entry 181 (class 1259 OID 16396)
-- Name: t_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_users (
    id numeric NOT NULL,
    vlogin character varying,
    vfullname character varying,
    vemail character varying,
    vpasswordhash character varying
);


ALTER TABLE t_users OWNER TO postgres;

--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 180
-- Name: main_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_seq', 8, true);


--
-- TOC entry 2136 (class 0 OID 41002)
-- Dependencies: 184
-- Data for Name: t_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2135 (class 0 OID 40976)
-- Dependencies: 183
-- Data for Name: t_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2134 (class 0 OID 40962)
-- Dependencies: 182
-- Data for Name: t_quizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (5, 'First Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (6, 'Second Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (7, 'Third Quiz', 4, '2016-02-11', false);
INSERT INTO t_quizes (id, vname, nuserid, dcreatedate, bisactive) VALUES (8, 'Forth Quiz', 4, '2016-02-11', false);


--
-- TOC entry 2137 (class 0 OID 41015)
-- Dependencies: 185
-- Data for Name: t_results; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2133 (class 0 OID 16396)
-- Dependencies: 181
-- Data for Name: t_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash) VALUES (1, 'Mouzitoto', 'Ruslan Babich', 'Mouzitoto@gmail.com', '123456');
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash) VALUES (2, 'RinRin', 'Kate', 'baurym@gmail.com', '123456');
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash) VALUES (3, 'Fareon', 'Arman', 'mk.Fareon@gmail.com', '987221');
INSERT INTO t_users (id, vlogin, vfullname, vemail, vpasswordhash) VALUES (4, 'Baha', 'Baha Derzkiy', 'Baha@mail.ru', '112');


--
-- TOC entry 2010 (class 2606 OID 41009)
-- Name: t_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_answers
    ADD CONSTRAINT t_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 2008 (class 2606 OID 40983)
-- Name: t_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_questions
    ADD CONSTRAINT t_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2006 (class 2606 OID 40969)
-- Name: t_quizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_quizes
    ADD CONSTRAINT t_quizes_pkey PRIMARY KEY (id);


--
-- TOC entry 2012 (class 2606 OID 41022)
-- Name: t_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_results
    ADD CONSTRAINT t_results_pkey PRIMARY KEY (id);


--
-- TOC entry 2003 (class 2606 OID 40961)
-- Name: t_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_users
    ADD CONSTRAINT t_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2004 (class 1259 OID 40975)
-- Name: fki_t_quizes_fkey_nuserid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_t_quizes_fkey_nuserid ON t_quizes USING btree (nuserid);


--
-- TOC entry 2015 (class 2606 OID 41010)
-- Name: t_questions_fkey_nquestionid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_answers
    ADD CONSTRAINT t_questions_fkey_nquestionid FOREIGN KEY (nquestionid) REFERENCES t_questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2014 (class 2606 OID 40984)
-- Name: t_questions_fkey_nquizid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_questions
    ADD CONSTRAINT t_questions_fkey_nquizid FOREIGN KEY (nquizid) REFERENCES t_quizes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2013 (class 2606 OID 40970)
-- Name: t_quizes_fkey_nuserid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_quizes
    ADD CONSTRAINT t_quizes_fkey_nuserid FOREIGN KEY (nuserid) REFERENCES t_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2016 (class 2606 OID 41023)
-- Name: t_results_fkey_nquizid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_results
    ADD CONSTRAINT t_results_fkey_nquizid FOREIGN KEY (nquizid) REFERENCES t_quizes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2017 (class 2606 OID 41028)
-- Name: t_results_fkey_nuserid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_results
    ADD CONSTRAINT t_results_fkey_nuserid FOREIGN KEY (nuserid) REFERENCES t_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-22 12:36:17

--
-- PostgreSQL database dump complete
--

