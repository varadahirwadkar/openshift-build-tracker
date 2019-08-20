###############################################################################
# Licensed Materials - Property of IBM Copyright IBM Corporation 2017. All Rights Reserved.
# U.S. Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP
# Schedule Contract with IBM Corp.
#
# Contributors:
#  IBM Corporation - initial API and implementation
###############################################################################

SHELL := /bin/bash
TOP := $(BUILD_DIR)
DATE ?= $(shell date +%Y%m%d)

AUTH_URL ?=
OS_TENANT_NAME ?= ibm-default
AVAILABILITY_ZONE ?= 
OS_IMAGE ?=
IMAGE_DISTRO ?= 
NUM_OF_MASTERS ?= 1
NUM_OF_MANAGERS ?= 0
NUM_OF_WORKERS ?= 0
NUM_OF_VA ?= 0
NUM_OF_PROXIES ?= 0
NUM_OF_GLUSTERS ?= 0
CREATE_STORAGE ?= false
SYSTEM_TUNING ?= disabled
ICP_CONFIG_FILE ?= 
OS_PRIVATE_NETWORK ?= icp_network
OS_NETWORK ?= icp_network
VA ?= disabled
ISTIO ?= disabled
GLUSTER_FS ?= disabled
MCM ?= disabled
PSN ?= disabled
NPDD ?= disabled
MINIO ?= disabled
KNATIVE ?= disabled
OFFLINE_IMAGE_LOCATION ?= 

MASTER_TEMPLATE ?= 
MANAGER_TEMPLATE ?= 
WORKER_TEMPLATE ?= 
VA_TEMPLATE ?= 
PROXY_TEMPLATE ?= 
GLUSTER_TEMPLATE ?=  

TASK ?=
TERRAFORM_DIR ?= .
TERRAFORM_VARS_FILE ?= $(TASK).tfvars

# ---------------------------------
## ----- default, init, keys -----
# ---------------------------------

.PHONY: default
default:: test-icp-daily-online;

.PHONY: init\:
init::
ifndef MASTER_TEMPLATE
	$(info MASTER_TEMPLATE not defined)
	exit -1
endif

# ---------------------------------
## ----- daily-online -----
# ---------------------------------

.PHONY: test-icp-daily-online\:
## Create power build on PowerVC environment
test-icp-daily-online: %test-icp-daily-online:
ifndef AUTH_URL
	$(info AUTH_URL not defined, please define auth_url)
	exit -1
endif
	@$(shell sed -e "s|__AUTH_URL__|$(AUTH_URL)|g" -e "s|__OS_TENANT_NAME__|$(OS_TENANT_NAME)|g" -e "s|__AVAILABILITY_ZONE__|$(AVAILABILITY_ZONE)|g" -e "s|__OS_IMAGE__|$(OS_IMAGE)|g" -e "s|__IMAGE_DISTRO__|$(IMAGE_DISTRO)|g" -e "s|__CREATE_STORAGE__|$(CREATE_STORAGE)|g" -e "s|__SYSTEM_TUNING__|$(SYSTEM_TUNING)|g" \
	-e "s|__SYSTEM_TUNING__|$(SYSTEM_TUNING)|g" -e "s|__NUM_OF_MASTERS__|$(NUM_OF_MASTERS)|g" -e "s|__NUM_OF_MANAGERS__|$(NUM_OF_MANAGERS)|g" -e "s|__NUM_OF_WORKERS__|$(NUM_OF_WORKERS)|g" -e "s|__NUM_OF_VA__|$(NUM_OF_VA)|g" -e "s|__NUM_OF_PROXIES__|$(NUM_OF_PROXIES)|g" -e "s|__NUM_OF_GLUSTERS__|$(NUM_OF_GLUSTERS)|g" \
	-e "s|__ICP_CONFIG_FILE__|$(ICP_CONFIG_FILE)|g" -e "s|__OS_PRIVATE_NETWORK__|$(OS_PRIVATE_NETWORK)|g" -e "s|__OS_NETWORK__|$(OS_NETWORK)|g"  \
	-e "s|__VA__|$(VA)|g" -e "s|__ISTIO__|$(ISTIO)|g" -e "s|__GLUSTER_FS__|$(GLUSTER_FS)|g" -e "s|__MCM__|$(MCM)|g" -e "s|__PSN__|$(PSN)|g" -e "s|__NPDD__|$(NPDD)|g" \
	-e "s|__MINIO__|$(MINIO)|g" -e "s|__KNATIVE__|$(KNATIVE)|g" \
	-e "s|__MASTER_TEMPLATE__|$(MASTER_TEMPLATE)|g" -e "s|__MANAGER_TEMPLATE__|$(MANAGER_TEMPLATE)|g" -e "s|__WORKER_TEMPLATE__|$(WORKER_TEMPLATE)|g" -e "s|__VA_TEMPLATE__|$(VA_TEMPLATE)|g" -e "s|__PROXY_TEMPLATE__|$(PROXY_TEMPLATE)|g" -e "s|__GLUSTER_TEMPLATE__|$(GLUSTER_TEMPLATE)|g" templates/$(TERRAFORM_VARS_FILE).template > $(TERRAFORM_VARS_FILE).template)
	@echo -e        "\nAUTH_URL" = $(AUTH_URL)\
        "\nOS_TENANT_NAME" = $(OS_TENANT_NAME)\
        "\nAVAILABILITY_ZONE" = $(AVAILABILITY_ZONE)\
        "\nOS_IMAGE" = $(OS_IMAGE)\
        "\nIMAGE_DISTRO" = $(IMAGE_DISTRO)\
        "\nNUM_OF_MASTERS" = $(NUM_OF_MASTERS)\
        "\nNUM_OF_MANAGERS" = $(NUM_OF_MANAGERS)\
        "\nNUM_OF_WORKERS" = $(NUM_OF_WORKERS)\
        "\nNUM_OF_VA" = $(NUM_OF_VA)\
        "\nNUM_OF_PROXIES" = $(NUM_OF_PROXIES)\
        "\nNUM_OF_GLUSTERS" = $(NUM_OF_GLUSTERS)\
        "\nCREATE_STORAGE" = $(CREATE_STORAGE)\
        "\nSYSTEM_TUNING" = $(SYSTEM_TUNING)\
        "\nICP_CONFIG_FILE" = $(ICP_CONFIG_FILE)\
        "\nOS_PRIVATE_NETWORK" = $(OS_PRIVATE_NETWORK)\
        "\nOS_NETWORK" = $(OS_NETWORK)\
        "\nVA" = $(VA)\
        "\nISTIO" = $(ISTIO)\
        "\nGLUSTER_FS" = $(GLUSTER_FS)\
        "\nMCM" = $(MCM)\
        "\nPSN" = $(PSN)\
        "\nNPDD" = $(NPDD)\
        "\nMINIO" = $(MINIO)\
        "\nKNATIVE" = $(KNATIVE)\
        "\nMASTER_TEMPLATE" = $(MASTER_TEMPLATE)\
        "\nMANAGER_TEMPLATE" = $(MANAGER_TEMPLATE)\
        "\nWORKER_TEMPLATE" = $(WORKER_TEMPLATE)\
        "\nVA_TEMPLATE" = $(VA_TEMPLATE)\
        "\nPROXY_TEMPLATE" = $(PROXY_TEMPLATE)\
        "\nGLUSTER_TEMPLATE" = $(GLUSTER_TEMPLATE)


# ---------------------------------
## ----- daily-offline -----
# ---------------------------------

.PHONY: test-icp-daily-offline\:
## Create power build on PowerVC tenant
test-icp-daily-offline: %test-icp-daily-offline:
ifndef AUTH_URL
	$(info AUTH_URL not defined, please define auth_url)
	exit -1
endif
	@$(shell sed -e "s|__AUTH_URL__|$(AUTH_URL)|g" -e "s|__OS_TENANT_NAME__|$(OS_TENANT_NAME)|g" -e "s|__AVAILABILITY_ZONE__|$(AVAILABILITY_ZONE)|g" -e "s|__OS_IMAGE__|$(OS_IMAGE)|g" -e "s|__IMAGE_DISTRO__|$(IMAGE_DISTRO)|g" -e "s|__CREATE_STORAGE__|$(CREATE_STORAGE)|g" -e "s|__SYSTEM_TUNING__|$(SYSTEM_TUNING)|g" \
	-e "s|__SYSTEM_TUNING__|$(SYSTEM_TUNING)|g" -e "s|__NUM_OF_MASTERS__|$(NUM_OF_MASTERS)|g" -e "s|__NUM_OF_MANAGERS__|$(NUM_OF_MANAGERS)|g" -e "s|__NUM_OF_WORKERS__|$(NUM_OF_WORKERS)|g" -e "s|__NUM_OF_VA__|$(NUM_OF_VA)|g" -e "s|__NUM_OF_PROXIES__|$(NUM_OF_PROXIES)|g" -e "s|__NUM_OF_GLUSTERS__|$(NUM_OF_GLUSTERS)|g" \
	-e "s|__ICP_CONFIG_FILE__|$(ICP_CONFIG_FILE)|g" -e "s|__OS_PRIVATE_NETWORK__|$(OS_PRIVATE_NETWORK)|g" -e "s|__OS_NETWORK__|$(OS_NETWORK)|g"  \
	-e "s|__VA__|$(VA)|g" -e "s|__ISTIO__|$(ISTIO)|g" -e "s|__GLUSTER_FS__|$(GLUSTER_FS)|g" -e "s|__MCM__|$(MCM)|g" -e "s|__PSN__|$(PSN)|g" -e "s|__NPDD__|$(NPDD)|g" \
	-e "s|__MINIO__|$(MINIO)|g" -e "s|__KNATIVE__|$(KNATIVE)|g" -e "s|__OFFLINE_IMAGE_LOCATION__|$(OFFLINE_IMAGE_LOCATION)|g" \
	-e "s|__MASTER_TEMPLATE__|$(MASTER_TEMPLATE)|g" -e "s|__MANAGER_TEMPLATE__|$(MANAGER_TEMPLATE)|g" -e "s|__WORKER_TEMPLATE__|$(WORKER_TEMPLATE)|g" -e "s|__VA_TEMPLATE__|$(VA_TEMPLATE)|g" -e "s|__PROXY_TEMPLATE__|$(PROXY_TEMPLATE)|g" -e "s|__GLUSTER_TEMPLATE__|$(GLUSTER_TEMPLATE)|g" templates/$(TERRAFORM_VARS_FILE).template > $(TERRAFORM_VARS_FILE).template)
	@echo -e        "\nAUTH_URL" = $(AUTH_URL)\
        "\nOS_TENANT_NAME" = $(OS_TENANT_NAME)\
        "\nAVAILABILITY_ZONE" = $(AVAILABILITY_ZONE)\
        "\nOS_IMAGE" = $(OS_IMAGE)\
        "\nIMAGE_DISTRO" = $(IMAGE_DISTRO)\
        "\nNUM_OF_MASTERS" = $(NUM_OF_MASTERS)\
        "\nNUM_OF_MANAGERS" = $(NUM_OF_MANAGERS)\
        "\nNUM_OF_WORKERS" = $(NUM_OF_WORKERS)\
        "\nNUM_OF_VA" = $(NUM_OF_VA)\
        "\nNUM_OF_PROXIES" = $(NUM_OF_PROXIES)\
        "\nNUM_OF_GLUSTERS" = $(NUM_OF_GLUSTERS)\
        "\nCREATE_STORAGE" = $(CREATE_STORAGE)\
        "\nSYSTEM_TUNING" = $(SYSTEM_TUNING)\
        "\nICP_CONFIG_FILE" = $(ICP_CONFIG_FILE)\
        "\nOS_PRIVATE_NETWORK" = $(OS_PRIVATE_NETWORK)\
        "\nOS_NETWORK" = $(OS_NETWORK)\
        "\nVA" = $(VA)\
        "\nISTIO" = $(ISTIO)\
        "\nGLUSTER_FS" = $(GLUSTER_FS)\
        "\nMCM" = $(MCM)\
        "\nPSN" = $(PSN)\
        "\nNPDD" = $(NPDD)\
        "\nMINIO" = $(MINIO)\
        "\nKNATIVE" = $(KNATIVE)\
        "\nMASTER_TEMPLATE" = $(MASTER_TEMPLATE)\
        "\nMANAGER_TEMPLATE" = $(MANAGER_TEMPLATE)\
        "\nWORKER_TEMPLATE" = $(WORKER_TEMPLATE)\
        "\nVA_TEMPLATE" = $(VA_TEMPLATE)\
        "\nPROXY_TEMPLATE" = $(PROXY_TEMPLATE)\
        "\nGLUSTER_TEMPLATE" = $(GLUSTER_TEMPLATE)