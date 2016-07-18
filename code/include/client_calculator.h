#pragma once

#include <string>
#include "client_info.h"

class ClientCalculator{
private:
	std::string ip_address;

	int CountDomainWithNumbers();
	float AverageDomainLength();
	float StdDomainLength();
	float * ArrayRequestInterval();
	float AverageRequestInterval();
	float StdRequestInterval();
	int CountRequest();
	float AverageClickSize();
	int MinimumClickSize();
	int CountRequestCname();
	float PercentageRequestCname();
	int CountRequestA();
	float PercentageRequestA();
	int CountRequestMx();
	float PercentageRequestMx();
	int CountRequestTxt();
	float PercentageRequestTxt();

public:
	ClientCalculator(std::string ip_address);

	ClientInfo * get_results();
};