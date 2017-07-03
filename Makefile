NAME := texdirflatten
VERSION := v$(shell grep '^\# Version' ${NAME} | cut -d\  -f3)
VERSTR = ${NAME}-${VERSION}

doc:
	pod2man --release "${VERSTR}" ${NAME} > ${NAME}.1
	pod2text ${NAME} > README

dist: 
	mkdir -p distdir/${NAME}
	cp README ${NAME} ${NAME}.1 distdir/${NAME}/
	cd distdir && zip -r ../${VERSTR}.zip ${NAME}/

clean:
	rm *~ ${VERSTR}.zip
	rm -rf distdir/${NAME}/
