.PHONY: chromium mozilla clean

# Default target
all: mozilla chromium

# Build the .xpi file for Firefox (Mozilla)
mozilla: yakht.xpi

yakht.xpi:
	zip -r -j $@ mozilla/*

# Build the .crx file for Chromium, depending on OS, with installation check
chromium:
	@echo "Checking for Chromium installation..."
	@if ! command -v chromium > /dev/null 2>&1 && ! command -v google-chrome > /dev/null 2>&1 && ! command -v chrome > /dev/null 2>&1; then \
		echo "Error: Chromium is not installed or not in your PATH."; \
		exit 1; \
	fi

	@if [ "$(shell uname)" = "Darwin" ]; then \
		echo "Building for macOS"; \
		chromium --pack-extension=$(PWD)/chromium; \
	elif [ "$(shell uname)" = "Linux" ]; then \
		echo "Building for Linux"; \
		chromium --pack-extension=$(PWD)/chromium; \
	elif [ "$(shell uname)" = "CYGWIN"* ] || [ "$(shell uname)" = "MINGW"* ]; then \
		echo "Building for Windows"; \
		"C:/Program Files/Google/Chrome/Application/chrome.exe" --pack-extension=$(PWD)/chromium; \
	else \
		echo "Unknown OS"; \
		exit 1; \
	fi
	mv chromium.crx yakht.crx

# Clean up generated files
clean:
	rm -f yakht.xpi yakht.crx chromium.pem
