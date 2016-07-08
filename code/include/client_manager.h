#pragma once

#include <string>

using namespace std;

class ClientManager{
	int number_of_digits;

public:
	virtual int DnsRequestNumber(string ip_address) = 0;

	virtual float DomainLengthMean(string ip_address) = 0;

	virtual float DomainLengthStandardDeviation(string ip_address) = 0;

	virtual float * ResquestIntervalTimeArray(string ip_address) = 0;

	virtual float ResquestIntervalMean(string ip_address) = 0;

	virtual float ResquestIntervalStandardDeviation(string ip_address) = 0;
	
	virtual int RequestNxdomainNumber(string ip_address) = 0;

	virtual float RequestNxdomainPercentage(string ip_address) = 0;

	virtual int RequestCnameNumber(string ip_address) = 0;

	virtual float RequestCnamePercentage(string ip_address) = 0;

	virtual int RequestANumber(string ip_address) = 0;

	virtual float RequestAPercentage(string ip_address) = 0;

	virtual int RequestMxNumber(string ip_address) = 0;

	virtual float RequestMxPercentage(string ip_address) = 0;

	virtual int RequestTxtNumber(string ip_address) = 0;

	virtual float RequestTxtPercentage(string ip_address) = 0;

	virtual int MinimumClickSize(string ip_address) = 0;

	virtual int ClickSizeMean(string ip_address) = 0;

	void GetFeatures();

	ClientManager();
};

class ClientManagerSql: public ClientManager{
};

class ClientManagerFile: public ClientManager{
};