#pragma once
#include "../models/dns_query.h"

class QueryStorage {
public:
	QueryStorage() {
	}
	virtual ~QueryStorage(){

	}
	virtual void save(DnsQuery query) = 0;
};