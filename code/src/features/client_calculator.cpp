#include "client_calculator.h"

	int ClientCalculator::CountDomainWithNumbers(){
		return 0;
	};

	float ClientCalculator::AverageDomainLength(){
		return 0.0;
	};

	float ClientCalculator::StdDomainLength(){
		return 0.0;
	};

	float * ClientCalculator::ArrayRequestInterval(){
		return NULL;
	};

	float ClientCalculator::AverageRequestInterval(){
		return 0.0;
	};

	float ClientCalculator::StdRequestInterval(){
		return 0.0;
	};

	int ClientCalculator::CountRequest(){
		return 0;
	};

	float ClientCalculator::AverageClickSize(){
		return 0.0;
	};

	int ClientCalculator::MinimumClickSize(){
		return 0;
	};

	int ClientCalculator::CountRequestCname(){
		return 0;
	};

	float ClientCalculator::PercentageRequestCname(){
		return 0.0;
	};

	int ClientCalculator::CountRequestA(){
		return 0;
	};

	float ClientCalculator::PercentageRequestA(){
		return 0.0;
	};

	int ClientCalculator::CountRequestMx(){
		return 0;
	};

	float ClientCalculator::PercentageRequestMx(){
		return 0.0;
	};

	int ClientCalculator::CountRequestTxt(){
		return 0;
	};

	float ClientCalculator::PercentageRequestTxt(){
		return 0.0;
	};


ClientCalculator::ClientCalculator(std::string ip_address): ip_address(ip_address){};

ClientInfo * ClientCalculator::get_results(){
	ClientInfo * client_info = new ClientInfo();

	client_info->IpAddress = ip_address;
	client_info->CountDomainWithNumbers = ClientCalculator::CountDomainWithNumbers();
	client_info->AverageDomainLength = ClientCalculator::AverageDomainLength();
	client_info->StdDomainLength = ClientCalculator::StdDomainLength();
	client_info->AverageRequestInterval = ClientCalculator::AverageRequestInterval();
	client_info->StdRequestInterval = ClientCalculator::StdRequestInterval();
	client_info->CountRequest = ClientCalculator::CountRequest();
	client_info->AverageClickSize = ClientCalculator::AverageClickSize();
	client_info->MinimumClickSize = ClientCalculator::MinimumClickSize();
	client_info->CountRequestCname = ClientCalculator::CountRequestCname();
	client_info->PercentageRequestCname = ClientCalculator::PercentageRequestCname();
	client_info->CountRequestA = ClientCalculator::CountRequestA();
	client_info->PercentageRequestA = ClientCalculator::PercentageRequestA();
	client_info->CountRequestMx = ClientCalculator::CountRequestMx();
	client_info->PercentageRequestMx = ClientCalculator::PercentageRequestMx();
	client_info->CountRequestTxt = ClientCalculator::CountRequestTxt();
	client_info->PercentageRequestTxt = ClientCalculator::PercentageRequestTxt();

	return client_info;
};
