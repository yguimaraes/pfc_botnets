-- CREATE DB

CREATE DATABASE botnets_pfc;

CREATE TABLE domains(
	domain varchar(255) PRIMARY KEY,
	length integer,
	is_suspect boolean,
	numeric_count integer,
	alexa_degree integer,
	readable_string_length integer,
	is_in_whitelist boolean,
	requisition_degree integer
);

CREATE TABLE clients(
	client_ip inet PRIMARY KEY,
	count_domain_with_numbers integer,
	average_domain_length real,
	std_domain_length real,
	average_request_interval real,
	std_request_interval real,
	count_request integer,
	average_click_size real,
	minimum_click_size integer,
	count_request_cname integer,
	percentage_request_cname real,
	count_request_a integer,
	percentage_request_a real,
	count_request_mx integer,
	percentage_request_mx real,
	count_request_txt integer,
	percentage_request_txt real
);

CREATE TABLE dns_queries(
	id SERIAL PRIMARY KEY,
	query_time timestamp,
	client_ip inet REFERENCES clients,
	domain varchar(255) REFERENCES domains,
	type varchar(30)
);

-- CLEAR DB

DELETE FROM dns_queries;
DELETE FROM domains;
DELETE FROM clients;
SELECT SETVAL((SELECT pg_get_serial_sequence('dns_queries', 'id')), 1, false);
