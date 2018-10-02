#include "stdio.h"
#include<math.h>
__global__ void addkernel(int *a,int *b,int *c,int n ){

	int i = threadIdx.x + blockDim.x*blockIdx.x;
	if(i<n){
		c[i] = a[i] + b[i];
	}

}

void add(int *a,int *b,int *c,int n){

	int *ca,*cb ,*cc ;
	int size = n*sizeof(int);
	cudaMalloc((void **)&ca ,size );
	cudaMemcpy(ca,a,size,cudaMemcpyHostToDevice);

	cudaMalloc((void **)&cb ,size );
	cudaMemcpy(cb,b,size,cudaMemcpyHostToDevice);

	cudaMalloc((void **)&cc,size);

	addkernel<<<ceil(n/256.0),256>>>(ca,cb,cc,n);
	cudaMemcpy(c,cc,size,cudaMemcpyDeviceToHost);

}

int main(){
	clock_t t;
	int k = 100000;
	int a[k],b[k],c[k];
	for(int i=0;i<k;i++){
		a[i] = i;
		b[i] = i;	
	}


	t = clock();
	add(a,b,c,k);
	t = clock() - t;
	double time_taken = ((double)t)/CLOCKS_PER_SEC; // in seconds 
    printf("\n%f", time_taken);
	return 0;
}