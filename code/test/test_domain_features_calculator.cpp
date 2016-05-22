#include "../domain_features_calculator.cpp"
#include <iostream>
#include <unordered_set>
#include <string>
#include <iterator>

using namespace std;

int main(){
	// unordered_set<string> prefix;
	// unordered_set<string>::const_iterator elem;
	// prefix.insert("Neptune");
	// prefix.insert("Mercury");
	// for (unordered_set<string>::const_iterator it = prefix.begin(); it != prefix.end(); it++){
	// 	cout << " " << *it << endl;
	// }
	// elem = prefix.find("Mercury");
	// cout << *elem << endl;
	DomainFeaturesCalculator a = DomainFeaturesCalculator("laia");
	DomainFeaturesCalculator b = DomainFeaturesCalculator("2mdn.net");
	DomainFeaturesCalculator c = DomainFeaturesCalculator("googolplex");
	DomainFeaturesCalculator d = DomainFeaturesCalculator("ungover.nable");
	cout << a.isInWhiteList() << endl;
	cout << b.isInWhiteList() << endl;
	cout << a.CalculateDomainLength() << endl;
	cout << b.CalculateDomainLength() << endl;
	cout << c.ReadableStringLength() << endl;
	cout << d.ReadableStringLength() << endl;
	// unordered_set<string> a = unordered_set<string>();
	return 0;
}