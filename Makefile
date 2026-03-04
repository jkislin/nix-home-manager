build:
	docker build . -t nix-vap

run: build
	docker run -it --rm -v ".:/home/vapuser/.config/home-manager" nix-vap 