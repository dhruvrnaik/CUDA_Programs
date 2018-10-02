
bash regex.sh vec_sum.cu

sum=0
k=0
declare -a arr

while [ $k -lt 5 ] 
do 	
	arr[$k]=$(./$1)
	k=$(expr $k + 1)
done
for i in ${arr[@]}
do
	sum=$(echo $i + $sum)
	
done
ans=$(echo $sum| bc -l)
ans_fin=$(echo $ans/$k | bc -l) 
printf "Average: %.8f\n" $ans_fin 

 