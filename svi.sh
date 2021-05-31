#!/bin/sh
script=`basename $0`
case $# in
        0) vi ; exit 0
        ;;
        1)
                if [ ! -r "$1" -o ! -w "$1" ] # no read or no write permission
                then
                        echo "$script: check permission on $1" 1>&2
                        exit 1
                fi
                if [ ! -w "." ]
                then
                        echo "$script: backup cannot be created "\
                        "in the working directory" 1>&2
                        exit 2
                fi
                editfile=$1
                if [ ! -f "$1" ] # not regular file
                then
                        echo "$1 is not regular file."
                        exit 1
                fi
        ;;
esac

tempfile=/tmp/$$.$script
cp $editfile $tempfile
if vi $editfile
then
        mv $tempfile `basename $editfile`.bak
        echo "$script: backup file created"
else
        mv $tempfile editerr
        echo "$script: edit error-copy of " \
        "original file is in editerr" 1>&2
fi
