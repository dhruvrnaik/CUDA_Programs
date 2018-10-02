#include <stdio.h>
#include<time.h>
void add(int *a,int *b,int *c,int n ){

	for(int i=0;i<n;i++)
		c[i] = a[i] + b[i]; 

}

int main()
{	clock_t t;
	int k = 100000;
	int a[k],b[k],c[k];
	for(int i=0;i<k;i++){
		a[i] = i;
		b[i] = i;	
	}
	t = clock();
	add(a,b,c,k);
	printf("%d",c[0]);
	t = clock() - t;
	double time_taken = ((double)t)/CLOCKS_PER_SEC; // in seconds  
    printf("\n%f", time_taken);
	return 0;
}