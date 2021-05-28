OUTPUT:=danime
id:= $(shell id -u)
test:=yes
syntax:=yes
bats:=-r
VERSION:=

ifeq ($(id),0)
	prefix=/usr
else
	prefix=$(HOME)/bin
endif

ifeq ($(VERSION),)
	VERSION=r$(shell git rev-list --count HEAD).$(shell git rev-parse --short HEAD)
endif

ifneq ($(shell git status -su|wc -l),0)
	VERSION:=$(VERSION)-$(shell git status -su|wc -l)
endif

ifeq (, $(shell which shellcheck 2>/dev/null))
	check=no
endif

.PHONY: test-yes test-no check-yes check-no update upgrade debug install install-libbash install-spinner check nocheck
all: $(OUTPUT)
$(OUTPUT): syntax-$(syntax) test-$(test)
	@echo "Building executable \"$(OUTPUT)\""
	sed -n '/^#start:code$$/,/^#end:code$$/{ /^#end:code$$/d; /^#start:code$$/d; p}' 00header  01include  02help 10db 11search  12get  13download  14parse  35footer | sed -n "w $(OUTPUT)"
	sed -Ei "s/^(# VERSION).*/\1 $(VERSION)/" "$(OUTPUT)"
	@chmod +x "$(OUTPUT)"
syntax-yes:
	@echo "Checking syntax."
	shellcheck -eSC2178,SC2128,SC2031,SC2030 00header 01include 02help 11search 12get 13download 14parse 35footer
syntax-no:
	@echo "Not checking syntax."
test-no:
	@echo Skipping tests.
test-yes:
	@echo Running tests.
	./test/bats/bats $(bats) test
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
	install -C $(OUTPUT) $(prefix)/$(OUTPUT)
	install -C getmap.py $(prefix)/$(OUTPUT)_getmap
install-libbash:
	@echo Installing libbash
	install -C ../lib/libbash $(prefix)/libbash
install-spinner:
	@echo Installing spinner
	install -C ../lib/spinner $(prefix)/spinner
update:
	@git pull
upgrade: update install install-spinner install-libbash
