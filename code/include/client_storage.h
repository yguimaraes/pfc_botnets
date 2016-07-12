#pragma once


class ClientStorage
{
public:
	virtual void save() = 0;
};

class ClientStorageSql: public ClientStorage{
public:
	ClientStorageSql();
	~ClientStorageSql();
	void save();
};