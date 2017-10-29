# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

all: ./stls/kit.stl

clean:
	rm ./stls/*.deps
	rm ./stls/*.stl

./stls/%.stl: ./scad/%.scad
	openscad -m make -o $@ -d $@.deps $<
