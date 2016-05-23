CREATE DATABASE botnets_pfc;

CREATE TABLE dns_queries(
	id SERIAL PRIMARY KEY,
	query_time timestamp,
	client_ip inet REFERENCES clients,
	domain varchar(255) REFERENCES domains,
	type varchar(30)
);

CREATE TABLE domains(
	domain varchar(255) PRIMARY KEY,
	length integer,
	is_suspect boolean,
	numeric_count integer,
	alexa_degree integer
);

CREATE TABLE clients(
	client_ip inet PRIMARY KEY,
	count_suspect_domain_requests integer,
	count_numeric_domain_requests integer,
	count_low_level_domain_requests integer,
	count_total_requests integer,
	domain_length_average real,
	domain_length_std_deviation real,
	dns_request_interval_average real,
	dns_request_interval_std_deviation real,
	count_dns_cname_requests integer,
	percentage_dns_cname_requests real,
	count_dns_txt_requests integer,
	percentage_dns_txt_requests real,
	count_dns_a_requests integer,
	percentage_dns_a_requests real,
	count_dns_mx_requests integer,
	percentage_dns_mx_requests real
);