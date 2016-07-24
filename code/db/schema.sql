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
	average_domain_length numeric,
	std_domain_length numeric,
	average_request_interval real, 
	std_request_interval real, 
	count_request integer,
	count_request_not_in_whitelist integer,
	average_requisition_degree numeric,
	std_requisition_degree numeric,
	minimum_requistion_degree integer,
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
	type varchar(30),
	is_type_a integer,
	is_type_mx integer,
	is_type_txt integer,
	is_type_cname integer
);

-- CLEAR DB

DELETE FROM dns_queries;
DELETE FROM domains;
DELETE FROM clients;
SELECT SETVAL((SELECT pg_get_serial_sequence('dns_queries', 'id')), 1, false);
