--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: drwealth
--

CREATE TABLE public.bank_accounts (
    id integer NOT NULL,
    persons_id integer,
    account_name character varying(100) NOT NULL,
    balance numeric(10,2),
    CONSTRAINT "minimum_balance_USD25" CHECK ((balance >= (25)::numeric))
);


ALTER TABLE public.bank_accounts OWNER TO drwealth;

--
-- Name: CONSTRAINT "minimum_balance_USD25" ON bank_accounts; Type: COMMENT; Schema: public; Owner: drwealth
--

COMMENT ON CONSTRAINT "minimum_balance_USD25" ON public.bank_accounts IS 'greater than or equal to 25';


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: drwealth
--

CREATE SEQUENCE public.bank_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_accounts_id_seq OWNER TO drwealth;

--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drwealth
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: drwealth
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100),
    age bigint NOT NULL,
    language character varying(100) NOT NULL,
    alignment character varying(250) NOT NULL
);


ALTER TABLE public.persons OWNER TO drwealth;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: drwealth
--

CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO drwealth;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drwealth
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: drwealth
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: drwealth
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: drwealth
--

COPY public.bank_accounts (id, persons_id, account_name, balance) FROM stdin;
4	6	Lady Galadriel	8347932.00
3	5	Lord Sauron	5045.00
2	4	Bilbo B	3030.00
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: drwealth
--

COPY public.persons (id, first_name, last_name, age, language, alignment) FROM stdin;
4	Bilbo	Baggins	137	Hobbitish	Lawful Neutral
6	Galadriel	Lady	1659	Quenya	Neutral Good
5	Sauron	Lord	9223372036854775807	Black Speech	Lawful Evil
7	Legolas	The Elf	16591	Quenya	Neutral Good
8	Aragorn	Strider	12356	Westron	Lawful Good
\.


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drwealth
--

SELECT pg_catalog.setval('public.bank_accounts_id_seq', 4, true);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drwealth
--

SELECT pg_catalog.setval('public.persons_id_seq', 6, true);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: drwealth
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: drwealth
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: bank_accounts bank_accounts_persons_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drwealth
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_persons_id_fkey FOREIGN KEY (persons_id) REFERENCES public.persons(id);


--
-- PostgreSQL database dump complete
--

