all: build save
serve:
	hugo serve --theme=mediumish-gohugo-theme --buildDrafts --buildFuture --disableFastRender
build:
	git pull origin master
	hugo --theme=hugo_theme_robust --buildFuture -d docs
save:
	git add -A
	git commit -m "Updated `date +'%y.%m.%d %H:%M:%S'`"
	git push origin
