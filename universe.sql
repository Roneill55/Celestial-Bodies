--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth_in_ly integer,
    diameter_in_ly integer NOT NULL,
    other_names text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    discovery_date integer,
    fun_facts text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    orbit_length_in_days numeric(6,1) NOT NULL,
    earth_mass numeric(6,1) NOT NULL,
    is_it_in_the_milky_way_galaxy boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    name character varying(30) NOT NULL,
    discoverer text NOT NULL,
    number_of_known_planets integer,
    solar_system_id integer NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    galaxy_id integer,
    constellation character varying(30),
    does_it_have_planets boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2480000, 200000, 'M31');
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Spiral', NULL, 150000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 'Spiral', 31000000, 60000, 'M51');
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'Spiral', 17000000, 52962, 'Black Eye Galaxy, Evil Eye Galaxy, M64, NGC 4826, PGC 44182, UGC 8062');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 29000000, 50000, 'NGC 4594, M104');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 3000000, 50000, 'M33, NGC 598');
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'Spiral', 21000000, 170000, 'M101, NGC 5457');
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Spiral', 163000, 14000, 'LMC');
INSERT INTO public.galaxy VALUES (9, 'Cartwheel', 'Irregular', 500000000, 130000, 'ESO 350-40, PGC 2248');
INSERT INTO public.galaxy VALUES (10, 'Bodes Galaxy', 'Spiral', 11600000, 90000, 'NGC 3031, M81');
INSERT INTO public.galaxy VALUES (11, 'Cigar', 'Irregular', 11420000, 37000, 'M82');
INSERT INTO public.galaxy VALUES (12, 'Sunflower', 'Spiral', 27000000, 98000, 'M63');
INSERT INTO public.galaxy VALUES (13, 'Tadpole', 'Spiral', 420000000, 390000, 'UGC 10214, Arp 188');
INSERT INTO public.galaxy VALUES (14, 'Fireworks', 'Spiral', 27000000, 98000, 'NGC 6946');
INSERT INTO public.galaxy VALUES (15, 'Virgo A', 'Elliptical', 53490000, 120000, 'M87, NGC4486');
INSERT INTO public.galaxy VALUES (16, 'Needle', 'Spiral', 38490000, 250000, 'NGC 4565, Caldwell 38');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Naiad', 10, 1989, 'It is most likely made up of fragments of Neptunes orginal satellites and may eventually crash into Neptunes atmosphere or be torn apart and form a planetary ring.');
INSERT INTO public.moon VALUES (2, 'Mimas', 3, 1789, 'It is the smallest and innermost of Saturns major moons. Most of the Mimas surface is saturated with impact craters ranging in size up to greater than 25 miles in diameter.');
INSERT INTO public.moon VALUES (3, 'The Moon', 1, NULL, 'The fifth-largest moon in the solar system. Earths moon is the only place beyond Earth where humans have set foot.');
INSERT INTO public.moon VALUES (4, 'Deimos', 6, 1877, 'Deimos is a small and lumpy and heavily cratered object. It is a dark body that appears to be composed of C-type materials similar to that of asteroids found in the outer asteroid belt.');
INSERT INTO public.moon VALUES (5, 'Triton', 10, 1846, 'Triton is the largest of Neptunes 13 moons. It is unusual because it is the only large moon in our solar system that orbits in the opposite direction of its planets rotation-a retrograde orbit.');
INSERT INTO public.moon VALUES (6, 'Europa', 4, 1610, 'Europas surface is made of ice so it reflects 5.5 times the sunlight than Earths moon does.');
INSERT INTO public.moon VALUES (7, 'Larissa', 10, 1981, 'Larissa is irregularly shaped and heavily cratered. Larissas orbit is mostly circular but it is slowly spiraling inward and may eventually impact Neptunes atmosphere or the gas giants tidal forces may break Larissa apart to form a planetary ring.');
INSERT INTO public.moon VALUES (8, 'Tethys', 3, 1684, 'Tethys is saturns fifth-largest moon. It has a density of 0.97 times that of liquid water which suggests that it is composed almost entirely of water and ice plus a small amount of rock.');
INSERT INTO public.moon VALUES (9, 'Callisto', 4, 1610, 'Jupiters second-largest moon and the third-largest moon in our solar system. Its surface is the most heavily cratered of any object in our solar system.');
INSERT INTO public.moon VALUES (10, 'Phobos', 6, 1877, 'It orbits Mars three times a day and is so close the the planets surface that in some locations on Mars it cannot always be seen.');
INSERT INTO public.moon VALUES (11, 'Amalthea', 4, 1892, 'Amalthea is the reddest object in the solar system and it appears to give out more heat thatn it receives from the sun.');
INSERT INTO public.moon VALUES (12, 'Thebe', 4, 1979, 'Thebe is one of the four known small moons that orbit closer to Jupiter than the four vastly larger Galilean moons.');
INSERT INTO public.moon VALUES (44, 'Lo', 4, 1610, 'Los volcanic activity is the highest in the entire solar system. It is in constant motion with a surface covered in plains of liquid rock and lakes filled with lava.');
INSERT INTO public.moon VALUES (45, 'Titania', 12, 1787, 'Titania orbits Uranus in an almost perfectly circular orbit and has a carbon dioxide atmosphere.');
INSERT INTO public.moon VALUES (46, 'Ariel', 12, 1851, 'Ariel is also thought to have had the most recent geologic activity of the larger moons of Uranus. It is transected by grabens which are fault-bonded valleys.');
INSERT INTO public.moon VALUES (47, 'Cressida', 12, 1986, 'Cressida is one of the small and inner moons of Uranus. Little is known about it other than its sizze and orbital characteristics. Based on its low albedo its surface probably consists of the dark and unprocessed and carbon-rich material found on the C-class of asteroids.');
INSERT INTO public.moon VALUES (48, 'Oberon', 12, 1787, 'Oberon is heavily cratered especially when compared to the three other moons of Uranus.');
INSERT INTO public.moon VALUES (49, 'Telesto', 3, 1980, 'Telesto is known as a Tethys Trojan because together with Calypso it circles Saturn in the same orbit as the moon named Tethys.');
INSERT INTO public.moon VALUES (50, 'Despina', 10, 1989, 'Despina is a tiny moon located within Neptunes faint ring system. The irregularly-shaped moon orbits Neptune every eight hours and circles it in the same direction as this planets own orbit.');
INSERT INTO public.moon VALUES (51, 'Hippocamp', 10, 2013, 'This moon is so small and dim that it is roughly 100 million times fainter than the faintest star that can be seen with the naked eye.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 11, 365.0, 1.0, true);
INSERT INTO public.planet VALUES (2, 'Barnards Star b', 2, 232.8, 53284.8, false);
INSERT INTO public.planet VALUES (3, 'Saturn', 11, 10585.0, 95.2, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 11, 4380.0, 6.0, true);
INSERT INTO public.planet VALUES (5, 'GJ 273 c', 9, 4.7, 1.2, false);
INSERT INTO public.planet VALUES (6, 'Mars', 11, 687.0, 6.0, true);
INSERT INTO public.planet VALUES (7, 'YZ Ceti b', 12, 2.0, 0.7, false);
INSERT INTO public.planet VALUES (8, 'Venus', 11, 225.0, 6.0, true);
INSERT INTO public.planet VALUES (9, 'Tau Ceti g', 4, 20.0, 1.8, false);
INSERT INTO public.planet VALUES (10, 'Neptune', 11, 60225.0, 6.0, true);
INSERT INTO public.planet VALUES (11, 'Mercury', 11, 88.0, 0.1, true);
INSERT INTO public.planet VALUES (12, 'Uranus', 11, 30660.0, 14.5, true);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES ('51 Pegasi', 'M. Mayor, D. Queloz', 1, 1);
INSERT INTO public.solar_system VALUES ('Sol', 'W. Herschel, J.C. Adams, U.J. LeVerrier', 8, 2);
INSERT INTO public.solar_system VALUES ('70 Virginis', 'G. Marcy, R.P. Butler', 1, 3);
INSERT INTO public.solar_system VALUES ('47 Ursae Majoris', 'G. Marcy, R.P. Butler, D.A. Fischer', 2, 4);
INSERT INTO public.solar_system VALUES ('HD114762', 'D. Latham', 1, 5);
INSERT INTO public.solar_system VALUES ('55rho1 Cancri A', 'B. McArthur, G. Marcy, R.P. Butler, D. Fischer', 5, 6);
INSERT INTO public.solar_system VALUES ('Upsilon Andromedae', 'G.W. Marcy, R.P. Butler', 3, 7);
INSERT INTO public.solar_system VALUES ('16 Cygni B', 'B. Cochran, A. Hatzes, G. Marcy, R.P. Butler', 1, 8);
INSERT INTO public.solar_system VALUES ('14 Herculis', 'M. Mayor, D. Queloz', 1, 9);
INSERT INTO public.solar_system VALUES ('HD82943', 'M. Mayor', 2, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Cor Caroli', 2, 'Canes Venatici', true, 1);
INSERT INTO public.star VALUES ('Barnards Star', 5, 'Ophiucus', true, 2);
INSERT INTO public.star VALUES ('Sirius', 5, 'Canis Major', false, 3);
INSERT INTO public.star VALUES ('Tau Ceti', 5, 'Cetus', true, 4);
INSERT INTO public.star VALUES ('Delta Pavonis', 5, 'Pavo', false, 5);
INSERT INTO public.star VALUES ('Alpheratz', 1, 'Andromeda', false, 7);
INSERT INTO public.star VALUES ('Altair', 5, 'Aquila', false, 8);
INSERT INTO public.star VALUES ('Luytens Star', 5, 'Canis Minor', true, 9);
INSERT INTO public.star VALUES ('Van Maanens Star', 5, 'Pisces', false, 10);
INSERT INTO public.star VALUES ('Sol', 5, NULL, true, 11);
INSERT INTO public.star VALUES ('YZ Ceti', 5, 'Cetus ', true, 12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 17, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 51, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_other_names_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_other_names_key UNIQUE (other_names);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_fun_facts_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fun_facts_key UNIQUE (fun_facts);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_constellation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_key UNIQUE (constellation);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
