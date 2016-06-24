#!/bin/zsh

# Clean the directories

# Remove everything but exist.txt from output-directories
echo "veryclean.sh"

if [ -d samples_output ]
then
    mkdir tmp 
    if [ -f samples_output/exist.txt ]
    then
	mv samples_output/exist.txt tmp
    else
	echo "exist.txt does not exist in samples_output"
	exit
    fi
    if [ "$(ls -A samples_output)" ]
    then
	rm -rf samples_output/* 
    fi
    mv tmp/* samples_output
    rmdir tmp 
else
    echo "samples_output does not exist"
    exit 1
fi

if [ -d 05_output ]
then
    mkdir tmp 
    if [ -f 05_output/exist.txt ]
    then
	mv 05_output/exist.txt tmp
    else
	echo "exist.txt does not exist in 05_output"
	exit 1
    fi
    if [ "$(ls -A 05_output)" ]
    then
	rm -rf 05_output/* 
    fi
    mv tmp/* 05_output
    rmdir tmp 
else
    echo "05_output does not exist"
    exit 1
fi

if [ -d enkf_output ] 
then
    mkdir tmp
    if [ -f enkf_output/exist.txt ]
    then
	mv enkf_output/exist.txt tmp
    else
	echo "exist.txt does not exist in enkf_output"
	exit 1
    fi
    if [ "$(ls -A enkf_output)" ]
    then
	rm -rf enkf_output/*
    fi
    mv tmp/* enkf_output
    rmdir tmp
else
    echo "enkf_output does not exist"
    exit 1
fi

if [ -d single_cell_output ]
then
    mkdir tmp
    if [ -f single_cell_output/exist.txt ]
    then
	mv single_cell_output/exist.txt tmp
    else
	echo "exist.txt does not exist in single_cell_output"
	exit 1
    fi
    if [ "$(ls -A single_cell_output)" ]
    then
	rm -rf single_cell_output/*
    fi
    mv tmp/* single_cell_output
    rmdir tmp
else
    echo "single_cell_output does not exist"
    exit 1
fi

#echo "Removed everything from the output-directories."

# Remove other files from model-directory

rm -f X5.uf X5col.dat X5row.dat
rm -f tecplot.phy
if [ "$(ls . | grep "_status.log")" ]
then
    rm -f *_status.log
fi

# Remove output files
if [ "$(ls . | grep '\.out')" ]
then
    rm -f *.out
fi

# Remove backup files
if [ "$(ls . | grep '\.tgz')" ]
then
    rm -f *.tgz
fi

echo "Removed files from model directory:"
pwd
echo "veryclean.sh done"
echo
#ls --color -o

