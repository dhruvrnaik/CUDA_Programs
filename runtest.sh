x=$(./vec_sum)
z=$(echo $x + 1 | bc -l)
sum=0
k=0
declare -a arr

while [ $k -lt 5 ] 
do 	
	arr[$k]=$(./vec_sum)
	k=$(expr $k + 1)
done
for i in ${arr[@]}
do
	sum=$(echo $i + $sum)
	
done
ans=$(echo $sum| bc -l)
ans_fin=$(echo $ans + 1 | bc -l)
echo $ans_fin

 