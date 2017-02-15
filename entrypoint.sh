#!/bin/bash

function delete_dependencies () {
	if [ -d "$1" ]; then
		rm -R "$1"
		echo "********>> " "$1" "dependencies was delete"
	fi
}

function download_dependencies {

	if [ -d node_modules ]; then
		echo "********>> node modules up do date"
 	else
 		echo "********>> downloading npm dependecies"
 		npm install 
	fi

	if [ -d bower_components ]; then
		echo "********>> bower up do date"
 	else
 		echo "********>> downloading bower dependecies"
 		bower install --allow-root
	fi
}

function copy_build {
	cp -R dist /home/build-files
	echo "********>> dist was copy"
}

function build {
	echo "********>> Building"
	if [ -d dist ]; then
		echo "********>> Build already exists"
 	else
 		download_dependencies
 		grunt build
 		copy_build
	fi
}

function rebuild {
	delete_dependencies node_modules
	delete_dependencies bower_components
	if [ -d dist ]; then
		rm -R dist
	fi
	build
}

cd /home/build

case "$TASK" in

	"BUILD" ) 
		build
	;;

	"REBUILD" )
		rebuild
	;;		
esac