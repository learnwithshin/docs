.PHONY = setup

all: setup deploy

setup:
	@echo $@
	@echo "Copying files from source..."
	cp ~/git/learnwithshin/python-portfolio/_preparation/countries.csv ./learn-docs/docs/assets
	cp ~/git/learnwithshin/python-portfolio/_preparation/country_vaccination_ts.csv ./learn-docs/docs/assets
	
deploy:
	@echo $@
	cd learn-docs;mkdocs gh-deploy
	@echo "Done!"
