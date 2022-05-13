BUILD_DIR=build

YTT=$(BUILD_DIR)/ytt
YTT_VERSION=v0.40.1

PYTHON=python3

GENERATED_FILES=\
  $(BUILD_DIR)/index.md \

.PHONY: all
all: $(GENERATED_FILES)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir $@

$(YTT):
	curl -L -o $@ https://github.com/vmware-tanzu/carvel-ytt/releases/download/$(YTT_VERSION))/ytt-darwin-amd64

$(BUILD_DIR)/index.md: hack/vexec.sh hack/template.py template/index.md | requirements.txt $(BUILD_DIR)
	PYTHON=$(PYTHON) $^ $@
