LEVEL = ../../..
PARALLEL_DIRS  := cfrac espresso

# cfrac mixes pointers and ints.  Thus doesn't work on alpha.
ifeq ($(ARCH),Alpha)
PARALLEL_DIRS := $(filter-out cfrac, $(PARALLEL_DIRS))
endif

include $(LEVEL)/Makefile.programs
