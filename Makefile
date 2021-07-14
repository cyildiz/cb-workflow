INDIR := input
OUTDIR := contend
SOURCES := $(shell find $(INDIR)/ -type f -name '*.md')
OUT := $(patsubst $(INDIR)/%.md,$(OUTDIR)/%.md,$(SOURCES))

all: $(OUT)

$(OUT): $(OUTDIR)/%.md: $(INDIR)/%.md
	mkdir -p $(shell dirname $@)
	pandoc -o $@ $<

.PHONY: all