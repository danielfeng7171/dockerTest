#!/bin/bash

# build docker cassandra image
if [ "$MODE" == "prod" ];then
	curl -X POST https://cloud.docker.com/api/build/v1/source/3e177a06-1963-4f4a-a1f6-02415f131350/trigger/9b34cf31-13d1-4781-8cfd-204ad7006b3d/call/
else
	curl -X POST https://cloud.docker.com/api/build/v1/source/2b934f5c-7e42-46b1-b119-b782b8912a0f/trigger/c7e7d653-1699-4ee4-a23d-a38a2c9dce46/call/
fi

# build docker core image
if [ "$MODE" == "prod" ];then
	curl -X POST https://cloud.docker.com/api/build/v1/source/196214e3-b239-4b98-966f-b53474f9c504/trigger/a84b5b2f-16ee-401a-a113-8ddc205dd747/call/
else
	curl -X POST https://cloud.docker.com/api/build/v1/source/d459400d-b9e8-474e-98ea-94f992528b99/trigger/9552bf45-774a-4d88-8b48-cb8415d089c6/call/
fi