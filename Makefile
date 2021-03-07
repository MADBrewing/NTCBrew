help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-13s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

generate_classes: ## flutter pub run build_runner build
	flutter pub run build_runner build

run: ## flutter run
	flutter run

doctor:  ## flutter doctor
	flutter doctor

upgrade:  ## flutter upgrade
	flutter upgrade

update:  ## flutter pub get
	flutter pub get

clean:  ## flutter clean
	flutter clean

build:  ## flutter build
	flutter build