OUTPUT:=danime
id:= $(shell id -u)
bats:=
ifeq ($(bats),skip)
	BATS=-skip
else
	BATS=
	bats+=-r
endif
VERSION_INFO:= $(shell git rev-parse HEAD|cut -c 1-6)
ifeq ($(id),0)
	prefix=/usr
else
	prefix=$(HOME)/bin
endif

.PHONY: test test-skip check update upgrade debug install install-libbash install-spinner
all: $(OUTPUT)
$(OUTPUT): check test$(BATS)
	@echo "Building executable \"$(OUTPUT)\""
	sed -n '/^#start:code$$/,/^#end:code$$/{ /^#end:code$$/d; /^#start:code$$/d; p}' 00header  01include  02help 10db 11search  12get  13download  14parse  35footer | sed -n "w $(OUTPUT)"
	sed -i 's/VERSION_INFO=/VERSION_INFO=$(VERSION_INFO)/g' "$(OUTPUT)"
	@chmod +x "$(OUTPUT)"
check:
	@echo "Checking syntax."
	shellcheck -eSC2178,SC2128 00header 01include 02help 11search 12get 13download 14parse 35footer
test-skip:
	@echo Skipping tests.
test:
	@type bats 1>/dev/null||echo -e "BATS not found.\n Can't run tests."
	@type bats 1>/dev/null||exit 0
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
install-libbash:
	@echo Installing libbash
	install -C ../lib/libbash $(prefix)/libbash
install-spinner:
	@echo Installing spinner
	install -C ../lib/spinner $(prefix)/spinner
update:
	@git pull
upgrade: update install install-spinner install-libbash
