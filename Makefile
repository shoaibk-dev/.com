all: save
serve:
	hugo serve --theme=mediumish-gohugo-theme --buildDrafts --buildFuture --disableFastRender
save:
	git add -A
	git commit -m "Updated `date +'%y.%m.%d %H:%M:%S'`"
	git push origin
