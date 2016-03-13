using namespace std;
#include <iostream>
#include "types/raw_fields.h"

class FeaturesCalculator{
	raw_fields data;
	int number_of_digits;
	void CalculateNumberOfDigits() {
		number_of_digits = 0;
		for(int i=0; i<data.url.size(); i++) {
			if(isdigit(data.url[i]))
				number_of_digits++;
		}
	}
public:
	FeaturesCalculator(raw_fields raw_field){
		data = raw_field;
	}

	void Calculate() {
		CalculateNumberOfDigits();
		//cout << number_of_digits << endl;
	}
};