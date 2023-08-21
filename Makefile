CC=clang
LIBS=raylib
CFLAGS=-Wall -Wextra -ggdb
COMBINED_CFLAGS=-std=c99 $(CFLAGS) $(shell pkg-config --cflags $(LIBS)) $(shell xml2-config --cflags)
LDFLAGS=$(shell pkg-config --libs $(LIBS)) $(shell xml2-config --libs)

SRCDIR=src
BUILDDIR=build
DISTDIR=dist
SOURCES=$(wildcard $(SRCDIR)/*.c)
OBJECTS=$(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SOURCES))
EXECUTABLE=$(DISTDIR)/TetrisJFF

.PHONY: all run clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	@mkdir -p $(DISTDIR)
	$(CC) $(COMBINED_CFLAGS) $^ -o $@ $(LDFLAGS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)
	$(CC) $(COMBINED_CFLAGS) -c $< -o $@

run: $(EXECUTABLE)
	./$^

clean:
	rm -rf $(BUILDDIR) $(DISTDIR)
