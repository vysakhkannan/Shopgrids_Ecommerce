--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO vysakhkannan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO vysakhkannan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO vysakhkannan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO vysakhkannan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO vysakhkannan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO vysakhkannan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: cart_cartitems; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.cart_cartitems (
    id bigint NOT NULL,
    anonymous_user character varying(50) NOT NULL,
    quantity integer,
    is_active boolean NOT NULL,
    products_id_id bigint NOT NULL,
    user_id bigint,
    sub_total integer,
    buy_now boolean NOT NULL
);


ALTER TABLE public.cart_cartitems OWNER TO vysakhkannan;

--
-- Name: cart_cartitems_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.cart_cartitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cartitems_id_seq OWNER TO vysakhkannan;

--
-- Name: cart_cartitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.cart_cartitems_id_seq OWNED BY public.cart_cartitems.id;


--
-- Name: cart_order; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.cart_order (
    id bigint NOT NULL,
    order_id character varying(50) NOT NULL,
    payment_method character varying(50) NOT NULL,
    delivered_address character varying(200) NOT NULL,
    delivery_status character varying(50) NOT NULL,
    user_id bigint NOT NULL,
    payment_status character varying(50) NOT NULL,
    grand_total integer,
    ordered_date date
);


ALTER TABLE public.cart_order OWNER TO vysakhkannan;

--
-- Name: cart_order_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.cart_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_order_id_seq OWNER TO vysakhkannan;

--
-- Name: cart_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.cart_order_id_seq OWNED BY public.cart_order.id;


--
-- Name: cart_orderitems; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.cart_orderitems (
    id bigint NOT NULL,
    anonymous_user character varying(50) NOT NULL,
    quantity integer,
    sub_total integer,
    is_active boolean NOT NULL,
    order_id bigint NOT NULL,
    products_id_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart_orderitems OWNER TO vysakhkannan;

--
-- Name: cart_orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.cart_orderitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_orderitems_id_seq OWNER TO vysakhkannan;

--
-- Name: cart_orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.cart_orderitems_id_seq OWNED BY public.cart_orderitems.id;


--
-- Name: cart_payment; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.cart_payment (
    id bigint NOT NULL,
    payment_id character varying(100) NOT NULL,
    payment_method character varying(50) NOT NULL,
    amount_paid integer,
    status character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    order_id bigint
);


ALTER TABLE public.cart_payment OWNER TO vysakhkannan;

--
-- Name: cart_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.cart_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_payment_id_seq OWNER TO vysakhkannan;

--
-- Name: cart_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.cart_payment_id_seq OWNED BY public.cart_payment.id;


--
-- Name: cart_useraddress; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.cart_useraddress (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    city character varying(50) NOT NULL,
    post_code integer,
    country character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart_useraddress OWNER TO vysakhkannan;

--
-- Name: cart_useraddress_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.cart_useraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_useraddress_id_seq OWNER TO vysakhkannan;

--
-- Name: cart_useraddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.cart_useraddress_id_seq OWNED BY public.cart_useraddress.id;


--
-- Name: cart_wishlist; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.cart_wishlist (
    id bigint NOT NULL,
    is_active boolean NOT NULL,
    products_id_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.cart_wishlist OWNER TO vysakhkannan;

--
-- Name: cart_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.cart_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_wishlist_id_seq OWNER TO vysakhkannan;

--
-- Name: cart_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.cart_wishlist_id_seq OWNED BY public.cart_wishlist.id;


--
-- Name: categorymanagement_category; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.categorymanagement_category (
    id bigint NOT NULL,
    category_name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    expiry_date date,
    offer_name character varying(200),
    offer_percent integer,
    offer_status character varying(100)
);


ALTER TABLE public.categorymanagement_category OWNER TO vysakhkannan;

--
-- Name: categorymanagement_category_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.categorymanagement_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorymanagement_category_id_seq OWNER TO vysakhkannan;

--
-- Name: categorymanagement_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.categorymanagement_category_id_seq OWNED BY public.categorymanagement_category.id;


--
-- Name: categorymanagement_offer; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.categorymanagement_offer (
    id bigint NOT NULL,
    offer_name character varying(100),
    offer_percent integer NOT NULL,
    expiry_date date NOT NULL,
    offer_status character varying(100),
    expiry_time time without time zone
);


ALTER TABLE public.categorymanagement_offer OWNER TO vysakhkannan;

--
-- Name: categorymanagement_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.categorymanagement_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorymanagement_offer_id_seq OWNER TO vysakhkannan;

--
-- Name: categorymanagement_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.categorymanagement_offer_id_seq OWNED BY public.categorymanagement_offer.id;


--
-- Name: categorymanagement_subcategory; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.categorymanagement_subcategory (
    id bigint NOT NULL,
    sub_category_name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    catergory_id_id bigint NOT NULL
);


ALTER TABLE public.categorymanagement_subcategory OWNER TO vysakhkannan;

--
-- Name: categorymanagement_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.categorymanagement_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorymanagement_subcategory_id_seq OWNER TO vysakhkannan;

--
-- Name: categorymanagement_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.categorymanagement_subcategory_id_seq OWNED BY public.categorymanagement_subcategory.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO vysakhkannan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO vysakhkannan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO vysakhkannan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO vysakhkannan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO vysakhkannan;

--
-- Name: productmanagement_banner; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.productmanagement_banner (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_banner OWNER TO vysakhkannan;

--
-- Name: productmanagement_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.productmanagement_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_banner_id_seq OWNER TO vysakhkannan;

--
-- Name: productmanagement_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.productmanagement_banner_id_seq OWNED BY public.productmanagement_banner.id;


--
-- Name: productmanagement_coupon; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.productmanagement_coupon (
    id bigint NOT NULL,
    coupon_id character varying(50) NOT NULL,
    coupon_name character varying(50) NOT NULL,
    coupon_percent integer NOT NULL,
    coupon_status boolean NOT NULL,
    expiry_date date,
    expiry_time time without time zone
);


ALTER TABLE public.productmanagement_coupon OWNER TO vysakhkannan;

--
-- Name: productmanagement_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.productmanagement_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_coupon_id_seq OWNER TO vysakhkannan;

--
-- Name: productmanagement_coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.productmanagement_coupon_id_seq OWNED BY public.productmanagement_coupon.id;


--
-- Name: productmanagement_expiredcoupon; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.productmanagement_expiredcoupon (
    id bigint NOT NULL,
    coupon_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_expiredcoupon OWNER TO vysakhkannan;

--
-- Name: productmanagement_expiredcoupon_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.productmanagement_expiredcoupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_expiredcoupon_id_seq OWNER TO vysakhkannan;

--
-- Name: productmanagement_expiredcoupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.productmanagement_expiredcoupon_id_seq OWNED BY public.productmanagement_expiredcoupon.id;


--
-- Name: productmanagement_imagegallery; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.productmanagement_imagegallery (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    product_id_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_imagegallery OWNER TO vysakhkannan;

--
-- Name: productmanagement_imagegallery_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.productmanagement_imagegallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_imagegallery_id_seq OWNER TO vysakhkannan;

--
-- Name: productmanagement_imagegallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.productmanagement_imagegallery_id_seq OWNED BY public.productmanagement_imagegallery.id;


--
-- Name: productmanagement_products; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.productmanagement_products (
    id bigint NOT NULL,
    product_name character varying(200) NOT NULL,
    slug character varying(250) NOT NULL,
    description text NOT NULL,
    mrp double precision NOT NULL,
    sale_price integer NOT NULL,
    stocks integer NOT NULL,
    is_available boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    sub_category_id bigint NOT NULL,
    product_cover character varying(100) NOT NULL,
    old_sale_price integer,
    expiry_date date,
    offer_name character varying(200),
    offer_percent integer,
    offer_status character varying(100),
    offer_applied character varying(200),
    category_id bigint
);


ALTER TABLE public.productmanagement_products OWNER TO vysakhkannan;

--
-- Name: productmanagement_products_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.productmanagement_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_products_id_seq OWNER TO vysakhkannan;

--
-- Name: productmanagement_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.productmanagement_products_id_seq OWNED BY public.productmanagement_products.id;


--
-- Name: useraccount_accounts; Type: TABLE; Schema: public; Owner: vysakhkannan
--

CREATE TABLE public.useraccount_accounts (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_joined timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superadmin boolean NOT NULL,
    wallet_amount integer,
    referral_code character varying(50)
);


ALTER TABLE public.useraccount_accounts OWNER TO vysakhkannan;

--
-- Name: useraccount_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: vysakhkannan
--

CREATE SEQUENCE public.useraccount_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.useraccount_accounts_id_seq OWNER TO vysakhkannan;

--
-- Name: useraccount_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vysakhkannan
--

ALTER SEQUENCE public.useraccount_accounts_id_seq OWNED BY public.useraccount_accounts.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: cart_cartitems id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_cartitems ALTER COLUMN id SET DEFAULT nextval('public.cart_cartitems_id_seq'::regclass);


--
-- Name: cart_order id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_order ALTER COLUMN id SET DEFAULT nextval('public.cart_order_id_seq'::regclass);


--
-- Name: cart_orderitems id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_orderitems ALTER COLUMN id SET DEFAULT nextval('public.cart_orderitems_id_seq'::regclass);


--
-- Name: cart_payment id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_payment ALTER COLUMN id SET DEFAULT nextval('public.cart_payment_id_seq'::regclass);


--
-- Name: cart_useraddress id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_useraddress ALTER COLUMN id SET DEFAULT nextval('public.cart_useraddress_id_seq'::regclass);


--
-- Name: cart_wishlist id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_wishlist ALTER COLUMN id SET DEFAULT nextval('public.cart_wishlist_id_seq'::regclass);


--
-- Name: categorymanagement_category id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_category ALTER COLUMN id SET DEFAULT nextval('public.categorymanagement_category_id_seq'::regclass);


--
-- Name: categorymanagement_offer id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_offer ALTER COLUMN id SET DEFAULT nextval('public.categorymanagement_offer_id_seq'::regclass);


--
-- Name: categorymanagement_subcategory id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_subcategory ALTER COLUMN id SET DEFAULT nextval('public.categorymanagement_subcategory_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: productmanagement_banner id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_banner ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_banner_id_seq'::regclass);


--
-- Name: productmanagement_coupon id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_coupon ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_coupon_id_seq'::regclass);


--
-- Name: productmanagement_expiredcoupon id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_expiredcoupon_id_seq'::regclass);


--
-- Name: productmanagement_imagegallery id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_imagegallery ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_imagegallery_id_seq'::regclass);


--
-- Name: productmanagement_products id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_products ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_products_id_seq'::regclass);


--
-- Name: useraccount_accounts id; Type: DEFAULT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.useraccount_accounts ALTER COLUMN id SET DEFAULT nextval('public.useraccount_accounts_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add accounts	5	add_accounts
18	Can change accounts	5	change_accounts
19	Can delete accounts	5	delete_accounts
20	Can view accounts	5	view_accounts
21	Can add sub category	6	add_subcategory
22	Can change sub category	6	change_subcategory
23	Can delete sub category	6	delete_subcategory
24	Can view sub category	6	view_subcategory
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add products	8	add_products
30	Can change products	8	change_products
31	Can delete products	8	delete_products
32	Can view products	8	view_products
33	Can add image gallery	9	add_imagegallery
34	Can change image gallery	9	change_imagegallery
35	Can delete image gallery	9	delete_imagegallery
36	Can view image gallery	9	view_imagegallery
37	Can add cart	10	add_cart
38	Can change cart	10	change_cart
39	Can delete cart	10	delete_cart
40	Can view cart	10	view_cart
41	Can add cart items	11	add_cartitems
42	Can change cart items	11	change_cartitems
43	Can delete cart items	11	delete_cartitems
44	Can view cart items	11	view_cartitems
45	Can add user address	12	add_useraddress
46	Can change user address	12	change_useraddress
47	Can delete user address	12	delete_useraddress
48	Can view user address	12	view_useraddress
49	Can add order	13	add_order
50	Can change order	13	change_order
51	Can delete order	13	delete_order
52	Can view order	13	view_order
53	Can add order items	14	add_orderitems
54	Can change order items	14	change_orderitems
55	Can delete order items	14	delete_orderitems
56	Can view order items	14	view_orderitems
57	Can add banner	15	add_banner
58	Can change banner	15	change_banner
59	Can delete banner	15	delete_banner
60	Can view banner	15	view_banner
61	Can add payment	16	add_payment
62	Can change payment	16	change_payment
63	Can delete payment	16	delete_payment
64	Can view payment	16	view_payment
65	Can add payment	17	add_payment
66	Can change payment	17	change_payment
67	Can delete payment	17	delete_payment
68	Can view payment	17	view_payment
69	Can add payment	18	add_payment
70	Can change payment	18	change_payment
71	Can delete payment	18	delete_payment
72	Can view payment	18	view_payment
73	Can add category offer	19	add_categoryoffer
74	Can change category offer	19	change_categoryoffer
75	Can delete category offer	19	delete_categoryoffer
76	Can view category offer	19	view_categoryoffer
77	Can add offer	20	add_offer
78	Can change offer	20	change_offer
79	Can delete offer	20	delete_offer
80	Can view offer	20	view_offer
81	Can add coupon	21	add_coupon
82	Can change coupon	21	change_coupon
83	Can delete coupon	21	delete_coupon
84	Can view coupon	21	view_coupon
85	Can add expired coupon	22	add_expiredcoupon
86	Can change expired coupon	22	change_expiredcoupon
87	Can delete expired coupon	22	delete_expiredcoupon
88	Can view expired coupon	22	view_expiredcoupon
89	Can add wishlist	23	add_wishlist
90	Can change wishlist	23	change_wishlist
91	Can delete wishlist	23	delete_wishlist
92	Can view wishlist	23	view_wishlist
\.


--
-- Data for Name: cart_cartitems; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.cart_cartitems (id, anonymous_user, quantity, is_active, products_id_id, user_id, sub_total, buy_now) FROM stdin;
559		1	t	35	14	25000	t
562		1	t	35	14	25000	t
571		1	t	35	17	25000	f
\.


--
-- Data for Name: cart_order; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.cart_order (id, order_id, payment_method, delivered_address, delivery_status, user_id, payment_status, grand_total, ordered_date) FROM stdin;
65	a66bba0a-21bd-43b7-ad6f-d032e074ff8b	razor_pay	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	1000	2021-12-01
66	467b8cbb-e269-4426-a350-3f5c9c0c5cd5	razor_pay	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	1000	2021-12-01
67	283f2c4c-1e79-4b4b-b169-9dcf74eb8605	PayPal	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	cancelled	14	COMPLETED	66424	2021-12-01
68	a29ec38d-a8fc-4e31-b306-1c23beaa9094	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	10	2021-12-01
69	7811a8f1-3082-4432-86e5-37e0c141ba8a	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	33423	2021-12-01
70	edcfcf8b-16ae-4a9c-9fa0-ceac566ebfc0	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	33423	2021-12-01
71	5dc8a768-9251-43e2-baa2-bab6d425778a	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	33423	2021-12-01
73	08bb8b8f-0ce1-4321-a490-183d6e52d8a6	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	10009	2021-12-01
74	f1f19ed1-f602-47b7-bdfb-4950b612f568	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	33423	2021-12-01
76	06d14a44-dae9-4554-b575-1816edf20b63	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	7288	2021-12-04
77	03a18718-019a-48ae-81de-3fbc8952a3b5	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	10358	2021-12-06
79	cee013bf-b88d-47ea-9b1a-26fd4f2e5ac4	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	157	2021-12-06
81	b5dbdd9e-3a0f-4b51-ae39-a22c5e359312	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	2284	2021-12-06
82	d1ea9fd2-2d4b-4cf8-8168-b5ae1cec095a	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	2742	2021-12-07
83	fffa1e6b-00ca-427c-be81-5b38c5eb4729	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	78	2021-12-07
85	1f2e958f-c4f1-494e-a30b-1c69d0273382	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	4825	2021-12-07
86	a7c10ec8-4d4c-4c16-868e-358b570077a4	cash_on_delivery	dfgdfgdf, \ndvgfgsfdgdfgdfgdf\ntamilnadu, 324324\nsdffsdfsdf ,\n3222324234	ordered	24	pending	8080	2021-12-07
88	c8a7b828-e428-4acd-a51c-10c64aae5ccd	wallet_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	2224	2021-12-08
90	27de4624-50af-4906-b114-f20abbc5b6b2	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	4673	2021-12-08
91	dc83657e-25d8-434f-8a03-5b85741fa96f	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	157	2021-12-08
93	5579fec4-a4a2-400a-b15b-ba90461ba979	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	157	2021-12-08
72	d998b9a2-67cc-4004-b018-3f368555cb86	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	10	2021-12-09
62	11fced43-0e7f-433f-a09e-c84a7e877461	PayPal	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	COMPLETED	10009	2021-12-09
63	9d6d56a0-6abc-4a22-bca9-2de46c970448	cash_on_delivery	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	10	2021-12-10
64	034d4c38-ae1a-4da8-8f71-fa6da309adbf	razor_pay	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	1000	2021-12-10
92	dfc93a11-7f91-4e75-a523-0a5ff9e30a52	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	157	2021-12-10
89	aee87d31-9276-42a7-9953-044e279f5c8f	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	147	2021-12-10
87	21ea53f8-8a7f-40f6-9a6b-6191eb3d1520	wallet_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	2753	2021-12-10
84	411e1511-7863-4986-8d09-ea5b059abf26	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	COMPLETED	157	2021-12-10
78	26e15e1f-7c5d-40c4-8b2e-7b6d1697caf8	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	32758	2021-12-10
75	6aa2d56e-dc69-4a59-bfcb-c4a6b718a61b	PayPal	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	COMPLETED	10	2021-12-10
96	bac63905-460a-4a15-8099-c5c9847e362b	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	6094	2021-12-09
61	b640ea3d-7c36-43e9-a4de-52d620884095	cash_on_delivery	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	cancelled	14	pending	10	2021-12-09
98	c70f3ef4-1780-4a55-a954-e13eae9312fd	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	6924	2021-12-10
99	1148feaf-4a8c-489d-95a0-5fe8a54c8cbe	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	3423	2021-12-10
97	f1ab3468-88ee-46a5-a2c4-78f0a91a6f46	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	17732	2021-12-10
95	7400083a-3050-4dc9-ad2c-611482504ec5	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	6326	2021-12-10
94	6e28bf19-c2b6-4628-9a8b-def3b3814456	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	6094	2021-12-10
80	fbdf0c5d-ce29-4905-a534-a33335e72e0c	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	delivered	14	pending	2753	2021-12-10
100	3dd0598f-faec-4d24-93a8-96cfc7d299c2	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	19000	2021-12-11
101	58d9f44a-fbed-4bd5-ab75-f4156d7ba728	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	8999	2021-12-11
102	02740ef5-de72-48a3-9e6c-bf50ae035e7f	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	8999	2021-12-11
103	ee09d040-cbfa-445f-874c-9edb46f89638	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	47000	2021-12-11
104	86f65b20-5fe4-4831-8229-f705589d0b46	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	8999	2021-12-11
105	0383861f-db37-4eb1-ac30-72197de04792	razor_pay	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	COMPLETED	25000	2021-12-11
106	39646859-aae2-495e-adac-f5c553ef6fdb	cash_on_delivery	adarsh, \nCarnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030\nkerala, 682030\nIndia ,\n+919400973003	ordered	14	pending	8999	2021-12-11
107	5e731a42-96d4-42e0-bb95-4d7fe766f378	PayPal	Vysakh, \nCarnival Infopark Phase I, Infopark Campus, Infopark,\ntamilnadu, 682030\nIndia ,\n9400973003	cancelled	17	COMPLETED	33999	2021-12-11
108	dae0cd63-556e-4a03-910c-e6103a809bac	cash_on_delivery	Vishnu, \nMaravettickal (h), K.S Mangalam (P.O), Vaikom\nkerala, 686608\nIndia ,\n8086948500	cancelled	17	pending	188000	2021-12-11
109	34a48eec-84e0-4c08-a2a7-0de52b0f125c	razor_pay	Vijayan, \nChakarapanthal (h), kakkanad (p.o), vaikom\nkerala, 685475\nIndia ,\n7894561235	ordered	17	COMPLETED	95000	2021-12-12
\.


--
-- Data for Name: cart_orderitems; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.cart_orderitems (id, anonymous_user, quantity, sub_total, is_active, order_id, products_id_id, user_id) FROM stdin;
60		1	9999	t	62	10	14
69		1	9999	t	69	10	14
71		1	9999	t	70	10	14
73		1	9999	t	71	10	14
75		1	9999	t	73	10	14
77		1	9999	t	74	10	14
80		1	7288	t	76	10	14
81		2	10358	t	77	9	14
83		1	5484	t	78	9	14
85		1	25000	t	78	35	14
88		1	2596	t	80	10	14
89		1	2596	t	81	10	14
90		1	5484	t	82	9	14
93		1	5484	t	85	9	14
94		1	2596	t	86	10	24
95		1	5484	t	86	9	24
97		1	2596	t	87	10	14
101		1	2596	t	90	10	14
105		1	6094	t	94	9	14
106		1	6094	t	95	9	14
108		1	6094	t	96	9	14
110		1	17500	t	97	35	14
113		1	47000	t	104	42	14
114		1	23000	t	104	41	14
115		1	23000	t	104	41	14
116		3	8999	t	104	10	14
117		1	47000	t	104	42	14
118		1	47000	t	104	40	14
119		1	23000	t	104	41	14
120		1	8999	t	106	10	14
121		1	25000	t	107	35	17
122		1	8999	t	107	10	17
123		4	188000	t	108	40	17
124		1	25000	t	109	35	17
125		1	47000	t	109	42	17
126		1	23000	t	109	41	17
\.


--
-- Data for Name: cart_payment; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.cart_payment (id, payment_id, payment_method, amount_paid, status, user_id, order_id) FROM stdin;
30		cash_on_delivery	10	ordered	14	61
31	04J536253H268990G	PayPal	10009	COMPLETED	14	62
32		cash_on_delivery	10	ordered	14	63
33	682417071C020494C	PayPal	66424	COMPLETED	14	67
34	order_ISE2UuLP2t1xvV	cash_on_delivery	10	ordered	14	68
35	order_ISEAW9qMlgzl2b	razor_pay	33423	ordered	14	71
36	0	cash_on_delivery	10	ordered	14	72
37	7YY549753K947200M	PayPal	10009	COMPLETED	14	73
38	22R021451R065315Y	PayPal	33423	COMPLETED	14	74
39	2CD13544SS7002947	PayPal	10	COMPLETED	14	75
40	42283159GK603413E	PayPal	7288	COMPLETED	14	76
41	81N30960N7568522G	PayPal	10358	COMPLETED	14	77
42	0	cash_on_delivery	32758	ordered	14	78
43	0	cash_on_delivery	157	ordered	14	79
44	0	cash_on_delivery	2753	ordered	14	80
45	0	cash_on_delivery	2284	ordered	14	81
46	0	cash_on_delivery	2742	ordered	14	82
47	order_IUTcRAS3wVCvna	razor_pay	78	ordered	14	83
48	21A21903NT532600N	PayPal	157	COMPLETED	14	84
49	4WB61878WA315462Y	PayPal	4825	COMPLETED	14	85
50	0	cash_on_delivery	8080	ordered	24	86
51	0	wallet_pay	2753	ordered	14	87
52	0	wallet_pay	2224	ordered	14	88
53	0	cash_on_delivery	147	ordered	14	89
54	0	cash_on_delivery	4673	ordered	14	90
55	0	cash_on_delivery	157	ordered	14	91
56	0	cash_on_delivery	157	ordered	14	92
57	0	cash_on_delivery	157	ordered	14	93
58	0	cash_on_delivery	6094	ordered	14	94
59	order_IVMFCPWPxmI0ml	razor_pay	6326	ordered	14	95
60	order_IVMGjLdT7JvyVi	razor_pay	6094	ordered	14	96
61	order_IVkAlIe46oiDuW	razor_pay	17732	ordered	14	97
62	order_IVkKseRyMEWmlq	razor_pay	6924	ordered	14	98
63	order_IVkP8dVVqX0Mtj	razor_pay	3423	ordered	14	99
64	0	cash_on_delivery	19000	ordered	14	100
65	0	cash_on_delivery	8999	ordered	14	101
66	0	cash_on_delivery	8999	ordered	14	102
67	order_IW2eUmp8cfJyIZ	razor_pay	47000	ordered	14	103
68	0	cash_on_delivery	8999	ordered	14	104
69	order_IWAwTPnjZ2GNHv	razor_pay	25000	ordered	14	105
70	0	cash_on_delivery	8999	ordered	14	106
71	4AT06642BU699005G	PayPal	33999	COMPLETED	17	107
72	0	cash_on_delivery	188000	ordered	17	108
73	order_IWXH3xGLKiLUGp	razor_pay	95000	ordered	17	109
\.


--
-- Data for Name: cart_useraddress; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.cart_useraddress (id, first_name, last_name, email, phone_number, address, city, post_code, country, state, user_id) FROM stdin;
11	adarsh	Kannan	vyskhkannadsfsdn811@gmail.com	+919400973003	Carnival Infopark Phase I, Infopark Campus, Infopark, Kakkanad, Kerala 682030	Kakkanad	682030	India	kerala	14
13	dfgdfgdf	dfgdfgdfg	dfgdfgfdg@gmail.com	3222324234	dvgfgsfdgdfgdfgdf	fgsagsgsdg	324324	sdffsdfsdf	tamilnadu	24
14	Vishnu	Kanth	13.vishnukanth@gmail.com	8086948500	Maravettickal (h), K.S Mangalam (P.O), Vaikom	Vaikom	686608	India	kerala	17
15	Vijayan	s	vijayans@gmail.com	7894561235	Chakarapanthal (h), kakkanad (p.o), vaikom	kakkanad	685475	India	kerala	17
\.


--
-- Data for Name: cart_wishlist; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.cart_wishlist (id, is_active, products_id_id, user_id) FROM stdin;
\.


--
-- Data for Name: categorymanagement_category; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.categorymanagement_category (id, category_name, slug, description, expiry_date, offer_name, offer_percent, offer_status) FROM stdin;
24	laptops	laptops	fdgdfgdsfgsdfg	\N	\N	\N	False
2	mobile phones	mobile-phones	good mobile 	\N	\N	\N	False
\.


--
-- Data for Name: categorymanagement_offer; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.categorymanagement_offer (id, offer_name, offer_percent, expiry_date, offer_status, expiry_time) FROM stdin;
\.


--
-- Data for Name: categorymanagement_subcategory; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.categorymanagement_subcategory (id, sub_category_name, slug, description, catergory_id_id) FROM stdin;
6	xiaomi	xiaomi	it's good brand	2
8	nokia	nokia	good brand	2
17	micromax	micromax	this is great brand	2
18	dell	dell	good premium laptop	24
19	apple	apple	apple inc. is an american multinational technology company that specializes in consumer electronics,	2
20	samsung	samsung	samsung helps you discover a wide range of home electronics with cutting-edge technology smartphones	2
21	iqoo	iqoo	iqoo is a chinese smartphone brand and manufacturer. 	2
22	oneplus	oneplus	oneplus technology co., ltd. is a chinese consumer electronics manufacturer headquartered in shenzhen,	2
23	lenovo	lenovo	lenovo is one of the world's leading personal technology companies	24
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	useraccount	accounts
6	categorymanagement	subcategory
7	categorymanagement	category
8	productmanagement	products
9	productmanagement	imagegallery
10	cart	cart
11	cart	cartitems
12	cart	useraddress
13	cart	order
14	cart	orderitems
15	productmanagement	banner
16	useraccount	payment
17	order_management	payment
18	cart	payment
19	categorymanagement	categoryoffer
20	categorymanagement	offer
21	productmanagement	coupon
22	productmanagement	expiredcoupon
23	cart	wishlist
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-08 00:36:43.732894+05:30
2	contenttypes	0002_remove_content_type_name	2021-11-08 00:36:43.748557+05:30
3	auth	0001_initial	2021-11-08 00:36:43.805641+05:30
4	auth	0002_alter_permission_name_max_length	2021-11-08 00:36:43.813232+05:30
5	auth	0003_alter_user_email_max_length	2021-11-08 00:36:43.82446+05:30
6	auth	0004_alter_user_username_opts	2021-11-08 00:36:43.837272+05:30
7	auth	0005_alter_user_last_login_null	2021-11-08 00:36:43.879684+05:30
8	auth	0006_require_contenttypes_0002	2021-11-08 00:36:43.884596+05:30
9	auth	0007_alter_validators_add_error_messages	2021-11-08 00:36:43.896104+05:30
10	auth	0008_alter_user_username_max_length	2021-11-08 00:36:43.906528+05:30
11	auth	0009_alter_user_last_name_max_length	2021-11-08 00:36:43.917532+05:30
12	auth	0010_alter_group_name_max_length	2021-11-08 00:36:43.928561+05:30
13	auth	0011_update_proxy_permissions	2021-11-08 00:36:43.939895+05:30
14	auth	0012_alter_user_first_name_max_length	2021-11-08 00:36:43.959211+05:30
15	sessions	0001_initial	2021-11-08 00:36:43.981558+05:30
16	useraccount	0001_initial	2021-11-08 00:36:44.008886+05:30
17	useraccount	0002_auto_20211110_0431	2021-11-10 10:01:51.047827+05:30
18	categorymanagement	0001_initial	2021-11-10 11:38:36.753695+05:30
19	productmanagement	0001_initial	2021-11-11 12:27:08.473682+05:30
20	productmanagement	0002_auto_20211111_1435	2021-11-11 20:06:11.259846+05:30
21	productmanagement	0003_auto_20211111_1540	2021-11-11 21:11:10.21592+05:30
22	productmanagement	0004_products_product_cover	2021-11-15 19:56:21.782466+05:30
23	cart	0001_initial	2021-11-18 12:35:47.043382+05:30
24	cart	0002_auto_20211118_0723	2021-11-18 12:53:21.232047+05:30
25	productmanagement	0005_alter_products_sale_price	2021-11-19 13:38:18.465711+05:30
26	cart	0003_cartitems_sub_total	2021-11-19 15:13:13.166009+05:30
27	cart	0004_useraddress	2021-11-20 12:43:27.574867+05:30
28	cart	0005_alter_useraddress_phone_number	2021-11-20 14:56:19.631903+05:30
29	cart	0006_order_orderitems	2021-11-20 20:21:18.40268+05:30
30	cart	0007_alter_cartitems_user	2021-11-27 14:31:25.553173+05:30
31	productmanagement	0006_banner	2021-11-28 23:22:57.864156+05:30
32	useraccount	0003_payment	2021-11-29 20:03:01.413036+05:30
33	useraccount	0004_delete_payment	2021-11-29 20:40:47.22434+05:30
34	order_management	0001_initial	2021-11-29 20:43:14.563611+05:30
35	cart	0008_order_payment_status	2021-11-29 21:10:57.162722+05:30
36	cart	0009_order_grand_total	2021-11-29 21:18:48.347253+05:30
37	order_management	0002_alter_payment_amount_paid	2021-11-29 21:18:48.363114+05:30
38	order_management	0003_delete_payment	2021-11-29 22:32:18.642151+05:30
39	cart	0010_payment	2021-11-29 22:33:33.879342+05:30
40	cart	0011_payment_order	2021-11-29 23:50:59.939532+05:30
41	cart	0012_order_ordered_date	2021-12-01 10:10:34.841271+05:30
42	productmanagement	0007_products_category_offer_price	2021-12-02 11:44:10.413149+05:30
43	categorymanagement	0002_categoryoffer	2021-12-02 11:56:53.828295+05:30
44	categorymanagement	0003_categoryoffer_category_offer_name	2021-12-02 12:14:41.739102+05:30
45	cart	0013_alter_order_ordered_date	2021-12-02 16:09:53.757427+05:30
46	categorymanagement	0004_auto_20211202_1040	2021-12-02 16:11:00.789336+05:30
47	productmanagement	0008_auto_20211202_1044	2021-12-02 16:14:55.683825+05:30
48	categorymanagement	0005_rename_category_offer_name_offer_offer_name	2021-12-02 16:17:01.165324+05:30
49	categorymanagement	0006_auto_20211202_1049	2021-12-02 16:19:46.202835+05:30
50	categorymanagement	0007_auto_20211202_1436	2021-12-02 20:06:29.877726+05:30
51	productmanagement	0009_rename_category_offer_price_products_old_sale_price	2021-12-02 23:42:16.255934+05:30
52	productmanagement	0010_products_offer_status	2021-12-03 16:16:56.282159+05:30
53	productmanagement	0011_products_offer_applied	2021-12-03 19:52:07.633083+05:30
54	categorymanagement	0008_offer_expiry_time	2021-12-05 17:35:11.819943+05:30
55	productmanagement	0012_alter_products_offer_status	2021-12-05 18:26:58.38919+05:30
56	productmanagement	0013_coupon	2021-12-06 13:10:41.276396+05:30
57	productmanagement	0014_coupon_expiry_date	2021-12-06 13:26:07.536236+05:30
58	productmanagement	0015_coupon_expiry_time	2021-12-06 17:38:26.154493+05:30
59	productmanagement	0016_expiredcoupon	2021-12-07 12:02:03.493603+05:30
60	useraccount	0005_accounts_wallet_amount	2021-12-07 17:34:44.117309+05:30
61	useraccount	0006_accounts_refereral_code	2021-12-07 18:06:03.846343+05:30
62	useraccount	0007_rename_refereral_code_accounts_referral_code	2021-12-07 18:10:21.54356+05:30
63	productmanagement	0017_products_category	2021-12-08 15:04:41.412357+05:30
64	cart	0014_auto_20211209_0425	2021-12-09 09:55:25.674417+05:30
65	cart	0015_alter_cartitems_buy_now	2021-12-09 09:58:32.959233+05:30
66	cart	0016_remove_wishlist_buy_now	2021-12-09 14:35:00.691293+05:30
67	categorymanagement	0009_alter_category_offer_status	2021-12-12 13:48:48.90556+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
p6dy6zdezkn9mh4d7jhdklkp11c0r9f7	eyJ1c2VybG9naW4iOnRydWV9:1mqzBu:jRWbL8Yg4G3gTdMgPRRIhLt6h9sI3zgrUjlSy-MYn90	2021-12-11 20:30:38.327055+05:30
lrbwe0ovx1xavg76fs469f36dr8dmpiz	e30:1mrCMR:tbwGG0I3lG1GNixJLrPfXoL6Rzz4Rkw5CMNlmxVVMkI	2021-12-12 10:34:23.463615+05:30
ajfco6dci15z6omk3xwt8m1zda8aiy1j	e30:1mrCMT:_6YJBJktSPn_HI095ltcxbxYtXMW0JkZD5H7p43NM5s	2021-12-12 10:34:25.1232+05:30
3x2z5icsvnh80t10ps1gsdkr8zq0xv2h	e30:1mrCMT:_6YJBJktSPn_HI095ltcxbxYtXMW0JkZD5H7p43NM5s	2021-12-12 10:34:25.308403+05:30
a5raeukm5e3z4fbfaub7sqrduei1toe1	e30:1mrCMT:_6YJBJktSPn_HI095ltcxbxYtXMW0JkZD5H7p43NM5s	2021-12-12 10:34:25.641665+05:30
5i07rgblmse18e4p37bxqeflw4o5p0bf	e30:1mrCMT:_6YJBJktSPn_HI095ltcxbxYtXMW0JkZD5H7p43NM5s	2021-12-12 10:34:25.793312+05:30
uetffwylv1tjj4b4jvl155e4xsrjbl27	e30:1mrCMU:_jilIueyBsWidM9ZRT5OzADNz5WiAP7c17P2fX97Bwc	2021-12-12 10:34:26.048944+05:30
rvkrcssbmxgw6l0nqqkz7h579wwoc9ua	e30:1mrCMU:_jilIueyBsWidM9ZRT5OzADNz5WiAP7c17P2fX97Bwc	2021-12-12 10:34:26.23287+05:30
ifmqhlvavqlcvgr896npqqj7sbb2j9sv	e30:1mrCMU:_jilIueyBsWidM9ZRT5OzADNz5WiAP7c17P2fX97Bwc	2021-12-12 10:34:26.430121+05:30
lp2rbcdpsya44y0moeg8wf7ah8e8a63y	e30:1mrCMV:4hornv5zXZFIDCdUwM2hx5UlxCfaS-lTVtewqzxjIIU	2021-12-12 10:34:27.576382+05:30
xwr437nveidhetuivh3npln1k8ffvmsd	e30:1mrCMV:4hornv5zXZFIDCdUwM2hx5UlxCfaS-lTVtewqzxjIIU	2021-12-12 10:34:27.771589+05:30
zxe3vxwk58cwt2hlqa2vackgplymip16	e30:1mrCMW:905ZnzL4BhgUabxA5py7yD-_G73tlB2hK0e4eBKG6eI	2021-12-12 10:34:28.054111+05:30
4y4irul8i29iq0mrm2m2frs42ldcy019	e30:1mrCMW:905ZnzL4BhgUabxA5py7yD-_G73tlB2hK0e4eBKG6eI	2021-12-12 10:34:28.31349+05:30
1ijf8oscc5w29ets1o10ii1rjeniub42	e30:1mrCMc:YjBQv090omLNkaOa0jXMLTrjIgwBQ1XTj69sEHpK0i0	2021-12-12 10:34:34.712936+05:30
gnenj6ope0v1bctne3d580ti46iogcot	e30:1mrCMd:Ubqy_tUHfjhZZxFegzHznZcW5cOfITntst7PWydkGQ8	2021-12-12 10:34:35.439088+05:30
8slsr657wzccc5xj6er0ehtoybasjb6q	.eJxVjEsOgzAMBe-SdRU5mJDAsvueAdmxW-gnSAFWVe9ekFi02zfz5m16WpehX2ct_SimM86cfjem9NC8A7lTvk02TXkpI9tdsQed7WUSfZ4P9y8w0Dxsb4xXVXAxVV4FGlSsqhDEA1P0LaQWY0N1CBDJI3oWTg5cTQzIqCFtUZLXmE23lFU_X7f2O9A:1mk7Pw:xzm0eCYWlqTzbcJcwJRBfUNO3TK5FRal2otXQoBmei4	2021-11-22 21:52:44.369774+05:30
584f1e54qkh1bdgrc8i4poxzy6breock	e30:1mrCMd:Ubqy_tUHfjhZZxFegzHznZcW5cOfITntst7PWydkGQ8	2021-12-12 10:34:35.759304+05:30
0tscku838z775w2ano9hbl1tx2gq545v	e30:1mrCMe:Wg_NqbJpGFZZZP0Fz8LunatWBfiAQqZzd1OSfWSCKts	2021-12-12 10:34:36.000973+05:30
n9ripclhyh8pj2eas6w0be559h57piqn	.eJxVjDsOwjAQBe_iGlm7_m2Wkp4zWP4FB5AjxUmFuDtESgHtm5n3Ej5sa_VbL4ufsjgLtOL0O8aQHqXtJN9Du80yzW1dpih3RR60y-ucy_NyuH8HNfT6rclarYyJg0tIgQksInCMZkTF5ChRygTAVAB5sKANZkU6cWDtyqjE-wPENjZi:1mkK3l:IuFtHNIO2gT-Tic_iiEt4y8sHzhIerkI5z9gYmfoASQ	2021-11-23 11:22:41.390063+05:30
mi4814t1aea0jxe3aartsuk1cdmn5mzb	e30:1mrCO6:jx7KJCyvQduRMWHYJPxnblDyyMtKpI08Fv_1cmKKK94	2021-12-12 10:36:06.969828+05:30
7yvlm9j0gzdn7fyev1mfmhraekmkyd62	e30:1mrCOC:lbEPS65ZJrfBqIEGSh8JnOgbLeeL9APIGY7Y0AJ-Zkc	2021-12-12 10:36:12.61528+05:30
86wsvp8x8fxxqmj65jyox4f8f61dhxb7	e30:1mrCRj:NycThvEXVL4YjKQXKjkbUCTO_WR_8deB5pzLQLtKV84	2021-12-12 10:39:51.65229+05:30
iukye8tat0uq5cpwlf9j8gjzibt21334	e30:1mrCSg:jSbzqxi_5qFlhP9-kclhhgZHIbeMsI9jy3yrz1cpCSU	2021-12-12 10:40:50.280586+05:30
sqyzsy6xfsrlg17j97s9gvycbplgtfc0	e30:1mrCW6:ylpzuo8FAOH3xmPfWW5FBucdbm2b6fA5oFqJkBJFo-k	2021-12-12 10:44:22.427927+05:30
ilslwypst0ajgqvm837ikguf6kvokh18	eyJ1c2VyIjoiNDIwNzE4IiwidXNlcmxvZ2luIjoiMDU0MzE0In0:1mkR9d:ZglR7T01cdTYH2lYF1MwnIn-Nr_crtgCuXZu-trU0ZM	2021-11-23 18:57:13.454313+05:30
vtlrqui7zf9mv61muytm959uut3cu2td	e30:1mrCXt:Fn7_HmYoKCa5TDOKhNVzRFXn0ccgnqpfUQtOwbdlRmU	2021-12-12 10:46:13.929221+05:30
46vlhkzuajzyjrnqlwzsbmggya8p8psf	eyJ1c2VybG9naW4iOiI3MDUwNjMifQ:1mkRIw:gmy_65akoU6ASkkS-qllcw_9Nh5P7Lt72j9iCVhOnMk	2021-11-23 19:06:50.394454+05:30
t6hy2lpi6bad52pm4ig8uzwi6pv8fr29	e30:1mrCZ5:y2veVuv9AzWzZtJ11mvWQwFUa6TKurLzYKa1-d1YuKM	2021-12-12 10:47:27.11694+05:30
g4q54wnehdzh4kafqx95ka29sgypipnz	e30:1mrCbI:1PABl0G0zDJktHJ_J0SVRGGGECd1MYsxBFJDBBaQnDc	2021-12-12 10:49:44.566777+05:30
1pffjo0i7gvlfk909na70m3bd1qz8ja2	e30:1mrCbL:7nhmXaOvlNpz1mxnE6bmXhROXffv9agoZj7MbRe3bKQ	2021-12-12 10:49:47.907605+05:30
pk5g3kiuu4i4vl3eyvg11tp9f4j3t9gd	eyJ1c2VybG9naW4iOiI2ODgyNTYifQ:1mkRRZ:YVIyZQtwC6GRuPdYU3QOQxMMkYwzf_-MW816mnaw4mo	2021-11-23 19:15:45.938231+05:30
8gulo8e36edxb7hd5advsu37h97zs5x9	e30:1mrCeD:R6TIufXV9-K3BEYJ6UpAT8Nh66r7vHke7inWp29MEbw	2021-12-12 10:52:45.118661+05:30
6jqd1ajeqgm3tlbp0t1p8el8b0fnj4h6	e30:1mrChS:mM8Q_cUC4jSrK-EpPqfU1r7eVqBlgKZk0pQea9EbgNs	2021-12-12 10:56:06.295153+05:30
9alta54ykersz555lvyau206cg6bgap9	e30:1mrChY:RedmIv2HFORb1eyO-wnJyhIx5bJomV1WeIeV5v6oxDQ	2021-12-12 10:56:12.896393+05:30
jtzsnosypz2rlzvzoq4fuikxayl852xs	eyJ1c2VybG9naW4iOiIxMzcxMTEifQ:1mkRu0:B0vvEQzrxSLtm-uQc6vGWvlkutvHvlIKlVhD38fjF2g	2021-11-23 19:45:08.988669+05:30
crnenu5ll4h6j9kpah9w310uggotgjmr	e30:1mqqfM:Ou3DFWJHMrX7qvl9aVC0wyh1_Oqr5XTR7QJk3ojorYg	2021-12-11 11:24:28.362002+05:30
ifbkm5mt9wmd4o80cezlglqbr6i8ycl4	e30:1mqrJu:4iOqOfBVPPneUwjgIKVmF_U4WnldXmK4a0of77QJkSQ	2021-12-11 12:06:22.602718+05:30
a4fc5rd3zw4j49bk75wda5berbgyc7gn	e30:1mqrK9:eTC9QnIrSfVpCyFUArWhWQT-7ctQ3BaKr2mZJRMmQZg	2021-12-11 12:06:37.157387+05:30
j81azbpvuqdq4eod4r21rkuktlz1fwtr	e30:1mqrSi:yqYdck8ryWO7roQIT_NX252ga1Qe1vQQMa8bj9kOkRQ	2021-12-11 12:15:28.687881+05:30
ku2ik7thhl06vyqnb2k98ohm4aug4n82	e30:1mqrTW:VrmFdK0LREbTwBZfOnRsImcU1qmcaWAT6YEf2yxhPNE	2021-12-11 12:16:18.278281+05:30
mfz583g38rhuiqf0xoixnpzjwhp3zrqi	e30:1mqrTu:D9YnoAxZeM-6EXRLHPprwqg4X767vo-Q1Hm5vwuQAwk	2021-12-11 12:16:42.447755+05:30
mriaaol2zgazve0jm4xxqes05dzh2gms	eyJ0ZXN0Y29va2llIjoid29ya2VkIn0:1mqrax:N-yT9NYw8nilaYvgocFnoVvQJ85x3MgrKY7cbhUUCaA	2021-12-11 12:23:59.288951+05:30
0221pun7vdhvi0gf1tn4u5bvd92pxqqj	e30:1mqrnl:fQR8VGOSjn5o9uiykrO2-xsOGDDyW-WCngOudaUrT98	2021-12-11 12:37:13.720063+05:30
5o2op7hmvc8b689weiwz2hoca4c0r9v0	e30:1mrCjC:nsqDWHSnXIso3FUhpKqkSE1YDJsKI8rb5PgRzCGBKqI	2021-12-12 10:57:54.26092+05:30
c5dnadk5yss4x93osz0q797ncsuc3ijo	e30:1mrCjN:NBAMHLHt9iDwVkmNvHeZ7Slq0FAZfttugneIVvfS8I8	2021-12-12 10:58:05.003335+05:30
mjhr7jb98rx6p49ohww4lx3jqofr53t1	eyJ1c2VybG9naW4iOnRydWV9:1mqxSC:WnDCwcbW3PR0U2Eb8cxV1apWxOiQVaRro4dc1T1uEFo	2021-12-11 18:39:20.025819+05:30
rqpz4amxvsy3hch3w7b6exscf63t9yaj	e30:1mo4c6:bFdg-ZdnBU-fkubnhoLHMEpozrr6jRnQDu-x29dwOas	2021-12-03 19:41:38.914401+05:30
o3b2kjqh17hbcw7urxaa4ipz6x7z19qx	e30:1mo4fO:fDQZkY2_tUpWI7HU1MH_12HPEi61U0CgWDkIT1-pDWc	2021-12-03 19:45:02.992784+05:30
ii8xpmhk6r2ytesi0o13mt8u58zqqnir	e30:1mo4fQ:_h8ip0_i7JSqy2EcPBeBKp3gPb7XXaolppqbaO38zQg	2021-12-03 19:45:04.432601+05:30
lbi7u5svnl73omuczmkj5cnenwqwpedc	e30:1mo4fU:jSehHkB9CkRcBxxKEHdN1sC4eCnXRLNA1f2tYAvPsM0	2021-12-03 19:45:08.088315+05:30
h6lon5cyviwfvwwxw7cdz8jocwrdcwtu	e30:1mo4ii:yqn0zGqsgKWzQBP2TQPue-FW5dt4MPK34HKo--r1jHY	2021-12-03 19:48:28.857266+05:30
xom1umahdx4oho5egmn4zmd94jihu7ma	e30:1mo4kR:VgyNRpJ56pZgDD_Dm4uJr7M1LTW3TlNKMdtItICRMYA	2021-12-03 19:50:15.14119+05:30
k09h51z99kq0ilavow9im7bdxux07ax1	eyJ1c2VybG9naW4iOnRydWV9:1mqxZD:3THNFA5Qb-YP69e_Mf2xCOET__TI9kmwDpUAM52_iC8	2021-12-11 18:46:35.211667+05:30
b1g1tnbpqwcids9n6u1stfiac7e2glqy	eyJ1c2VybG9naW4iOnRydWV9:1mqxb4:58AWKQzMtL4D34oInvfIgq7xhvFCY91yBckR0VFvXC4	2021-12-11 18:48:30.961168+05:30
jx06p6mpcm1pxal93kts4zciz80lkq51	eyJ1c2VybG9naW4iOnRydWV9:1mqyeD:4P_ebLcwcKQFMgP2fNjSbgPsZ8LztUs0-My2T7lbvyU	2021-12-11 19:55:49.282715+05:30
6l5y0qrm8bp8bh22u6ypps14g9cycbzl	eyJ1c2VybG9naW4iOnRydWV9:1mqyns:LiPTIEc0HrBxU033MGOxpT2rcxq3gWv2-ZhIGhKwFDk	2021-12-11 20:05:48.459491+05:30
q35fn9aqqs4fugpaj154u9fmepfh6926	eyJ1c2VybG9naW4iOnRydWV9:1mqywV:p0fBoSsjnHO4Qjq2lUFuKjG1-vznJLI7s6XO0hpyYIE	2021-12-11 20:14:43.831052+05:30
x7budf1a3kepy9odi3c7nmxwv5r7ys19	eyJ1c2VybG9naW4iOnRydWV9:1mrClb:BPyAsVLDY0v9EUHmZliISMEPaTnoon1s1GBTacl0p9Q	2021-12-12 11:00:23.466962+05:30
j6h0qtzrmywccelpj19cucj8gn24cuf1	.eJxVjEsOgzAMBe_idRU5mJDAsvueAdmxW-gnSHxWVe_eVmLD9s3MewPrayzQrfNmJ-h5W4d-W2zuR4UOPBw24fyw8gd653KbXJ7KOo_i_orb6eIuk9rzvLuHg4GX4VdTupqhT7kKptiQUVXFqAGFU2gxt5QarmPExIEoiEr26GsWJCGLGT5f5wQ70A:1mveBd:iQJ6QmFHU39JrvfDyjLGzfWfPaHMvhzJnkQws2Kd6tA	2021-12-24 17:05:37.396604+05:30
hzzsnxzrp4ilgqgivjfcpwhlw37taix2	eyJwaG9uZV9udW1iZXIiOiI5NDAwOTczMDAzIn0:1mvulN:t84ERYwzBSbiBqvfg1LF4BAsUtlZXOVFSjorJjKn1oQ	2021-12-25 10:47:37.623388+05:30
2hn69txxdrv7hx4t14701h6yrksjf6f2	eyJwaG9uZV9udW1iZXIiOiI5NDk3NzQ1NzA5In0:1mvuoB:aDWRvXRz5EJ6vaQ_K2_rHZs77aDp0Uxih519nsClmnI	2021-12-25 10:50:31.553019+05:30
j92o2tontf75sa5e1z29yadk1n40ive7	e30:1mrNgx:dJPKzjGCW8uYxohk3DdAJkJl0JryHIWdHOHQ6mkb-0w	2021-12-12 22:40:19.020964+05:30
uwwsxxdsndz1e3po21xcsatyfhmd4x6r	e30:1mvvUH:nQte3egcpUylkAUS0titVLclnShjmcseM7J8ACbgjj8	2021-12-25 11:34:01.156916+05:30
oe7fr6pjhfwxodrfch6e0ncfalkscuer	e30:1mvvcq:ssGQQETph2jJTfqg2fdx1WmXczqj9N6kBinWtn97g6c	2021-12-25 11:42:52.62261+05:30
von6rouv14r6ng3y536mpdm1h0r1kq46	e30:1mvveJ:LHjkOYhstdHvjvwmkwrZip663skCl5ON9hQGI92BEu4	2021-12-25 11:44:23.873273+05:30
o4n3wgwg4074sr97vejz71rn325nfgot	e30:1mvvjZ:naX9_-HmJJKbVWYfWwFDT8E609IeDcqVQFTXG0oeDkk	2021-12-25 11:49:49.894687+05:30
3hchhg42nudv9on5vlrt5odcat09g7xt	e30:1mvvlY:xTMtOwGCRfTHbXIOSN9m7nQoWN3ERV-i40mGAQ8hQFI	2021-12-25 11:51:52.539558+05:30
43nxs0pp9awz4vhudxmji1cw23h9bhew	e30:1mvvn7:LGmMfS9dRzQN5Tn7gLz3_406KJYCJ9UrC-WAa9VLO5U	2021-12-25 11:53:29.470768+05:30
t0qs1fjeiqhtsw7nadsnh5evlvxmiaez	e30:1mvvnn:pY1cEGZqxBJcKu2zORrpjgunc1a-Du5p3E35LY5kMSM	2021-12-25 11:54:11.471569+05:30
zd2n5d8oht2ar572rip3f0t659bnhvxj	e30:1mvvpK:LJ2TiIjc5zJ6vyu7FPUPR-ogUW2yx_fIY08XsLtlw60	2021-12-25 11:55:46.128288+05:30
khp80d7dmzautx5sck6qfwn6rqyjjx5l	e30:1mvwF9:4hqx-KuTplU5zpGC9BTDhXRjWiHKpNPN7S2xGeW5l08	2021-12-25 12:22:27.719889+05:30
q9v9jolsz5jam8hrg3m7kzclu4s6n5t2	e30:1mvwFf:lQgqO6LsaCvy0RNMRMyAT00EKMiB4EKYqui6QJNQkmg	2021-12-25 12:22:59.149195+05:30
mornc8cemdjueu1n5yq9hd2bfbh9hwa1	e30:1mvwH9:CgD5DpXHDDVAPoEThqVdiPSuxGsPWjkdBfK9v57jR10	2021-12-25 12:24:31.301131+05:30
a98ywpqey62hmzna6kiqg9cyh27y5u9p	e30:1mvwJl:VS_AvCTzSirIXgmdPPTvQGpb-m73-urs4mJZfh-NXJw	2021-12-25 12:27:13.620819+05:30
jttmiqkwdnxpywnrncuw65ol87id8n6n	e30:1mvwKK:QJqEAIwE7GdNwWw7Hsbq4WX2J-oMdZOV5zY0hwthpKw	2021-12-25 12:27:48.297827+05:30
59pjzgw7o8nrflkmk56rax5nuthqdwt2	e30:1mvwPo:wfT8TCOts0E_RGfRjDb_TTPAbfKV2XhgRD8wKgvs5hE	2021-12-25 12:33:28.125162+05:30
ijrhspaszmlxqejbpb7bc9d5gqisiudl	e30:1mvwPp:NsItrZRwYKMtr8zRv2jGbfUydgylYsVx6z_nd7juRME	2021-12-25 12:33:29.405895+05:30
bkj0ejbwx1n8q6rkiude8cip1l7boihh	e30:1mvwPp:NsItrZRwYKMtr8zRv2jGbfUydgylYsVx6z_nd7juRME	2021-12-25 12:33:29.576324+05:30
1mva888oiqudt4a9tjembnsisdbbjp80	e30:1mvwPp:NsItrZRwYKMtr8zRv2jGbfUydgylYsVx6z_nd7juRME	2021-12-25 12:33:29.779165+05:30
bqjedp1xig97w4o0nsjyrnf0zg7n5ft6	e30:1mvwPp:NsItrZRwYKMtr8zRv2jGbfUydgylYsVx6z_nd7juRME	2021-12-25 12:33:29.920107+05:30
c0z8lf9vi3c5mcnk4kgrat8qmhrf1h4h	e30:1mvwPq:K1Quxio8eqXgml5z8wFBFJ0L7IxZp7J47Qj8DX19-pk	2021-12-25 12:33:30.054569+05:30
v25ssvnna9ey4t2tzrweiwchyes5myww	e30:1mvwPq:K1Quxio8eqXgml5z8wFBFJ0L7IxZp7J47Qj8DX19-pk	2021-12-25 12:33:30.274359+05:30
1yn26dey5kr6setmhzcygqpmxt3mb992	e30:1mvwPq:K1Quxio8eqXgml5z8wFBFJ0L7IxZp7J47Qj8DX19-pk	2021-12-25 12:33:30.55015+05:30
uml6lenyyd671rt8zomwaadvon34v1br	e30:1mvwPq:K1Quxio8eqXgml5z8wFBFJ0L7IxZp7J47Qj8DX19-pk	2021-12-25 12:33:30.759639+05:30
xe3v6g3toaxygkloa1hijvknorvsodl0	eyJndWVzdF91c2VyIjoiNmE4NThmNWEtZGExYS00MDc4LWJjMTQtZTA4YzJiMzRiNjUyIn0:1mvwQS:TrmYjPF6nGSdAo2V7MEbRqT5wY8TtW5NJihCijGkAGE	2021-12-25 12:34:08.734034+05:30
nybepxmh9k801olo9gnvncl7e8evu9xl	eyJ1c2VybG9naW4iOnRydWV9:1mw1qj:WGXcVbv28rFJx1yi0h0MP57OLCnOYQcuGEQjHlk9b-Q	2021-12-25 18:21:37.774476+05:30
hl5tte1wtwgt91fkzwl2op0lxosbbvvt	e30:1muDWX:KCi-xb4WDJXRHEp_t1Tt3gRR_x8FDln3GXLBI5e6fwg	2021-12-20 18:25:17.720272+05:30
85opt7wubctawhmhl85rqazdrypvvnlj	e30:1mvLtS:PTUi7UpNlzRAdZqBUeAc6FaYIcLbM21qdOl5vEiusOg	2021-12-23 21:33:38.676316+05:30
ceyggmlyts8qu44h3h7ajmjn9d4chntg	eyJwaG9uZV9udW1iZXIiOiI5NDAwOTczMDAzIn0:1mvYPC:0w_87YSHBXv7pb3WTE18GBt4hyojWPQ0qaUCwkBBXrk	2021-12-24 10:55:14.34569+05:30
r6phpth7jx5cq9sz3n344gq7updu7zvh	eyJwaG9uZV9udW1iZXIiOiI5NDAwOTczMDAzIiwidXNlcl9lbWFpbCI6InZ5c2toa2FubmFuODExQGdtYWlsLmNvbSJ9:1mvYZC:h0qJNfwKRSZVu4IFdqPfjpyE43gAMfmdy5wr58bJp6Y	2021-12-24 11:05:34.175815+05:30
6g4m4sa648b1wjtwxj1vjx1x89o8ae6l	eyJwaG9uZV9udW1iZXIiOiI5NDAwOTczMDAzIn0:1mvYgh:jZrZQqmmw5YF1o8u6opmeUGf-BljeARgOxPTxUVAqkc	2021-12-24 11:13:19.791395+05:30
7x7qb7c0i94fnjzl99zim0bujd29tzvr	eyJwaG9uZV9udW1iZXIiOiI5NDAwOTczMDAzIiwidXNlcl9lbWFpbCI6InZ5c2toa2FubmFuODExQGdtYWlsLmNvbSJ9:1mvYnM:8qpOhGscf1wA1oDJiUXJ4slpkyyoaofhh4vu0I0j6s8	2021-12-24 11:20:12.629072+05:30
kidw8tkfasahbi0xfyj8nq8ofsitqkhm	eyJwaG9uZV9udW1iZXIiOiI5NTI2NDY3NzAyIiwidXNlcl9lbWFpbCI6Im1lam9rQGdtYWlsLmNvbSJ9:1mvYqz:zomIwquGAY05sjJhbhxhimYRFFY9ljb5kw-ksKUKEnI	2021-12-24 11:23:57.420848+05:30
guxyrmqszuqs8itoq6v3ud9jelrdooi3	eyJwaG9uZV9udW1iZXIiOiI5NTI2NDY3NzAyIiwidXNlcl9lbWFpbCI6Im1lam9rQGdtYWlsLmNvbSJ9:1mvZCa:Y-JD8It7KZxRiU0HaDhEDRSUjFfPZ6bJmaPali1quRc	2021-12-24 11:46:16.278524+05:30
06irj52r6ekd89ttyl07or00v6qj5t7h	eyJ1c2VybG9naW4iOnRydWV9:1mvxwR:m2pwIGpy5QBFi-XHgu2IvpnVLB0eF4xJIyDrlv1Ae-w	2021-12-25 14:11:15.010893+05:30
2chadn2opowl57tjr6lflzk7dujkr24n	eyJwaG9uZV9udW1iZXIiOiI5NTYyNTY5NjIyIiwidXNlcl9lbWFpbCI6InJhaHVscmF2aUBnbWFpbC5jb20ifQ:1mvZO9:vUPTkFl1zdPEFiac0KZF9TZBWq_pTcDeMUSYLUteHnA	2021-12-24 11:58:13.323433+05:30
syxivwo1wm234c45lcd331x25a8d7gnq	eyJwaG9uZV9udW1iZXIiOiI5NTYyNTY5NjIyIiwidXNlcl9lbWFpbCI6InJhaHVscmF2aUBnbWFpbC5jb20ifQ:1mvZQb:0JfjADhI6Se1u9s2MyKLNWkvCuzk6MnoG1nqI-6SBGU	2021-12-24 12:00:45.540907+05:30
gy5eaaat5bi1n65pnhdv7winvmv45f1o	eyJwaG9uZV9udW1iZXIiOiIrOTE5NTYyNTY5NjIyIn0:1mvZR1:1LoJAu9SKhIgVtYaykFzlzFAh0GGzyUwcJ3jGhTj_v4	2021-12-24 12:01:11.923936+05:30
2olirn7k3sql6va2itqdg7s81vsakkz1	eyJwaG9uZV9udW1iZXIiOiI5NTYyNTY5NjIyIiwidXNlcl9lbWFpbCI6InJhaHVscmF2aUBnbWFpbC5jb20ifQ:1mvZT8:Y_sOgvjtAyrIk37TsudTUCuL4Qus9oIMBkyM3ycd7RY	2021-12-24 12:03:22.825584+05:30
ev1wh2t4ml6opyrnpi27b0yfcgdfm81j	.eJxVjztuwzAQRO_C2hBW_GxIV0H6nEHgZy3SkciAEtMYvrspwyncznszwNzYbyyZptxWR5WdmVHIFRrknJ1Y26hOtNq0dFJtbEu1f-lzPpLBl7Urk217nJ5iCt0S8B46638oHyRcbZ5Lr-W9JjccyvCi2_BdAi1fL_dtINot9rZ2yC-AHxD4OBqURirhFUlBHJw2QaMEsMoRRy8uILUHcIACwPBRO_p_s5Q5ZXbea6P7A8B2Udw:1mvZUv:JVbnvfcVFXht4EbOzGC_rQNwxAyMWMeURe9rPg78jk8	2021-12-24 12:05:13.235641+05:30
4jow03504896r6ub9gkshy1rzw2y824b	eyJndWVzdF91c2VyIjoiYTZlNGM1YzctMzIyNy00OTI1LWI5OTctMzkxMmY3NjEwYjMyIiwidXNlcmxvZ2luIjp0cnVlfQ:1mvzGa:wqjY1evxu8sVCSn0zwHySmgcUhXXhYycvdFR6wF5CDs	2021-12-25 15:36:08.591106+05:30
p9h9osrh1zif9zhfb7omyrgwcmvp0ujg	eyJ1c2VybG9naW4iOnRydWV9:1mvzGv:R8sTVUPfQmE-ijjP40JicWe5Ve0f0ly2zMawu_gaq9k	2021-12-25 15:36:29.533008+05:30
25ooan094akvn4sepfx7pcdm83xag0cs	eyJ1c2VybG9naW4iOnRydWV9:1mw0Gm:CQpui9zBmXTFxq7-7KZmw3YzL7s6w58j6roV9RGk08g	2021-12-25 16:40:24.769077+05:30
si5txnq7lol7lqp405mmkwahfsjnpm0n	eyJ1c2VybG9naW4iOnRydWV9:1mw0Hn:ezr6uRGA4ISSbxKRWi3g1h-dWoyB3Yt69o4R6DEZFQY	2021-12-25 16:41:27.070168+05:30
m5hlwgt6z7ppk8ahbqp0shfhwmz2pkar	eyJ1c2VybG9naW4iOnRydWV9:1mw0Ht:mabTF3zARG22bDi6ijl39NcTrWRZaCd0eu5p4gtXQl0	2021-12-25 16:41:33.006105+05:30
tslzjwod79evuquzy5xhrjnby2dec0ni	eyJ1c2VybG9naW4iOnRydWV9:1mw0IL:5ecYmYlC_-AErDIusrfjh9_ZjyTlDT84cBN8pZiCX9I	2021-12-25 16:42:01.316839+05:30
1mvg5knf2rt1un9xnslna2obv05iq2tm	eyJndWVzdF91c2VyIjoiNzNkYTk4MzQtOTdmYi00ZTRjLThiZmItNmI0ZTdkM2FkZDMzIiwidXNlcmxvZ2luIjp0cnVlfQ:1mw1IS:oX4VXVk6JZPrdEMomm3ZCS4gRbVvMKPoxyHG-BpfSvs	2021-12-25 17:46:12.496324+05:30
pi9peuye9ga3vbvo1owvq6uqrn2rgp8c	eyJndWVzdF91c2VyIjoiYWU2ZDc2NjYtM2MxNS00ZTFhLThkYjItYjBiYWYwMDU5ZDkyIiwidXNlcmxvZ2luIjp0cnVlfQ:1mw1d7:4wWUUQ-VC6kNbX8CWuYCuuc9y9wjuCxvWWGqlrdYLKs	2021-12-25 18:07:33.810748+05:30
36yelri66bxlxm6ffyj0oy1ac974moc7	eyJndWVzdF91c2VyIjoiZGRiODhmOWMtNzc4Yi00NzgwLTk5ZTItMTQyOTNhYWZlYWRjIiwidXNlcmxvZ2luIjp0cnVlfQ:1mw1hb:fHK7NXYxio0id6zR8hMcojYQkFv-T5-VzuS41layNus	2021-12-25 18:12:11.56563+05:30
qpt65n1muyzwnscmxi0trfo5nswunflo	.eJxVjjsOgzAQRO-yNSCvP7GhTJ8zoDW7BhIEEp8qyt0DiIZ25s3TfKHdZFnrbZEZKngEp3VjUs7sVW6jhDxgQzmLL61CKkkJZHDQw9T2I1TrvEkGNW1rd0rqnncPWriFkZqPjEfDbxrbqWimcZ37WBxIcbVL8ZpYhufF3gQdLd2-Ji9srZgkpVfORrTGxxRCUoiOS4WavE4G8fzKmi05lSQFZ7Qig_D7AxG5TKM:1mw1pP:O7TpB4QtFgzm9BRsJarYn16xYQfvjJAc7PQn2v_F4Fg	2021-12-25 18:20:15.279309+05:30
ykzpo1uuads65lvbzzlme25b3duc7bbt	.eJxVjMEOwiAQRP-FsyFQcRd69O43EMoubbWBpJST8d9tkx70Npl5897Ch7ZNvlVe_UyiFxrF5bccQnxxPhZ6hjwWGUve1nmQByLPtcpHIV7uJ_snmEKd9jebzimnNUIkY4GRVAIGpKg1ETFoS8oG1RkKe7w66DgODm-GADGlXXroljLOWfTb2vjzBfCDPmI:1mwMdD:f_iWPZlGNJcqO0X1jZtBVe56xw68JpYW0Kdqmb250HU	2021-12-26 16:33:03.482786+05:30
bms87b8o9w01x4n84ob5zm0pz0l3x0bi	.eJxVjDsOgzAQBe-yNSCvP7GdMn3OgNb2GkgQlvhUUe4eiGho38ybD3QbL2u7LTzDHVyUKaoca2mMqLXQoSYjbW1v3ktnMkVroYLDHks3THBf540raGlb-3-kHdLeQQ2XMVB883SQ9KKpK00s0zoPoTmU5qRL8yyJx8fpXgI9Lf3-JstJa1aZvRVGB9TKhuxcFogmeYGSrMwKUSB5SjJpMiJzdkZJQQrh-wOsrkwe:1mw1FW:wE-e9GZw2ZGGl-ZsIYzUj9phVgpVJIwzL_WyPcoV6Ao	2021-12-25 17:43:10.502421+05:30
\.


--
-- Data for Name: productmanagement_banner; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.productmanagement_banner (id, image, description, product_id) FROM stdin;
5	photos/banners/slider-bg1_NiSI29S.jpg	jjfhgfjfkufkfgkhgfkfkjhj	10
8	photos/banners/slider-bnr_oYdrnOn.jpg	iPhone 11 Technical Specifications · Liquid Retina HD display · 15.5 cm / 6.1‑inch	40
\.


--
-- Data for Name: productmanagement_coupon; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.productmanagement_coupon (id, coupon_id, coupon_name, coupon_percent, coupon_status, expiry_date, expiry_time) FROM stdin;
13	368e135d	fghligh	20	f	2021-12-23	16:31:00
15	4f9e7cef	gdgfdfgfd	23	f	2021-12-23	19:06:00
\.


--
-- Data for Name: productmanagement_expiredcoupon; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.productmanagement_expiredcoupon (id, coupon_id, user_id) FROM stdin;
\.


--
-- Data for Name: productmanagement_imagegallery; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.productmanagement_imagegallery (id, image, product_id_id) FROM stdin;
120	photos/products/Lenovo_Ideapad_3_1_g6Lupf8.png	42
121	photos/products/Lenovo_Ideapad_3_2.png	42
122	photos/products/Lenovo_Ideapad_3_3.png	42
123	photos/products/Lenovo_Ideapad_3_4.png	42
29	photos/products/iqoo_z32_Jps15cU.png	9
32	photos/products/iqoo_z33_CkzKcnK.png	9
30	photos/products/iqoo_z34_0nNp3fR.png	9
31	photos/products/iqoo_z34_KnbW7hd.png	9
33	photos/products/mi-redmi-9-lpddr4x-original-imafv5kypkgfqupf_eGoVCco.jpg	10
34	photos/products/redmi-9-m2006c3mii-original-imafvgtds4vk6ke8_KooVcNw.jpg	10
35	photos/products/df_JDUa8CL.jpg	10
36	photos/products/mi-redmi-9-lpddr4x-original-imafv5kyuvgxuaea_k2KhA2q.jpg	10
112	photos/products/Iphone_111_ss5xwjX.png	40
113	photos/products/Iphone_112.png	40
114	photos/products/Iphone_113.png	40
115	photos/products/Iphone_114.png	40
116	photos/products/OnePlus_Nord_CE1_RmII6Ew.png	41
117	photos/products/OnePlus_Nord_CE2.png	41
118	photos/products/OnePlus_Nord_CE3.png	41
119	photos/products/OnePlus_Nord_CE4.png	41
92	photos/products/41lU0Q61viL._SL1000__6RNmCaE.jpg	35
93	photos/products/61F7c0jxYL._SL1000__ap3qZcM.jpg	35
94	photos/products/61LX5Blp5FL._SL1000__UoOIY1g.jpg	35
95	photos/products/61XR0oGhF6L._SL1000__00IuVD1.jpg	35
\.


--
-- Data for Name: productmanagement_products; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.productmanagement_products (id, product_name, slug, description, mrp, sale_price, stocks, is_available, created_date, modified_date, sub_category_id, product_cover, old_sale_price, expiry_date, offer_name, offer_percent, offer_status, offer_applied, category_id) FROM stdin;
35	Dell inspiron 3501	Dell-inspiron-3501	Processor:11th Generation Intel Core i5-1135G7 Processor (8MB Cache, up to 4.2 GHz)\r\nMemory & Storage:8GB RAM | 256GB M.2 PCIe NVMe Solid State Drive + 1TB 5400 rpm 2.5" SATA Hard Drive	30000	25000	6	t	2021-12-03 20:03:56.231757+05:30	2021-12-03 20:03:56.231779+05:30	18	photos/products/Dell_inspiron_35011.png	\N	\N	\N	\N	False	\N	24
42	Lenovo Ideapad 3 	Lenovo-Ideapad-3-	Processor: 5th Gen AMD Ryzen 5 - 5500U | Speed: 2.1 GHz (Base) - 4.0 GHz (Max) | 6 Cores | 8MB Cache\r\nDisplay: 14" FHD (1920x1080)| IPS Technology | 300Nits Brightness	50000	47000	27	t	2021-12-10 21:33:17.79233+05:30	2021-12-10 21:33:17.792389+05:30	23	photos/products/Lenovo_Ideapad_3_1.png	\N	\N	\N	\N	False	\N	24
41	OnePlus Nord CE	OnePlus-Nord-CE	64MP+8MP+2MP triple rear camera with 1080p video at 30/60 fps, 4k 30 fps | 16MP front camera with 1080p video at 30/60 fps.\r\n6.43-inch, 90Hz fluid AMOLED display with 2400 x 1080 pixels resolution | 410ppi\r\nMemory, Storage & SIM: 8GB RAM | 128GB internal memory on UFS 2.1 storage system.	25000	23000	11	t	2021-12-10 21:21:12.203887+05:30	2021-12-10 21:21:12.203924+05:30	22	photos/products/OnePlus_Nord_CE1.png	\N	\N	\N	\N	False	\N	2
9	iqoo z3	iqoo-z3	Qualcomm Snapdragon 768G 5G processor, 7nm chip and octa-core processor.\r\n55W FlashCharge can charge the 4400mAh battery up to 50% in just 19 minutes* and a full charge in just 50 minutes.	20000	19000	7	t	2021-11-15 15:16:36.190881+05:30	2021-11-15 15:16:36.190901+05:30	21	photos/products/iqoo_z31.png	\N	\N	\N	\N	False	\N	2
10	Redmi 9	Redmi-9	13+2MP Rear camera with AI Portrait, AI scene recognition, HDR, Pro mode | 5MP front facing camera\r\n16.58 centimeters (6.53-inch) HD+ multi-touch capacitive touchscreen with 1600 x 720 pixels resolution, 268 ppi pixel density, 20:9 aspect ratio	10000	8999	9	t	2021-11-15 16:18:39.471273+05:30	2021-11-15 16:18:39.471394+05:30	6	photos/products/Redmi_91.png	\N	\N	\N	\N	False	\N	2
40	Iphone 11	Iphone-11	6.1-inch (15.4 cm diagonal) Liquid Retina HD LCD display\r\nWater and dust resistance (2 meters for up to 30 minutes, IP68)\r\nDual-camera system with 12MP Ultra Wide and Wide cameras; Night mode, Portrait mode, and 4K video up to 60fps\r\n12MP TrueDepth front camera with Portrait mode, 4K video, and Slo-Mo	49000	47000	5	t	2021-12-10 21:08:38.262846+05:30	2021-12-10 21:08:38.262927+05:30	19	photos/products/Iphone_111_H7FUDAc.png	\N	\N	\N	\N	False	\N	2
\.


--
-- Data for Name: useraccount_accounts; Type: TABLE DATA; Schema: public; Owner: vysakhkannan
--

COPY public.useraccount_accounts (id, password, last_login, first_name, last_name, username, email, phone_number, date_joined, last_joined, is_admin, is_staff, is_active, is_superadmin, wallet_amount, referral_code) FROM stdin;
8	pbkdf2_sha256$260000$5bNsG5JDMU3zeCBSZMsykX$/Q1PO9TVPeumN4zn9Doymgm7cgzv1FvEY0/VbXZ9CVo=	\N	anu	rag	anu123	anu34@gmail.com	1234567890	2021-11-08 14:54:55.188944+05:30	2021-11-08 14:54:55.18897+05:30	f	f	t	f	0	\N
28	pbkdf2_sha256$260000$75e2a6BAknQg8S97VqKvxm$t1ycsiyR6hSijyI4o60UQp+EsHaERPg6hgzZU2gJi4w=	\N	fgdfgdfgdf	bvbvcbvb	problem234	feeredf@gmail.com	9856324512	2021-12-08 09:34:14.585139+05:30	2021-12-08 09:34:14.585155+05:30	f	f	t	f	10	ab7b1410
20	pbkdf2_sha256$260000$tEPadY8wuasUJZQyvX6mZM$pmYtHbgcEz25baaraZXoJq9V23aW6uLu67wEmC4r3bE=	\N	sai	medha	saimedha	sai@gmail.com	9526949411	2021-11-24 18:02:47.631361+05:30	2021-11-24 18:02:47.631383+05:30	f	f	f	f	0	\N
21	pbkdf2_sha256$260000$ajBip3ItJASKxYIFvJEtwY$b4twoqe78jEWpTpBa+asU68GQp/V7jsnug8/hcMC3Xo=	\N	ghfghfgh	fghfghfhf	sdfsdf344	fertewrt@gmail.com	2589637415	2021-12-07 18:55:48.71684+05:30	2021-12-07 18:55:48.716855+05:30	f	f	t	f	0	d420cb2f
3	pbkdf2_sha256$260000$sTC8u6pXNNBLOiTNRgU6Gi$WNqW+slJ87TsBEve2T6fl81EoHjPKmKLOgs/ixtrTiw=	\N	Vysakh	kannan	vysak811	hjdfhkjsd@gmail.com	09400973003	2021-11-08 12:53:33.317953+05:30	2021-11-08 12:53:33.317967+05:30	f	f	t	f	0	\N
22	pbkdf2_sha256$260000$XB736XvoCRL2wFlOQSTcpB$VBE9tdXcClQ1jMAmy359YKORmexWl0aepReVqcvpsYE=	\N	fghfgfghfg	fghfdghfgh	fdgfdgdsfg23	fddff@gmail.com	1234568547	2021-12-07 20:03:46.570436+05:30	2021-12-07 20:03:46.57062+05:30	f	f	t	f	0	ce46bc60
23	pbkdf2_sha256$260000$6veFce5KD9VIVstiKaGh4p$wqrvV4j0GVLnQTqZwdSIEf5Mx25VRICR8uwjX0iqTl4=	\N	bnmbcmbnm	cmcvbmc	gdfgfd56	cvbmcv@gmail.com	09876543256	2021-12-07 20:05:44.74008+05:30	2021-12-07 20:05:44.740098+05:30	f	f	t	f	0	a312db5c
10	pbkdf2_sha256$260000$jYKToZMdFnRrObNaXcm97A$8/j64XImM1/7nvuS81ajEmqTDHmAfZGvQOcPtDlGQ74=	\N	abhi	jith	abhi123	abhi123@gmail.com	123456789	2021-11-08 15:05:58.491071+05:30	2021-11-08 15:05:58.491085+05:30	f	f	f	f	0	\N
11	pbkdf2_sha256$260000$RFKQ1Hlu6b3rJngBvDdKDS$ecIwsURAIwGiGPnKBsqGyS0YGyY94Y8oGYb/t2JN18I=	\N	swalih	t	swalih123	swalih@gmail.com	1234567890	2021-11-08 17:11:53.252458+05:30	2021-11-08 17:11:53.252517+05:30	f	f	f	f	0	\N
12	pbkdf2_sha256$260000$eAgHC1pCaD5gaRQipmLhMy$PQjNJjS2HKC/DVoDbzmg6SYC2zE4EDoJKd9RBM3SxFw=	\N	renjith	r	renjith123	renjith13@gmail.com	1234567890	2021-11-08 17:27:02.716682+05:30	2021-11-08 17:27:02.716701+05:30	f	f	f	f	0	\N
2	pbkdf2_sha256$260000$YXWPESII3VoV0FMK6CGeij$f/Fl4C+DeXFpQYObr4UsI2ZjIhwfZcF5gx0uM6SRmXY=	2021-11-08 17:28:12.45065+05:30	vysakh	kannan	vysakh	vysakh@gmail.com		2021-11-08 10:46:52.566964+05:30	2021-11-08 10:46:52.566979+05:30	t	t	t	t	0	\N
9	pbkdf2_sha256$260000$Kf6CODUA0Wo2xRqv4IK3KD$eA7C7NDKWGxfDpdNkSaB6E5aPYXH7iaMHdc8W0yyvgU=	\N	devi	c	devi23	devi23@gmail.com	1234567890	2021-11-08 15:00:49.906495+05:30	2021-11-08 15:00:49.906513+05:30	f	f	t	f	0	\N
4	pbkdf2_sha256$260000$UjbenaprG7THMb59UrHIc0$BxrBZGH4LGOFnT0Ffp1QKgt8iOpwOpduYzcqDMqEj2o=	\N	adith	md	adith23434	adith344@gmail.com	7894561230	2021-11-08 14:01:36.813784+05:30	2021-11-08 14:01:36.813802+05:30	f	f	t	f	0	\N
26	pbkdf2_sha256$260000$mNlV02rD3FI2DDbhMKRj79$p4iaiGVnvsmP82jayWtexF0yv3FM1B0uK7Lr3na0zNs=	\N	fdgdfgdfgdf	vcbcvbvcb	jhglksdhk45	dfsdryyur@gmail.com	1234567864	2021-12-07 21:13:05.204537+05:30	2021-12-07 21:13:05.204555+05:30	f	f	t	f	10	c9bef6a0
15	pbkdf2_sha256$260000$5WYRNNXgWK8Tq9DpJ43s8O$A/OKlpNpWeJIL3SwDRgBic8treDQlgp9TP9vIGkS1w4=	2021-11-09 11:27:23.763181+05:30	renjith	r,	renjith007	renjith123@gmail.com	12345678	2021-11-09 11:21:12.152216+05:30	2021-11-09 11:21:12.153758+05:30	f	f	t	f	0	\N
24	pbkdf2_sha256$260000$0KVwbh0xugiPRNi33uh43V$kDE+ijSTCSkCCczV3L3ZD0NuJxEvhlIbRJGKYiIg5zQ=	2021-12-07 21:14:35.895479+05:30	gdfgdfgdf	bbdfdsb	fdgdfgdf343	dfgdfgd@gmail.com	7418529632	2021-12-07 20:08:03.642724+05:30	2021-12-07 20:08:03.642738+05:30	f	f	t	f	10	9d0cb2a7
25	pbkdf2_sha256$260000$sno266T4jqjycSH67flUs0$EVp9HrwUoaTNpdASp8QwKC+nTT+0Bj/4FUXFPOBc/LE=	\N	fdgdfgdfg	dfdhdfhd	qwerty	dfgdfs@gmail.com	7894568946	2021-12-07 21:10:30.544277+05:30	2021-12-07 21:10:30.545817+05:30	f	f	t	f	0	c6cb0181
13	pbkdf2_sha256$260000$AVDte94DtgYfJcdtoFS0OH$pKspOS7MUlZgblU1jKS9h4D1g1pyxynphaaHsofDoFg=	2021-11-08 20:44:09.352469+05:30	akash	p	akash56	akash45@gmail.com	46897123	2021-11-08 17:30:06.222948+05:30	2021-11-08 17:30:06.222961+05:30	f	f	f	f	0	\N
5	pbkdf2_sha256$260000$YxCvydj0eGxSqK6TJtXjNf$RilnrMXRYegKrLe44LSF/Rl/tM370vznrKk/IxHiMew=	\N	Kannan	MA	kannan321	kannanma@gmail.com	9447809331	2021-11-08 14:06:51.443479+05:30	2021-11-08 14:06:51.443491+05:30	f	f	t	f	0	\N
18	pbkdf2_sha256$260000$Ca81Wrbhj31h6F7NFnIMVg$4pY/N8mAUD9KKW4OGNJ2+Irhs0hKtEaiOoSCFwcxIv4=	\N	niyas	tk	niyas3003	niyasss@gmail.com	9562127608	2021-11-09 20:57:30.531174+05:30	2021-11-09 20:57:30.531193+05:30	f	f	t	f	0	\N
6	pbkdf2_sha256$260000$EnFcSkGZexGwOfGSQQcYTd$bw7Zr03NjHg1I1+p8MMC8o+HUrSmOgOU2rbFoHWxLsM=	\N	vishnu	kanth	vishnu34	vishnu34@gmail.com	1234567890	2021-11-08 14:37:43.246637+05:30	2021-11-08 14:37:43.24665+05:30	f	f	t	f	10	\N
7	pbkdf2_sha256$260000$sdd5IQ9o9tPPBDt4u3ChJi$plfybTT1hoYhnhwdlgs9itcMW8sG7YXYSusCjs293BQ=	\N	luttappi	etete	luttappi43	luttappi234@gmail.com	123456789	2021-11-08 14:46:37.9431+05:30	2021-11-08 14:46:37.943113+05:30	f	f	t	f	0	\N
27	pbkdf2_sha256$260000$wDTMzD964XvSqirQmjAYxU$t+UozWu+qf03eV96Hoki03STyFvfGT2NWQ61E24FTb0=	\N	dffghcvvcb	vvcvcbbv	uffsessd	rgerte43@gmail.com	9874568575	2021-12-08 09:25:41.956937+05:30	2021-12-08 09:25:41.956952+05:30	f	f	t	f	0	ffde8fdc
31	pbkdf2_sha256$260000$kRAeiwuRF8A1m1Nf36As5m$zD1BW6WKjbmYRmVjtU58SToH2QEDN6lB6yUFwP4st6E=	\N	ajas	augustin	ajas123	ajasaugustin@gamail.com	9497745709	2021-12-11 10:50:10.590018+05:30	2021-12-11 10:50:10.590033+05:30	f	f	t	f	0	d6f591eb
30	pbkdf2_sha256$260000$PMylYqVO7I7b9vO5dKTlW3$GUBLEmrR9pbuOb2lazpoO3zG1Fxbnd4OqBnZmNeYM6c=	2021-12-10 12:05:13.231429+05:30	rahul	ravi	rahulravi21	rahulravi@gmail.com	9562569622	2021-12-10 11:47:36.524214+05:30	2021-12-10 11:47:36.524228+05:30	f	f	t	f	0	4d66f2f2
29	pbkdf2_sha256$260000$9iPKkNsRO0xODk1tzliAaa$o1HuKd3yX86U5JDTiiy4eR1GJ6WJ9yIZ4EYpAa9ZYJM=	\N	mejo	k	mejokkk	mejok@gmail.com	9526467702	2021-12-10 11:21:55.656715+05:30	2021-12-10 11:21:55.65673+05:30	f	f	t	f	0	745c6fa1
17	pbkdf2_sha256$260000$69fZSoN4RbEkWxP9VcxiiF$BHN5rSWowLuIWfPZ5x0OgedDxFTxOrbI4wfEYz0Zvjo=	2021-12-12 16:33:03.477265+05:30	Vysakh	Kannan	vysakhkannan811	vyskhkannan811@gmail.com	9400973003	2021-11-09 18:16:50.275402+05:30	2021-11-09 18:16:50.277193+05:30	f	f	t	f	0	\N
1	pbkdf2_sha256$260000$rWrxZJJuEURFi8gVTiyP0C$HGpwqbR8uTB17A+RN0F7oyC9lkI5pdnsrJEpWGf73gI=	2021-12-10 17:05:37.393464+05:30			admin	admin1223@gmail.com		2021-11-08 01:11:06.330224+05:30	2021-11-08 01:11:06.3307+05:30	t	t	t	t	0	\N
14	pbkdf2_sha256$260000$3ngBEJNgjUMpoBEtONcpFA$a1l9Jh7ghpZtrvWzDa43/hCmHOhppHGnap9aYImtTOs=	2021-12-11 18:29:05.75481+05:30	vishnu	kanth	vishnu43	vishnu13@gmail.com	123456789	2021-11-08 20:49:39.184086+05:30	2021-11-08 20:49:39.184107+05:30	f	f	t	f	0	05605a5e
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: cart_cartitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.cart_cartitems_id_seq', 571, true);


--
-- Name: cart_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.cart_order_id_seq', 109, true);


--
-- Name: cart_orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.cart_orderitems_id_seq', 126, true);


--
-- Name: cart_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.cart_payment_id_seq', 73, true);


--
-- Name: cart_useraddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.cart_useraddress_id_seq', 15, true);


--
-- Name: cart_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.cart_wishlist_id_seq', 7, true);


--
-- Name: categorymanagement_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.categorymanagement_category_id_seq', 25, true);


--
-- Name: categorymanagement_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.categorymanagement_offer_id_seq', 25, true);


--
-- Name: categorymanagement_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.categorymanagement_subcategory_id_seq', 23, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 67, true);


--
-- Name: productmanagement_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.productmanagement_banner_id_seq', 8, true);


--
-- Name: productmanagement_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.productmanagement_coupon_id_seq', 17, true);


--
-- Name: productmanagement_expiredcoupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.productmanagement_expiredcoupon_id_seq', 9, true);


--
-- Name: productmanagement_imagegallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.productmanagement_imagegallery_id_seq', 123, true);


--
-- Name: productmanagement_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.productmanagement_products_id_seq', 42, true);


--
-- Name: useraccount_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vysakhkannan
--

SELECT pg_catalog.setval('public.useraccount_accounts_id_seq', 31, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: cart_cartitems cart_cartitems_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_cartitems
    ADD CONSTRAINT cart_cartitems_pkey PRIMARY KEY (id);


--
-- Name: cart_order cart_order_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_order
    ADD CONSTRAINT cart_order_pkey PRIMARY KEY (id);


--
-- Name: cart_orderitems cart_orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_pkey PRIMARY KEY (id);


--
-- Name: cart_payment cart_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_payment
    ADD CONSTRAINT cart_payment_pkey PRIMARY KEY (id);


--
-- Name: cart_useraddress cart_useraddress_email_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_useraddress
    ADD CONSTRAINT cart_useraddress_email_key UNIQUE (email);


--
-- Name: cart_useraddress cart_useraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_useraddress
    ADD CONSTRAINT cart_useraddress_pkey PRIMARY KEY (id);


--
-- Name: cart_wishlist cart_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_wishlist
    ADD CONSTRAINT cart_wishlist_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_category categorymanagement_category_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_category
    ADD CONSTRAINT categorymanagement_category_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_category categorymanagement_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_category
    ADD CONSTRAINT categorymanagement_category_slug_key UNIQUE (slug);


--
-- Name: categorymanagement_offer categorymanagement_offer_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_offer
    ADD CONSTRAINT categorymanagement_offer_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_subcategory categorymanagement_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_subcategory
    ADD CONSTRAINT categorymanagement_subcategory_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_subcategory categorymanagement_subcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_subcategory
    ADD CONSTRAINT categorymanagement_subcategory_slug_key UNIQUE (slug);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: productmanagement_banner productmanagement_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_banner
    ADD CONSTRAINT productmanagement_banner_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_coupon productmanagement_coupon_coupon_id_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_coupon
    ADD CONSTRAINT productmanagement_coupon_coupon_id_key UNIQUE (coupon_id);


--
-- Name: productmanagement_coupon productmanagement_coupon_coupon_name_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_coupon
    ADD CONSTRAINT productmanagement_coupon_coupon_name_key UNIQUE (coupon_name);


--
-- Name: productmanagement_coupon productmanagement_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_coupon
    ADD CONSTRAINT productmanagement_coupon_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_expiredcoupon productmanagement_expiredcoupon_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon
    ADD CONSTRAINT productmanagement_expiredcoupon_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_imagegallery productmanagement_imagegallery_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_imagegallery
    ADD CONSTRAINT productmanagement_imagegallery_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_products productmanagement_products_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_products_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_products productmanagement_products_product_name_ffb02240_uniq; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_products_product_name_ffb02240_uniq UNIQUE (product_name);


--
-- Name: productmanagement_products productmanagement_products_slug_3a3a8443_uniq; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_products_slug_3a3a8443_uniq UNIQUE (slug);


--
-- Name: useraccount_accounts useraccount_accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.useraccount_accounts
    ADD CONSTRAINT useraccount_accounts_email_key UNIQUE (email);


--
-- Name: useraccount_accounts useraccount_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.useraccount_accounts
    ADD CONSTRAINT useraccount_accounts_pkey PRIMARY KEY (id);


--
-- Name: useraccount_accounts useraccount_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.useraccount_accounts
    ADD CONSTRAINT useraccount_accounts_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cart_cartitems_products_id_id_d1a35567; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_cartitems_products_id_id_d1a35567 ON public.cart_cartitems USING btree (products_id_id);


--
-- Name: cart_cartitems_user_id_9647bf4e; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_cartitems_user_id_9647bf4e ON public.cart_cartitems USING btree (user_id);


--
-- Name: cart_order_user_id_279b5d53; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_order_user_id_279b5d53 ON public.cart_order USING btree (user_id);


--
-- Name: cart_orderitems_order_id_6f7c3092; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_orderitems_order_id_6f7c3092 ON public.cart_orderitems USING btree (order_id);


--
-- Name: cart_orderitems_products_id_id_e065597d; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_orderitems_products_id_id_e065597d ON public.cart_orderitems USING btree (products_id_id);


--
-- Name: cart_orderitems_user_id_cbe17fea; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_orderitems_user_id_cbe17fea ON public.cart_orderitems USING btree (user_id);


--
-- Name: cart_payment_order_id_1c722b45; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_payment_order_id_1c722b45 ON public.cart_payment USING btree (order_id);


--
-- Name: cart_payment_user_id_8292ee31; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_payment_user_id_8292ee31 ON public.cart_payment USING btree (user_id);


--
-- Name: cart_useraddress_email_3701f3d4_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_useraddress_email_3701f3d4_like ON public.cart_useraddress USING btree (email varchar_pattern_ops);


--
-- Name: cart_useraddress_user_id_8b5f4943; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_useraddress_user_id_8b5f4943 ON public.cart_useraddress USING btree (user_id);


--
-- Name: cart_wishlist_products_id_id_28f07206; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_wishlist_products_id_id_28f07206 ON public.cart_wishlist USING btree (products_id_id);


--
-- Name: cart_wishlist_user_id_c35eec54; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX cart_wishlist_user_id_c35eec54 ON public.cart_wishlist USING btree (user_id);


--
-- Name: categorymanagement_category_slug_0204e825_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX categorymanagement_category_slug_0204e825_like ON public.categorymanagement_category USING btree (slug varchar_pattern_ops);


--
-- Name: categorymanagement_subcategory_catergory_id_id_4b57f64a; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX categorymanagement_subcategory_catergory_id_id_4b57f64a ON public.categorymanagement_subcategory USING btree (catergory_id_id);


--
-- Name: categorymanagement_subcategory_slug_34294104_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX categorymanagement_subcategory_slug_34294104_like ON public.categorymanagement_subcategory USING btree (slug varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: productmanagement_banner_product_id_9bbfdcc0; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_banner_product_id_9bbfdcc0 ON public.productmanagement_banner USING btree (product_id);


--
-- Name: productmanagement_coupon_coupon_id_73e51531_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_coupon_coupon_id_73e51531_like ON public.productmanagement_coupon USING btree (coupon_id varchar_pattern_ops);


--
-- Name: productmanagement_coupon_coupon_name_e812af40_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_coupon_coupon_name_e812af40_like ON public.productmanagement_coupon USING btree (coupon_name varchar_pattern_ops);


--
-- Name: productmanagement_expiredcoupon_coupon_id_a7833acc; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_expiredcoupon_coupon_id_a7833acc ON public.productmanagement_expiredcoupon USING btree (coupon_id);


--
-- Name: productmanagement_expiredcoupon_user_id_e91931ee; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_expiredcoupon_user_id_e91931ee ON public.productmanagement_expiredcoupon USING btree (user_id);


--
-- Name: productmanagement_imagegallery_product_id_id_e722c849; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_imagegallery_product_id_id_e722c849 ON public.productmanagement_imagegallery USING btree (product_id_id);


--
-- Name: productmanagement_products_category_id_1d77ad65; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_products_category_id_1d77ad65 ON public.productmanagement_products USING btree (category_id);


--
-- Name: productmanagement_products_product_name_ffb02240_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_products_product_name_ffb02240_like ON public.productmanagement_products USING btree (product_name varchar_pattern_ops);


--
-- Name: productmanagement_products_slug_3a3a8443_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_products_slug_3a3a8443_like ON public.productmanagement_products USING btree (slug varchar_pattern_ops);


--
-- Name: productmanagement_products_sub_category_id_555a7e2c; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX productmanagement_products_sub_category_id_555a7e2c ON public.productmanagement_products USING btree (sub_category_id);


--
-- Name: useraccount_accounts_email_fd64abdb_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX useraccount_accounts_email_fd64abdb_like ON public.useraccount_accounts USING btree (email varchar_pattern_ops);


--
-- Name: useraccount_accounts_username_e27d5bd1_like; Type: INDEX; Schema: public; Owner: vysakhkannan
--

CREATE INDEX useraccount_accounts_username_e27d5bd1_like ON public.useraccount_accounts USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartitems cart_cartitems_products_id_id_d1a35567_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_cartitems
    ADD CONSTRAINT cart_cartitems_products_id_id_d1a35567_fk_productma FOREIGN KEY (products_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartitems cart_cartitems_user_id_9647bf4e_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_cartitems
    ADD CONSTRAINT cart_cartitems_user_id_9647bf4e_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_order cart_order_user_id_279b5d53_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_order
    ADD CONSTRAINT cart_order_user_id_279b5d53_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_orderitems cart_orderitems_order_id_6f7c3092_fk_cart_order_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_order_id_6f7c3092_fk_cart_order_id FOREIGN KEY (order_id) REFERENCES public.cart_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_orderitems cart_orderitems_products_id_id_e065597d_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_products_id_id_e065597d_fk_productma FOREIGN KEY (products_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_orderitems cart_orderitems_user_id_cbe17fea_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_user_id_cbe17fea_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_payment cart_payment_order_id_1c722b45_fk_cart_order_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_payment
    ADD CONSTRAINT cart_payment_order_id_1c722b45_fk_cart_order_id FOREIGN KEY (order_id) REFERENCES public.cart_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_payment cart_payment_user_id_8292ee31_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_payment
    ADD CONSTRAINT cart_payment_user_id_8292ee31_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_useraddress cart_useraddress_user_id_8b5f4943_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_useraddress
    ADD CONSTRAINT cart_useraddress_user_id_8b5f4943_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_wishlist cart_wishlist_products_id_id_28f07206_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_wishlist
    ADD CONSTRAINT cart_wishlist_products_id_id_28f07206_fk_productma FOREIGN KEY (products_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_wishlist cart_wishlist_user_id_c35eec54_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.cart_wishlist
    ADD CONSTRAINT cart_wishlist_user_id_c35eec54_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categorymanagement_subcategory categorymanagement_s_catergory_id_id_4b57f64a_fk_categorym; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.categorymanagement_subcategory
    ADD CONSTRAINT categorymanagement_s_catergory_id_id_4b57f64a_fk_categorym FOREIGN KEY (catergory_id_id) REFERENCES public.categorymanagement_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_banner productmanagement_ba_product_id_9bbfdcc0_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_banner
    ADD CONSTRAINT productmanagement_ba_product_id_9bbfdcc0_fk_productma FOREIGN KEY (product_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_expiredcoupon productmanagement_ex_coupon_id_a7833acc_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon
    ADD CONSTRAINT productmanagement_ex_coupon_id_a7833acc_fk_productma FOREIGN KEY (coupon_id) REFERENCES public.productmanagement_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_expiredcoupon productmanagement_ex_user_id_e91931ee_fk_useraccou; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon
    ADD CONSTRAINT productmanagement_ex_user_id_e91931ee_fk_useraccou FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_imagegallery productmanagement_im_product_id_id_e722c849_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_imagegallery
    ADD CONSTRAINT productmanagement_im_product_id_id_e722c849_fk_productma FOREIGN KEY (product_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_products productmanagement_pr_category_id_1d77ad65_fk_categorym; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_pr_category_id_1d77ad65_fk_categorym FOREIGN KEY (category_id) REFERENCES public.categorymanagement_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_products productmanagement_pr_sub_category_id_555a7e2c_fk_categorym; Type: FK CONSTRAINT; Schema: public; Owner: vysakhkannan
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_pr_sub_category_id_555a7e2c_fk_categorym FOREIGN KEY (sub_category_id) REFERENCES public.categorymanagement_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

