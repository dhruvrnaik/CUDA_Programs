 if [[ $1 = *".cu"* ]]
then
	scr=$(echo $1 | sed  's/.cu$//')
	nvcc -o $scr $1
	echo GPU:
elif [[ $1 = *".c" ]]
then
	scr=$(echo $1 | sed  's/.c$//')
	gcc -o $scr $1
	echo CPU:
fi



sum=0
k=0
declare -a arr

while [ $k -lt 5 ] 
do 	
	arr[$k]=$(./$scr)
	k=$(expr $k + 1)
done
for i in ${arr[@]}
do
	sum=$(echo $i + $sum)
	
done
ans=$(echo $sum| bc -l)
ans_fin=$(echo $ans/$k | bc -l) 
printf "Average: %.8f\n" $ans_fin 

 