PREFIX ?= /usr/local
.PHONY: all install uninstall

all:

install:
	printf '%s\n' '#!/bin/sh' 'SBR_LIB_DIR="${DESTDIR}${PREFIX}/lib/sbr" exec "${DESTDIR}${PREFIX}/lib/sbr/sbr" "$$@"' > "${DESTDIR}${PREFIX}/bin/sbr"
	chmod 755 -- "${DESTDIR}${PREFIX}/bin/sbr"
	mkdir -p -- "${DESTDIR}${PREFIX}/lib/sbr"
	cp -r -- sbr lib fs bin "${DESTDIR}${PREFIX}/lib/sbr"
	chmod -R 755 -- "${DESTDIR}${PREFIX}/lib/sbr"
	install -Dm644 -- LICENSE ${DESTDIR}${PREFIX}/share/licenses/sbr/LICENSE

uninstall:
	rm -f  -- "${DESTDIR}${PREFIX}/bin/sbr"
	rm -rf -- "${DESTDIR}${PREFIX}/lib/sbr"
	rm -rf -- "${DESTDIR}${PREFIX}/share/licenses/sbr"
