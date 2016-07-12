#pragma once

#include <string>

using namespace std;

class ClientCalculator{

public:
	int DnsRequestNumber(string ip_address);

	float DomainLengthMean(string ip_address);

	float DomainLengthStandardDeviation(string ip_address);

	float * ResquestIntervalTimeArray(string ip_address);

	float ResquestIntervalMean(string ip_address);

	float ResquestIntervalStandardDeviation(string ip_address);
	
	int RequestNxdomainNumber(string ip_address);

	float RequestNxdomainPercentage(string ip_address);

	int RequestCnameNumber(string ip_address);

	float RequestCnamePercentage(string ip_address);

	int RequestANumber(string ip_address);

	float RequestAPercentage(string ip_address);

	int RequestMxNumber(string ip_address);

	float RequestMxPercentage(string ip_address);

	int RequestTxtNumber(string ip_address);

	float RequestTxtPercentage(string ip_address);

	int MinimumClickSize(string ip_address);

	int ClickSizeMean(string ip_address);

	ClientCalculator();
};