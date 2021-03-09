.PHONY = setup update-page deploy 

all: setup update-page deploy


define GET_COUNTRIES 
import os

files = os.listdir("./learn-docs/docs/assets/")
file_name = list(filter(lambda f: "countries" in f, files))[0]
print(f"[`{file_name}`](assets/{file_name})")
endef
export GET_COUNTRIES

define GET_DATA 
import os

files = os.listdir("./learn-docs/docs/assets/")
file_name = list(filter(lambda f: "country_vacc" in f, files))[0]
print(f"[`{file_name}`](assets/{file_name})")
endef
export GET_DATA


setup:
	@echo $@
	@echo "Clean up the files..."
	rm ./learn-docs/docs/assets/*.csv
	@echo "Copying files from source..."
	cp ~/git/learnwithshin/python-portfolio/_preparation/countries* ./learn-docs/docs/assets
	cp ~/git/learnwithshin/python-portfolio/_preparation/country_vaccination_ts* ./learn-docs/docs/assets

update-page:
	@echo $@
	@echo "Update file page with new content..."
	@sed -i '' '5,8d' ./learn-docs/docs/files.md
	@python -c "$$GET_COUNTRIES" >> ./learn-docs/docs/files.md
	@echo '' >> ./learn-docs/docs/files.md
	@python -c "$$GET_DATA" >> ./learn-docs/docs/files.md

deploy:
	@echo $@
	cd learn-docs;mkdocs gh-deploy
	@echo "Done!"
