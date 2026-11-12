# Default tool to use for simulation
TOOL ?= verilator

SUPPORTED_TOOLS := verilator

ifneq ($(filter $(SUPPORTED_TOOLS),$(TOOL)),$(TOOL))
$(error Unsupported TOOL '$(TOOL)'; supported tools: $(SUPPORTED_TOOLS))
endif

# include tools/gtkwave/gtkwave.mk
include tools/verilator/verilator.mk
