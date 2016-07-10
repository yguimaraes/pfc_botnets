#pragma once

#include<string>
#include "client_storage.h"

class ClientExecuter {
protected:
    ClientStorage* client_storage;
public:
    ClientExecuter(std::string type);

    ~ClientExecuter();

	void update();
};