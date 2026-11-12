.PHONY: clean compile run all

export DESIGN ?= src/hello-world/hw_tb.sv

DESIGN_TOP ?= $(basename $(notdir $(DESIGN)))

clean:
	rm -rf $(dir $(DESIGN))/obj_dir

compile:
	verilator --binary --timing --top-module $(DESIGN_TOP) -I$(dir $(DESIGN)) $(DESIGN)

run: compile
	./obj_dir/V$(DESIGN_TOP)

all: compile run
