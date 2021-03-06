UPDATE domains x 
SET requisition_degree = y.requisition_count 
FROM (
 SELECT domains.domain, count(DISTINCT dns_queries.client_ip) as requisition_count
 FROM domains INNER JOIN dns_queries ON domains.domain=dns_queries.domain 
 GROUP BY domains.domain
 ) AS y 
WHERE x.domain = y.domain;

UPDATE clients x 
SET count_domain_with_numbers = y.count_domain_with_numbers,
	average_domain_length = y.average_domain_length,
	std_domain_length = y.std_domain_length,
	average_requisition_degree = y.average_requisition_degree,
	std_requisition_degree = y.std_requisition_degree,
	minimum_requisition_degree = y.minimum_requisition_degree
FROM (
 SELECT clients.client_ip,
 	COUNT(domains.numeric_count) as count_domain_with_numbers,
 	AVG(domains.length) as average_domain_length, 
 	STDDEV_POP(domains.length) as std_domain_length,
 	AVG(domains.requisition_degree) as average_requisition_degree, 
 	STDDEV_POP(domains.requisition_degree) as std_requisition_degree, 
 	MIN(domains.requisition_degree) as minimum_requisition_degree
 FROM clients 
 INNER JOIN (
 	SELECT DISTINCT dns_queries.domain, dns_queries.client_ip FROM dns_queries) as z 
 	ON clients.client_ip = z.client_ip
 INNER JOIN domains ON z.domain = domains.domain
 GROUP BY clients.client_ip
 ) AS y 
WHERE x.client_ip = y.client_ip;

UPDATE clients x 
SET count_request_not_in_whitelist = y.count_request_not_in_whitelist
FROM (
 SELECT clients.client_ip,
 	COUNT(z.id) as count_request_not_in_whitelist
 FROM clients 
 INNER JOIN (
 	SELECT dns_queries.id, dns_queries.domain, dns_queries.client_ip, dns_queries.log_id FROM dns_queries) as z 
 	ON (clients.client_ip = z.client_ip AND clients.log_id = z.log_id)
 INNER JOIN domains ON (z.domain = domains.domain AND z.log_id = domains.log_id)
 WHERE (domains.is_in_whitelist = false AND domains.log_id = 1)
 GROUP BY clients.client_ip
 ) AS y 
WHERE (x.client_ip = y.client_ip AND x.log_id = 1);

UPDATE clients x 
SET count_request = y.count_request,
count_request_cname = y.count_request_cname,
count_request_a = y.count_request_a,
count_request_mx = y.count_request_mx,
count_request_txt= y.count_request_txt
FROM(
	SELECT clients.client_ip, count(dns_queries.id) as count_request, 
	count(dns_queries.is_type_a) as count_request_a, 
	count(dns_queries.is_type_cname) as count_request_cname,
	count(dns_queries.is_type_mx) as count_request_mx,
	count(dns_queries.is_type_txt) as count_request_txt
	FROM clients INNER JOIN dns_queries ON dns_queries.client_ip = clients.client_ip
	GROUP BY clients.client_ip
) AS y
WHERE x.client_ip = y.client_ip;


#DROP DB
DROP TABLE dns_queries;
DROP TABLE clients;
DROP TABLE domains;

