.PHONY: clean compile run all

export DESIGN ?= src/hello-world/hw_tb.sv # Temporary

export DESIGN_TOP ?= $(basename $(notdir $(DESIGN)))
export DESIGN_ABS_PATH ?= $(realpath $(dir $(DESIGN)))
export RESULTS_DIR ?= $(abspath $(dir $(DESIGN))results)

OBJ_DIR ?= $(abspath $(dir $(DESIGN))obj_dir)


# Optional arguments for verilator
OPT_ARGS ?=
WAVES ?= 0


ifeq ($(WAVES), 1)
	OPT_ARGS += --trace
endif

clean:
	rm -rf $(OBJ_DIR) $(RESULTS_DIR)

compile:
	@mkdir -p $(RESULTS_DIR) || true
	verilator --binary --timing --top-module $(DESIGN_TOP) -I$(dir $(DESIGN)) --Mdir $(OBJ_DIR) $(DESIGN) $(OPT_ARGS) 2>&1 | tee $(RESULTS_DIR)/verilator.log

run: compile
	$(OBJ_DIR)/V$(DESIGN_TOP)

all: compile run
