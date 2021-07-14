INDIR := input
OUTDIR := contend

# Find all markdown files in the input directory
SOURCES := $(shell find $(INDIR)/ -type f -name '*.md')

# Output file keep relative paths of input files
OUT := $(patsubst $(INDIR)/%.md,$(OUTDIR)/%.md,$(SOURCES))

all: $(OUT)

# Input-Output transformation with pandoc (markdown-to-markdown at the moment)
$(OUT): $(OUTDIR)/%.md: $(INDIR)/%.md
	mkdir -p $(shell dirname $@)
	docker run --rm -v docker://pandoc/core:2.9 pandoc -o $@ $<

.PHONY: all
