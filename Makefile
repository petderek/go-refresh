.PHONY: all run clean
all: bin/go-refresh

# go list is the canonical utility to find go files
GOFILES := $(shell go list -f '{{ join .GoFiles "\n" }}' ./...)

bin/go-refresh: .bin-stamp ${GOFILES}
	go build -o bin/go-refresh
	chmod +x bin/go-refresh

# directories do werid things in make, so we can use a stamp
.bin-stamp:
	mkdir -p bin
	touch .bin-stamp

# Use 'go run' so we don't have to worry about recompiling
run:
	go run .

clean:
	rm -rf bin
	rm .bin-stamp
