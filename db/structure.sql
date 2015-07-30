--
-- PostgreSQL database dump
--

--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying NOT NULL,
    office json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
