#include <stdio.h>

int isPrime(int n){
    if (n==1 || n==2){
        return 1;
    }
    else {
        for (int i = 2; i <= n / 2; ++i) {
            if (n % i == 0) return 0 ;
        }
    }
    return 1;
}

int isStrong( int n ){
    int m = n;
    int sum = 0;
    int rest = 0;
    while (m>0){
        rest = m%10;
        int sum2=rest;
        while (rest>1){
            rest--;
            sum2 = sum2*rest;
        }
        sum+=sum2;
        m=m/10;
    }
    if (sum == n) return 1;
    else return 0;
    
}



