RESTY_VERSION=1.9.15.1

GATEKEEPER_IMAGE_VERSION=0.0.1

GATEKEEPER_REVISION=master
KEYMASTER_REVISION=master
APID_REVISION=master


build-gatekeeper:
	docker build -t thirtyx/gatekeeper:$(GATEKEEPER_IMAGE_VERSION) --build-arg GATEKEEPER_REVISION=$(GATEKEEPER_REVISION) --build-arg KEYMASTER_REVISION=$(KEYMASTER_REVISION) --build-arg APID_REVISION=$(APID_REVISION) gozerian


build-openresty:
		docker build -t thirtyx/openresty:$(RESTY_VERSION) --build-arg RESTY_VERSION=$(RESTY_VERSION) openresty
