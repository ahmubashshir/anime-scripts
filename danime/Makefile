ifeq ($(OUTPUT),)
	OUTPUT=danime
endif
id:= $(shell id -u)
VERSION_INFO:= $(shell git rev-parse HEAD|cut -c 1-6)
ifeq ($(id),0)
	prefix=/usr
else
	prefix=$(HOME)/bin
endif
all: merge
merge: check
	@echo "Building executable \"$(OUTPUT)\""
	sed -n '/^#start:code$$/,/^#end:code$$/{ /^#end:code$$/d; /^#start:code$$/d; p}' 00header  01include  02help  11search  12get  13download  14parse  35footer | sed -n "w $(OUTPUT)"
	sed -i 's/VERSION_INFO=/VERSION_INFO=$(VERSION_INFO)/g' "$(OUTPUT)"
check:
	@echo "Checking syntax."
	shellcheck 00header 01include 02help 11search 12get 13download 14parse 35footer
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
install-jsonparser:
	@echo Installing jsonparser
	install -C ../lib/jsonparser $(prefix)/jsonparser
install-libbash:
	@echo Installing libbash
	install -C ../lib/libbash $(prefix)/libbash
install-spinner:
	@echo Installing spinner
	install -C ../lib/spinner $(prefix)/spinner
update:
	@git pull
upgrade: update install
