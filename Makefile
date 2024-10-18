#!/usr/bin/make -f

# your filename without extension
DOCUMENT := example

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

SHELL := /bin/bash
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))


.PHONY: $(DOCUMENT).pdf  # allow latexmk to handle the calls
$(DOCUMENT).pdf:
	latexmk -pdf $(ROOT_DIR)/$(DOCUMENT).tex


.PHONY: all
all:	| $(DOCUMENT).pdf


.PHONY: clean
clean:
	latexmk -C
