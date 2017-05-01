
TEST_DIR = ~/Dropbox/website/staging/
STAGE_DIR = ~/Dropbox/website/deploy/
HOSTNAME = webserver
HOST_DIR = /var/www/html/

.PHONY : test serve-test clean clean-test stage-deploy deploy

help:
	@echo 'Makefile for website.'
	@echo ''
	@echo 'Commands:'
	@echo '    test [TEST_DIR=~/staging]  make the website in a test-directory'
	@echo '    serve-test                 launch a web-server in test-directory'
	@echo '    deploy                     deploy the website'
	@echo '    clean                      remove generated files and test directory'
	@echo '    clean-test                 remove test directory'
	@echo '    clean-deploy               remove deployment directory'



test:
	cd src/blog/ && $(MAKE) html
	mkdir -p ${TEST_DIR}
	cp src/*.js src/*.html src/*.css ${TEST_DIR}/
	cp -r src/img ${TEST_DIR}
	cp -r src/blog/output/ ${TEST_DIR}/blog
	mkdir -p ${TEST_DIR}/blog/nbs
	cp -r src/blog/content/*ipynb ${TEST_DIR}/blog/nbs

clean: clean-test
	cd src/blog/ && $(MAKE) clean

serve-test:
	cd ${TEST_DIR} && python -m SimpleHTTPServer

watch-test:
	python watch_test.py

stage-deploy:
	cd src/blog/ && $(MAKE) html CONFFILE=publishconf.py
	mkdir -p ${STAGE_DIR}
	cp src/*.js src/*.html src/*.css ${STAGE_DIR}/
	cp -r src/img ${STAGE_DIR}/
	cp -r src/blog/output/ ${STAGE_DIR}/blog
	mkdir -p ${STAGE_DIR}/blog/nbs
	cp -r src/blog/content/*ipynb ${STAGE_DIR}/blog/nbs

deploy: stage-deploy
	scp -r ${STAGE_DIR}/* ${HOSTNAME}:${HOST_DIR}

clean-test:
	rm -rf ${TEST_DIR}

clean-deploy:
	rm -rf ${STAGE_DIR}
