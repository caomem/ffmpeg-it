install:
	chmod +x ffmpeg-it
	sudo cp ffmpeg-it ~/.local/bin

update:
	git pull origin master
	make install