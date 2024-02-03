NAME		= google-map-scrapper
RUNNING		= running-google-map-scrapper

CONTAINER	= $(shell docker ps --quiet)
IMAGE		= $(shell docker images --quiet)

all:
	docker build -t ${NAME} .
	docker run -it --rm --name ${RUNNING} ${NAME}

clean:
ifneq ($(strip ${CONTAINER}),)
	docker stop ${RUNNING}
	docker container rm -f ${CONTAINER}
endif

fclean: clean
ifneq ($(strip ${IMAGE}),)
	docker image rm -f ${IMAGE}
endif

re:
	make fclean
	make all

.PHONY: all clean fclean re
