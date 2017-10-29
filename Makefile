# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

STLDIR = stls
DEPDIR = deps

_TARGETS=sq_nut_holder.stl

TARGETS = $(patsubst %,$(STLDIR)/%,$(_TARGETS))
_DEPS = $(patsubst %,$(DEPDIR)/%,$(_TARGETS))
DEPS = $(_DEPS:.stl=.deps)
PNGS = $(TARGETS:.stl=.png)

all: $(TARGETS) $(PNGS)

clean:
	rm ./deps/*.deps
	rm ./stls/*.stl
	rm ./stls/*.png

./stls/%.stl: ./scad/%.scad
	openscad -m make -o $@ -d $(DEPS) $<
#openscad -m make -o $@ -d $@.deps $<

./stls/%.png: ./scad/%.scad
	openscad --render -o $@ -d $(DEPS) $<
#	openscad --render -o $@ -d $@.deps $<

