
# Recursively generate a list of all markdown files in the directory. Supports 10 levels as is, but adjust as needed.
MDS=$(wildcard markdown/*.markdown) $(wildcard markdown/*/*.markdown) $(wildcard markdown/*/*/*.markdown) $(wildcard markdown/*/*/*/*.markdown) $(wildcard markdown/*/*/*/*/*.markdown) $(wildcard markdown/*/*/*/*/*/*.markdown)  $(wildcard markdown/*/*/*/*/*/*/*.markdown)  $(wildcard markdown/*/*/*/*/*/*/*/*.markdown) $(wildcard markdown/*/*/*/*/*/*/*/*/*.markdown) $(wildcard markdown/*/*/*/*/*/*/*/*/*/*.markdown)

HTMLS := $(patsubst markdown/%.markdown, html/%.html, $(MDS))

all: compile

compile: $(HTMLS)

html/%.html: markdown/%.markdown
	# Compiling "$<" to "$@"...
	DIRS=`echo "$@" | rev |cut --fields="2-" -d"/" | rev` ;\
	mkdir -p "$${DIRS}" ;\
	markdown "$<" > "$@"
	# Compiled "$<" to "$@"!

clean:
	# Cleaning...
	rm -ir html/*
	# Cleaned!
