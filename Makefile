
# Recursively generate a list of all markdown files in the directory.
MDS=$(wildcard *.markdown) $(wildcard markdown/*.markdown) $(wildcard markdown/*/*.markdown) $(wildcard markdown/*/*/*.markdown) $(wildcard markdown/*/*/*/*.markdown)

HTMLS := $(patsubst markdown/%.markdown, html/%.html, $(MDS))
HTMLS := $(patsubst %.markdown, %.html, $(HTMLS))

all: compile

compile: $(HTMLS)

%.html: %.markdown
	# Compiling "$<" to "$@"...
	DIRS=`echo "$@" | rev | cut --fields="2-" -d"/" --only-delimited | rev` ;\
	mkdir -p "$${DIRS}" ;\
	markdown "$<" > "$@"
	# Compiled "$<" to "$@"!

clean:
	# Cleaning...
	rm -ir html/*
	# Cleaned!
