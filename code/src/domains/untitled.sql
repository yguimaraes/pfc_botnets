UPDATE domains x
SET requisition_degree = y.requisition_count
FROM (
	SELECT domains.domain, count(DISTINCT dns_queries.client_ip) as requisition_count
	FROM domains INNER JOIN dns_queries ON domains.domain=dns_queries.domain 
	GROUP BY domains.domain
) AS y
WHERE x.domain = y.domain;