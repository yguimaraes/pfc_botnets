#include "../models/dns_query.h"

class QueryStorage {
public:
	virtual ~QueryStorage();
	virtual void save(DnsQuery query) = 0;
};