ifeq ($(OUTPUT),)
	OUTPUT=danime
endif
all: merge
merge: check
	@echo "Building executable \"$(OUTPUT)\""
	sed -n '/^#start:code$$/,/^#end:code$$/{ /^#end:code$$/d; /^#start:code$$/d; p}' 00header  01include  02help  11search  12get  13download  14parse  35footer | sed -n "w $(OUTPUT)"
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
