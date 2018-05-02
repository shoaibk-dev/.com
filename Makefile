all: build save
serve:
	hugo serve --theme=hugo_theme_robust --buildDrafts --buildFuture
build:
	git pull origin master
	hugo --theme=hugo_theme_robust --buildFuture -d docs
save:
	git add -A
	git commit -m "Updated `date +'%y.%m.%d %H:%M:%S'`"
	git push origin
