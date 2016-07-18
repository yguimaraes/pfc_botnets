#pragma once

#include <string>

struct ClientInfo
{
	std::string IpAddress;
	int CountDomainWithNumbers;
	float AverageDomainLength;
	float StdDomainLength;
	float AverageRequestInterval;
	float StdRequestInterval;
	int CountRequest;
	float AverageClickSize;
	int MinimumClickSize;
	int CountRequestCname;
	float PercentageRequestCname;
	int CountRequestA;
	float PercentageRequestA;
	int CountRequestMx;
	float PercentageRequestMx;
	int CountRequestTxt;
	float PercentageRequestTxt;
};