M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: start
start: ## Start the rhsso docker container
	$(info $(M) Starting an instance of rhsso)
	@docker stack rm rhsso
	@docker stack deploy -c ./docker/docker-compose-swarm.yml rhsso

.PHONY: stop
stop: ## Stopping running rhsso instances
	$(info $(M) Stopping rhsso instance)
	@docker stack rm rhsso

.DEFAULT_GOAL := help