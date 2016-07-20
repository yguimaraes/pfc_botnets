UPDATE domains x 
SET requisition_degree = y.requisition_count 
FROM (
 SELECT domains.domain, count(DISTINCT dns_queries.client_ip) as requisition_count
 FROM domains INNER JOIN dns_queries ON domains.domain=dns_queries.domain 
 GROUP BY domains.domain
 ) AS y 
WHERE x.domain = y.domain;

UPDATE clients x 
SET average_domain_length = y.average_domain_length 
FROM (
 SELECT clients.client_ip, AVG(domains.length) as average_domain_length
 FROM clients 
 INNER JOIN (
 	SELECT DISTINCT dns_queries.domain, dns_queries.client_ip FROM dns_queries) as z 
 	ON clients.client_ip = z.client_ip
 INNER JOIN domains ON z.domain = domains.domain
 GROUP BY clients.client_ip
 ) AS y 
WHERE x.client_ip = y.client_ip;