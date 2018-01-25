all: build save
serve:
	hugo serve --disableFastRender --theme=hugo_theme_robust --buildDrafts
build:
	git pull origin master
	hugo --disableFastRender --theme=hugo_theme_robust -d docs
save:
	git add -A
	git commit -m "Updated `date +'%y.%m.%d %H:%M:%S'`"
	git push origin
