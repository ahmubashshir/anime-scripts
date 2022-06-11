prefix:=
OUTPUT:=chia-dl
test:=yes
syntax:=yes
BATSFLAGS:=-p
BATS:= $(shell which bats 2>/dev/null)
VERSION:=
bindir:=$(prefix)/bin
test_target:=test

id = $(shell id -u)
checks =
ifeq ($(id),0)
    prefix:=/usr
else
    prefix:=$(HOME)
endif

ifeq ($(VERSION),)
    VERSION = r$(shell git rev-list --count HEAD).$(shell git rev-parse --short HEAD)
endif

ifneq ($(shell git diff --shortstat -- $(PWD)),)
    VERSION := $(VERSION)-$(shell git diff --shortstat | awk 'END{print $$1}')
endif

ifeq ($(test), yes)
    checks += test
endif

ifeq ($(syntax), yes)
    syndep = $(shell which shellcheck 2>/dev/null)
endif

ifneq ($(syndep),)
    checks += syntax
endif

ifeq ($(BATS),)
    BATS = ./test/bats/bin/bats
endif

source = \
        00header \
        01include \
        02help \
        03msg \
        04lib \
        10db \
        11search \
        12get \
        13download \
        14parse \
        deps \
        35footer
.PHONY: test syntax update upgrade debug install install-libbash check
all: $(OUTPUT)

$(OUTPUT): check
	@echo "Building executable \"$(OUTPUT)\""
	sed -n '/^#start:code$$/,/^#end:code$$/{ /^#end:code$$/d; /^#start:code$$/d; p}' $(source) | sed -n "w $(OUTPUT)"
	sed -Ei "s/^(#\+VERSION).*/\1 $(VERSION)/;/^\s+#\s/d" $(OUTPUT)
	@chmod +x "$(OUTPUT)"

check: $(checks)
syntax:
	@echo "Checking syntax."
	shellcheck $(source)

test:
	@echo Running tests.
	$(BATS) $(BATSFLAGS) $(test_target)
clean:
	@echo "Cleaning"
	rm -f $(OUTPUT)
debug: check
	@echo "Preparing for debugging"
	@echo "Debugging $(OUTPUT)"
	bashdb $(OUTPUT)
	@make clean
install: all
	@echo Installing $(OUTPUT)
	install -CDm755 $(OUTPUT) $(bindir)/$(OUTPUT)
install-libbash:
	@echo Installing libbash
	install -CDm755 ../lib/libbash $(bindir)/libbash
update:
	@git pull
upgrade: update install install-libbash
