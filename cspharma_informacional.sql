--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: dwh_torrecontrol; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dwh_torrecontrol;


ALTER SCHEMA dwh_torrecontrol OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Tdc_cat_estados_devolucion_pedido; Type: TABLE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE TABLE dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido" (
    "Cod_estado_devolucion" text NOT NULL,
    "Md_uuid" text NOT NULL,
    "Md_date" timestamp without time zone NOT NULL,
    "Id" integer NOT NULL,
    "Des_estado_devolucion" text
);


ALTER TABLE dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_devolucion_pedido_Id_seq; Type: SEQUENCE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE SEQUENCE dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido_Id_seq" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_devolucion_pedido_Id_seq; Type: SEQUENCE OWNED BY; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER SEQUENCE dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido_Id_seq" OWNED BY dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido"."Id";


--
-- Name: Tdc_cat_estados_envio_pedido; Type: TABLE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE TABLE dwh_torrecontrol."Tdc_cat_estados_envio_pedido" (
    "Cod_estado_envio" text NOT NULL,
    "Md_uuid" text NOT NULL,
    "Md_date" timestamp without time zone NOT NULL,
    "Id" integer NOT NULL,
    "Des_estado_envio" text
);


ALTER TABLE dwh_torrecontrol."Tdc_cat_estados_envio_pedido" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_envio_pedido_Id_seq; Type: SEQUENCE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE SEQUENCE dwh_torrecontrol."Tdc_cat_estados_envio_pedido_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh_torrecontrol."Tdc_cat_estados_envio_pedido_Id_seq" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_envio_pedido_Id_seq; Type: SEQUENCE OWNED BY; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER SEQUENCE dwh_torrecontrol."Tdc_cat_estados_envio_pedido_Id_seq" OWNED BY dwh_torrecontrol."Tdc_cat_estados_envio_pedido"."Id";


--
-- Name: Tdc_cat_estados_pago_pedido; Type: TABLE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE TABLE dwh_torrecontrol."Tdc_cat_estados_pago_pedido" (
    "Cod_estado_pago" text NOT NULL,
    "Md_uuid" text NOT NULL,
    "Md_date" timestamp without time zone NOT NULL,
    "Id" integer NOT NULL,
    "Des_estado_pago" text
);


ALTER TABLE dwh_torrecontrol."Tdc_cat_estados_pago_pedido" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_pago_pedido_Id_seq; Type: SEQUENCE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE SEQUENCE dwh_torrecontrol."Tdc_cat_estados_pago_pedido_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh_torrecontrol."Tdc_cat_estados_pago_pedido_Id_seq" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_pago_pedido_Id_seq; Type: SEQUENCE OWNED BY; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER SEQUENCE dwh_torrecontrol."Tdc_cat_estados_pago_pedido_Id_seq" OWNED BY dwh_torrecontrol."Tdc_cat_estados_pago_pedido"."Id";


--
-- Name: Tdc_cat_lineas_distribucion; Type: TABLE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE TABLE dwh_torrecontrol."Tdc_cat_lineas_distribucion" (
    "Cod_linea" text NOT NULL,
    "Md_uuid" text NOT NULL,
    "Md_date" timestamp without time zone NOT NULL,
    "Id" integer NOT NULL,
    "Cod_provincia" text NOT NULL,
    "Cod_municipio" text NOT NULL,
    "Cod_barrio" text NOT NULL
);


ALTER TABLE dwh_torrecontrol."Tdc_cat_lineas_distribucion" OWNER TO postgres;

--
-- Name: Tdc_cat_lineas_distribucion_Id_seq; Type: SEQUENCE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE SEQUENCE dwh_torrecontrol."Tdc_cat_lineas_distribucion_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh_torrecontrol."Tdc_cat_lineas_distribucion_Id_seq" OWNER TO postgres;

--
-- Name: Tdc_cat_lineas_distribucion_Id_seq; Type: SEQUENCE OWNED BY; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER SEQUENCE dwh_torrecontrol."Tdc_cat_lineas_distribucion_Id_seq" OWNED BY dwh_torrecontrol."Tdc_cat_lineas_distribucion"."Id";


--
-- Name: Tdc_tch_estado_pedidos; Type: TABLE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE TABLE dwh_torrecontrol."Tdc_tch_estado_pedidos" (
    "Id" integer NOT NULL,
    "Md_uuid" text NOT NULL,
    "Md_date" timestamp without time zone NOT NULL,
    "Cod_pedido" text NOT NULL,
    "Cod_estado_envio" text,
    "Cod_estado_pago" text,
    "Cod_estado_devolucion" text,
    "Cod_linea" text NOT NULL
);


ALTER TABLE dwh_torrecontrol."Tdc_tch_estado_pedidos" OWNER TO postgres;

--
-- Name: Tdc_tch_estado_pedidos_Id_seq; Type: SEQUENCE; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE SEQUENCE dwh_torrecontrol."Tdc_tch_estado_pedidos_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh_torrecontrol."Tdc_tch_estado_pedidos_Id_seq" OWNER TO postgres;

--
-- Name: Tdc_tch_estado_pedidos_Id_seq; Type: SEQUENCE OWNED BY; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER SEQUENCE dwh_torrecontrol."Tdc_tch_estado_pedidos_Id_seq" OWNED BY dwh_torrecontrol."Tdc_tch_estado_pedidos"."Id";


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Name: Tdc_cat_estados_devolucion_pedido Id; Type: DEFAULT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido" ALTER COLUMN "Id" SET DEFAULT nextval('dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido_Id_seq"'::regclass);


--
-- Name: Tdc_cat_estados_envio_pedido Id; Type: DEFAULT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_estados_envio_pedido" ALTER COLUMN "Id" SET DEFAULT nextval('dwh_torrecontrol."Tdc_cat_estados_envio_pedido_Id_seq"'::regclass);


--
-- Name: Tdc_cat_estados_pago_pedido Id; Type: DEFAULT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_estados_pago_pedido" ALTER COLUMN "Id" SET DEFAULT nextval('dwh_torrecontrol."Tdc_cat_estados_pago_pedido_Id_seq"'::regclass);


--
-- Name: Tdc_cat_lineas_distribucion Id; Type: DEFAULT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_lineas_distribucion" ALTER COLUMN "Id" SET DEFAULT nextval('dwh_torrecontrol."Tdc_cat_lineas_distribucion_Id_seq"'::regclass);


--
-- Name: Tdc_tch_estado_pedidos Id; Type: DEFAULT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_tch_estado_pedidos" ALTER COLUMN "Id" SET DEFAULT nextval('dwh_torrecontrol."Tdc_tch_estado_pedidos_Id_seq"'::regclass);


--
-- Data for Name: Tdc_cat_estados_devolucion_pedido; Type: TABLE DATA; Schema: dwh_torrecontrol; Owner: postgres
--

COPY dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido" ("Cod_estado_devolucion", "Md_uuid", "Md_date", "Id", "Des_estado_devolucion") FROM stdin;
\.


--
-- Data for Name: Tdc_cat_estados_envio_pedido; Type: TABLE DATA; Schema: dwh_torrecontrol; Owner: postgres
--

COPY dwh_torrecontrol."Tdc_cat_estados_envio_pedido" ("Cod_estado_envio", "Md_uuid", "Md_date", "Id", "Des_estado_envio") FROM stdin;
\.


--
-- Data for Name: Tdc_cat_estados_pago_pedido; Type: TABLE DATA; Schema: dwh_torrecontrol; Owner: postgres
--

COPY dwh_torrecontrol."Tdc_cat_estados_pago_pedido" ("Cod_estado_pago", "Md_uuid", "Md_date", "Id", "Des_estado_pago") FROM stdin;
\.


--
-- Data for Name: Tdc_cat_lineas_distribucion; Type: TABLE DATA; Schema: dwh_torrecontrol; Owner: postgres
--

COPY dwh_torrecontrol."Tdc_cat_lineas_distribucion" ("Cod_linea", "Md_uuid", "Md_date", "Id", "Cod_provincia", "Cod_municipio", "Cod_barrio") FROM stdin;
\.


--
-- Data for Name: Tdc_tch_estado_pedidos; Type: TABLE DATA; Schema: dwh_torrecontrol; Owner: postgres
--

COPY dwh_torrecontrol."Tdc_tch_estado_pedidos" ("Id", "Md_uuid", "Md_date", "Cod_pedido", "Cod_estado_envio", "Cod_estado_pago", "Cod_estado_devolucion", "Cod_linea") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20221111080413_migracion-inicial-1	7.0.0
\.


--
-- Name: Tdc_cat_estados_devolucion_pedido_Id_seq; Type: SEQUENCE SET; Schema: dwh_torrecontrol; Owner: postgres
--

SELECT pg_catalog.setval('dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido_Id_seq"', 1, false);


--
-- Name: Tdc_cat_estados_envio_pedido_Id_seq; Type: SEQUENCE SET; Schema: dwh_torrecontrol; Owner: postgres
--

SELECT pg_catalog.setval('dwh_torrecontrol."Tdc_cat_estados_envio_pedido_Id_seq"', 1, false);


--
-- Name: Tdc_cat_estados_pago_pedido_Id_seq; Type: SEQUENCE SET; Schema: dwh_torrecontrol; Owner: postgres
--

SELECT pg_catalog.setval('dwh_torrecontrol."Tdc_cat_estados_pago_pedido_Id_seq"', 1, false);


--
-- Name: Tdc_cat_lineas_distribucion_Id_seq; Type: SEQUENCE SET; Schema: dwh_torrecontrol; Owner: postgres
--

SELECT pg_catalog.setval('dwh_torrecontrol."Tdc_cat_lineas_distribucion_Id_seq"', 1, false);


--
-- Name: Tdc_tch_estado_pedidos_Id_seq; Type: SEQUENCE SET; Schema: dwh_torrecontrol; Owner: postgres
--

SELECT pg_catalog.setval('dwh_torrecontrol."Tdc_tch_estado_pedidos_Id_seq"', 1, false);


--
-- Name: Tdc_cat_estados_devolucion_pedido PK_Tdc_cat_estados_devolucion_pedido; Type: CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido"
    ADD CONSTRAINT "PK_Tdc_cat_estados_devolucion_pedido" PRIMARY KEY ("Cod_estado_devolucion");


--
-- Name: Tdc_cat_estados_envio_pedido PK_Tdc_cat_estados_envio_pedido; Type: CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_estados_envio_pedido"
    ADD CONSTRAINT "PK_Tdc_cat_estados_envio_pedido" PRIMARY KEY ("Cod_estado_envio");


--
-- Name: Tdc_cat_estados_pago_pedido PK_Tdc_cat_estados_pago_pedido; Type: CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_estados_pago_pedido"
    ADD CONSTRAINT "PK_Tdc_cat_estados_pago_pedido" PRIMARY KEY ("Cod_estado_pago");


--
-- Name: Tdc_cat_lineas_distribucion PK_Tdc_cat_lineas_distribucion; Type: CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_cat_lineas_distribucion"
    ADD CONSTRAINT "PK_Tdc_cat_lineas_distribucion" PRIMARY KEY ("Cod_linea");


--
-- Name: Tdc_tch_estado_pedidos PK_Tdc_tch_estado_pedidos; Type: CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_tch_estado_pedidos"
    ADD CONSTRAINT "PK_Tdc_tch_estado_pedidos" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_Tdc_tch_estado_pedidos_Cod_estado_devolucion; Type: INDEX; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE INDEX "IX_Tdc_tch_estado_pedidos_Cod_estado_devolucion" ON dwh_torrecontrol."Tdc_tch_estado_pedidos" USING btree ("Cod_estado_devolucion");


--
-- Name: IX_Tdc_tch_estado_pedidos_Cod_estado_envio; Type: INDEX; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE INDEX "IX_Tdc_tch_estado_pedidos_Cod_estado_envio" ON dwh_torrecontrol."Tdc_tch_estado_pedidos" USING btree ("Cod_estado_envio");


--
-- Name: IX_Tdc_tch_estado_pedidos_Cod_estado_pago; Type: INDEX; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE INDEX "IX_Tdc_tch_estado_pedidos_Cod_estado_pago" ON dwh_torrecontrol."Tdc_tch_estado_pedidos" USING btree ("Cod_estado_pago");


--
-- Name: IX_Tdc_tch_estado_pedidos_Cod_linea; Type: INDEX; Schema: dwh_torrecontrol; Owner: postgres
--

CREATE INDEX "IX_Tdc_tch_estado_pedidos_Cod_linea" ON dwh_torrecontrol."Tdc_tch_estado_pedidos" USING btree ("Cod_linea");


--
-- Name: Tdc_tch_estado_pedidos FK_Tdc_tch_estado_pedidos_Tdc_cat_estados_devolucion_pedido_Co~; Type: FK CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_tch_estado_pedidos"
    ADD CONSTRAINT "FK_Tdc_tch_estado_pedidos_Tdc_cat_estados_devolucion_pedido_Co~" FOREIGN KEY ("Cod_estado_devolucion") REFERENCES dwh_torrecontrol."Tdc_cat_estados_devolucion_pedido"("Cod_estado_devolucion");


--
-- Name: Tdc_tch_estado_pedidos FK_Tdc_tch_estado_pedidos_Tdc_cat_estados_envio_pedido_Cod_est~; Type: FK CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_tch_estado_pedidos"
    ADD CONSTRAINT "FK_Tdc_tch_estado_pedidos_Tdc_cat_estados_envio_pedido_Cod_est~" FOREIGN KEY ("Cod_estado_envio") REFERENCES dwh_torrecontrol."Tdc_cat_estados_envio_pedido"("Cod_estado_envio");


--
-- Name: Tdc_tch_estado_pedidos FK_Tdc_tch_estado_pedidos_Tdc_cat_estados_pago_pedido_Cod_esta~; Type: FK CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_tch_estado_pedidos"
    ADD CONSTRAINT "FK_Tdc_tch_estado_pedidos_Tdc_cat_estados_pago_pedido_Cod_esta~" FOREIGN KEY ("Cod_estado_pago") REFERENCES dwh_torrecontrol."Tdc_cat_estados_pago_pedido"("Cod_estado_pago");


--
-- Name: Tdc_tch_estado_pedidos FK_Tdc_tch_estado_pedidos_Tdc_cat_lineas_distribucion_Cod_linea; Type: FK CONSTRAINT; Schema: dwh_torrecontrol; Owner: postgres
--

ALTER TABLE ONLY dwh_torrecontrol."Tdc_tch_estado_pedidos"
    ADD CONSTRAINT "FK_Tdc_tch_estado_pedidos_Tdc_cat_lineas_distribucion_Cod_linea" FOREIGN KEY ("Cod_linea") REFERENCES dwh_torrecontrol."Tdc_cat_lineas_distribucion"("Cod_linea") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

