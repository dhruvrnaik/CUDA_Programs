if [[ $1 = *".cu"* ]]
then
	scr=$(echo $1 | sed  's/.cu$//')
	nvcc -o $scr $1
	./$scr
elif [[ $1 = *".c" ]]
then
	scr=$(echo $1 | sed  's/.c$//')
	gcc -o $scr $1
	./$scr
fi

