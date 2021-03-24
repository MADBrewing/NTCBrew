help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-13s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

generate: ## flutter pub run build_runner build
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

migrate: ## migrate to null safety
	dart migrate --apply-changes

enable-osx: ## enable OSX
	flutter config --enable-macos-desktop

enable-windows: ## enable Windows
	flutter config --enable-windows-desktop

enable-linux: ## enable Linux
	flutter config --enable-linux-desktop

run-osx: ## run OSX
	flutter run -d macos

run-windows: ## run Windows
	flutter run -d windows

run-linux: ## run Linux
	flutter run -d linux

run-web: ## run Web
	flutter run -d chrome

build-osx: ## build OSX
	flutter build macos

build-windows: ## build Windows
	flutter build windows

build-linux: ## build Linux
	flutter build linux

build-web: ## build Web
	flutter build web

add-osx:  ## add OSX
	flutter create --platforms=macos .

add-windows:  ## add Windows
	flutter create --platforms=windows .

add-linux: ## add Linux
	flutter create --platforms=linux .

add-web: ## add web
	flutter create .
