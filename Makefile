NAME := texdirflatten
VERSION := v$(shell grep 'version = ' ${NAME} | cut -d\" -f2)
VERSTR = ${NAME}-${VERSION}

version:
	echo "Version: " ${VERSION}

doc:
	pod2man --release "${VERSTR}" ${NAME} > ${NAME}.1
	pod2text ${NAME} > README

dist: 
	mkdir -p distdir/${NAME}
	cp README ${NAME} ${NAME}.1 distdir/${NAME}/
	cd distdir && zip -r ../${VERSTR}.zip ${NAME}/

clean:
	rm *~ ${VERSTR}.zip || true
	rm -rf distdir/${NAME}/
