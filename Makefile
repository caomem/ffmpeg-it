install:
	chmod +x ffmpeg-it
	sudo cp ffmpeg-it /usr/bin

update:
	git pull origin master
	make install