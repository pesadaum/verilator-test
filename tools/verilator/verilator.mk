.PHONY: lint clean compile run all

# Design paths
export DESIGN ?= src/hello-world/hw_tb.sv # Temporary, to be dynamic with each design
export DESIGN_TOP ?= $(basename $(notdir $(DESIGN)))
export DESIGN_ABS_PATH ?= $(realpath $(dir $(DESIGN)))
# Results directory
export RESULTS_DIR ?= $(abspath $(dir $(DESIGN))results)
OBJ_DIR ?= $(abspath $(dir $(DESIGN))obj_dir)


# Optional arguments for verilator
VLT_MAIN_ARGS ?=
VLT_OPT_ARGS ?=
WAVES ?= 0

# Enable waveform VCD dumping if args providded
ifeq ($(WAVES), 1)
	VLT_OPT_ARGS += --trace
endif


results_dir:
	@mkdir -p $(RESULTS_DIR) || true

clean:
	rm -rf $(OBJ_DIR) $(RESULTS_DIR)

lint: results_dir
	verilator --lint-only --timing --top-module $(DESIGN_TOP) -I$(dir $(DESIGN)) --Mdir $(OBJ_DIR) $(DESIGN) 2>&1 | tee $(RESULTS_DIR)/lint.log

compile: results_dir
	verilator --binary --timing --top-module $(DESIGN_TOP) -I$(dir $(DESIGN)) --Mdir $(OBJ_DIR) $(DESIGN) $(VLT_OPT_ARGS) 2>&1 | tee $(RESULTS_DIR)/compile.log

run: compile
	$(OBJ_DIR)/V$(DESIGN_TOP) +verilator+log+file+$(RESULTS_DIR)/run.log
	@cat $(RESULTS_DIR)/run.log

all: compile run
