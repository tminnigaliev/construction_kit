# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

STLDIR = stls
DEPDIR = deps

_TARGETS = sq_nut_holder.stl ring_10_20.stl bracket1_5_2.stl

TARGETS = $(patsubst %,$(STLDIR)/%,$(_TARGETS))
PNGS = $(TARGETS:.stl=.png)

all: $(TARGETS) $(PNGS)

clean:
	rm ./deps/*.deps
	rm ./stls/*.stl
	rm ./stls/*.png

./stls/%.stl: ./scad/%.scad
	openscad -m make --imgsize=1024,768 --projection=ortho --autocenter -o $@ -d deps/$(notdir $(addsuffix .deps, $(basename $@))) $<

./stls/%.png: ./scad/%.scad
	openscad --imgsize=1024,768 --projection=ortho --autocenter -o $@ -d deps/$(notdir $(addsuffix .deps, $(basename $@))) $<
#	openscad --render -o $@ -d deps/$(notdir $@.deps) $<
#	openscad --render -o $@ -d deps/$(notdir $@.deps) $<
#	openscad --render -o $@ $(basename $@).stl

