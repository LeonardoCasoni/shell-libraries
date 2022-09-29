#!/bin/bash

FindWordInDir () {
#find the word $1 scanning all the files in the directory $2
	find $2 -type f -exec grep -H $1 {} \;
}
