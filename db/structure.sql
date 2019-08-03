SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: grade; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE grade AS ENUM (
    'N',
    'P',
    'Z',
    'C',
    'B',
    'A'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: health_inspections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE health_inspections (
    id bigint NOT NULL,
    inspection_date date,
    action text,
    violation_code character varying,
    violation_description text,
    critical_flag character varying,
    score integer,
    grade_date date,
    restaurant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    record_date date,
    inspection_type text,
    grade grade
);


--
-- Name: health_inspections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE health_inspections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: health_inspections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE health_inspections_id_seq OWNED BY health_inspections.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE restaurants (
    camis bigint NOT NULL,
    name character varying,
    boro character varying,
    building integer,
    street character varying,
    zipcode integer,
    phone bigint,
    cuisine character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: restaurants_camis_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE restaurants_camis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: restaurants_camis_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE restaurants_camis_seq OWNED BY restaurants.camis;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: violations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE violations (
    id bigint NOT NULL,
    code character varying,
    description text,
    critical_flag character varying,
    health_inspection_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: violations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE violations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: violations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE violations_id_seq OWNED BY violations.id;


--
-- Name: health_inspections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY health_inspections ALTER COLUMN id SET DEFAULT nextval('health_inspections_id_seq'::regclass);


--
-- Name: restaurants camis; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurants ALTER COLUMN camis SET DEFAULT nextval('restaurants_camis_seq'::regclass);


--
-- Name: violations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY violations ALTER COLUMN id SET DEFAULT nextval('violations_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: health_inspections health_inspections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY health_inspections
    ADD CONSTRAINT health_inspections_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (camis);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: violations violations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY violations
    ADD CONSTRAINT violations_pkey PRIMARY KEY (id);


--
-- Name: index_violations_on_health_inspection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_violations_on_health_inspection_id ON violations USING btree (health_inspection_id);


--
-- Name: violations fk_rails_e9c1ad35d8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY violations
    ADD CONSTRAINT fk_rails_e9c1ad35d8 FOREIGN KEY (health_inspection_id) REFERENCES health_inspections(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO "schema_migrations" (version) VALUES
('20190720201248'),
('20190720202515'),
('20190728225908'),
('20190728232038'),
('20190729010807'),
('20190731003142'),
('20190803174158');


