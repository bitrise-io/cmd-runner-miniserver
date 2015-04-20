#!/bin/bash

echo "-> Testing"
go test ./...
if [[ $? -ne 0 ]]; then
	echo " [!] Tests Failed"
	exit 1
fi

echo "-> Building"
go build
if [[ $? -ne 0 ]]; then
	echo " [!] Build Failed!"
	exit 1
fi

echo "-> Moving binary"
mv cmd-bridge bin/osx/
if [[ $? -ne 0 ]]; then
	echo " [!] Binary move Failed!"
	ls -alh
	exit 1
fi

echo " (i) DONE - OK"
