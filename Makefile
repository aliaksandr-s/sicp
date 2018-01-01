racket-setup:
	docker-compose build

current_dir = $(shell pwd)

racket-container:
	docker run -v $(current_dir)/src:/sicp --rm -it racket

# to run a file --> make racket-run file=filename.rkt

racket-run:																				 #container #cmd
	docker run -v $(current_dir)/$(file):/$(file) --rm racket racket $(file)
