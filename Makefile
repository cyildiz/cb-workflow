## Input directory
INDIR := input

## Output directory
OUTDIR := hugo/content

# Run pandoc from docker image
PANDOC := docker run --rm -v "$(INDIR):/$(INDIR)" pandoc/core:2.9

# Find all markdown files in the input directory
SOURCES := $(shell find $(INDIR)/ -type f -name '*.md')

# Output file keep relative paths of input files
OUT := $(patsubst $(INDIR)/%.md,$(OUTDIR)/%.md,$(SOURCES))

all: $(OUT)

# Input-Output transformation with pandoc (markdown-to-markdown at the moment)
$(OUT): $(OUTDIR)/%.md: $(INDIR)/%.md
	mkdir -p $(shell dirname $@)
	$(PANDOC) --wrap=preserve -o $@ $<

.PHONY: all
