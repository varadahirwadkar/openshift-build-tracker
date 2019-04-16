TEST_INFRA_IMAGE ?= powercloud-cicd/test-icp-daily:0.1
JENKINS_IMAGE ?= powercloud-cicd/jenkins-master-amd64:0.1

all: load-jenkins-jobs

load-jenkins-jobs: build-test-icp-daily-image
	@docker run -ti --rm -v $(shell pwd):/test-icp-daily:Z -e "JENKINS_USER=$(JENKINS_USER)" -e "JENKINS_PASSWORD=$(JENKINS_PASSWORD)" -e "JENKINS_URI=$(JENKINS_URI)" --rm $(TEST_INFRA_IMAGE) /test-icp-daily/hack/load-all-job.sh

build-test-icp-daily-image:
	$(MAKE) --no-print-directory -C images/test-icp-daily all

build-jenkins-master:
	$(MAKE) --no-print-directory -C images/jenkins-master build

verify: build-test-icp-daily-image build-jenkins-master
	$(eval JENKINS_CONT_ID = $(shell ./hack/jenkins.sh docker_run $(JENKINS_IMAGE)))
	$(eval JENKINS_IPADDR = $(shell ./hack/jenkins.sh container_ip $(JENKINS_CONT_ID)))
	@sleep 30
	@docker run -ti --rm -v $(shell pwd):/test-icp-daily:Z -e "JENKINS_USER=admin" -e "JENKINS_PASSWORD=admin" -e "JENKINS_URI=http://$(JENKINS_IPADDR):8080/" --rm $(TEST_INFRA_IMAGE) /test-icp-daily/hack/verify-all.sh
	./hack/jenkins.sh container_rm $(JENKINS_CONT_ID)
