## Working directory
## In case this doesn't work, set the path manually (use absolute paths).
WORKDIR = $(CURDIR)

## Input directory
INDIR := input

## Output directory
OUTDIR := hugo/content

# Source files
SOURCES := $(shell find $(INDIR)/ -type f -name '*.md')
# Output file keep relative paths of input files
OUT := $(patsubst $(INDIR)/%.md,$(OUTDIR)/%.md,$(SOURCES)) 

# Image files
IMAGES_IN := $(shell find $(INDIR)/ -type f -name '*.jpg')
IMAGES_OUT := $(patsubst $(INDIR)/%,$(OUTDIR)/%,$(IMAGES_IN))

# Pandoc
PANDOC := docker run --rm -v "$(WORKDIR)":/pandoc -w /pandoc pandoc/core:2.14

# Pandoc arguments
PANDOC_ARGS := --wrap=preserve -s

all: $(OUT) $(IMAGES_OUT)

# Input-Output transformation with pandoc (markdown-to-markdown at the moment)
$(OUT): $(OUTDIR)/%.md: $(INDIR)/%.md
	mkdir -p $(shell dirname $@)
	$(PANDOC) $(PANDOC_ARGS) -o $@ $<
#	pandoc --wrap=preserve -s -o $@ $<
	
$(IMAGES_OUT): $(OUTDIR)/%: $(INDIR)/%
	mkdir -p $(shell dirname $@)
	cp -f $< $@

.PHONY: all
