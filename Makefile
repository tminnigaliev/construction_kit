# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

STLDIR = stls

_TARGETS=kit.stl

TARGETS = $(patsubst %,$(STLDIR)/%,$(_TARGETS))
PNGS = $(TARGETS:.stl=.png)

all: $(TARGETS) $(PNGS)

clean:
	rm ./stls/*.deps
	rm ./stls/*.stl
	rm ./stls/*.png

./stls/%.stl: ./scad/%.scad
	openscad -m make -o $@ -d $@.deps $<

./stls/%.png: ./scad/%.scad
	openscad --render -o $@ -d $@.deps $<

