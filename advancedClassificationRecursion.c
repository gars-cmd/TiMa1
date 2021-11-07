#include <stdio.h>

int reverse(int n , int x){
    if (n==0) return x;
    else{
        x= x*10 + n%10;
        n=n/10;
        return reverse(n,x);
    }
}

int isPalindrome(int n){
    int reverso = reverse(n,0);
    if (reverso==n) return 1;
    else return 0;

}

int ArmstrongHelp(int n){
    int count = 0;
    while (n>0){
        n=n/10;
        count++;
    }
    return count;
}

int ArmstrongRecHelp(int n , int count, int sum){
    if (n== 0)return sum;
    else{
        int rest = n%10;
        int calc = 1;
        for (int i = 0; i <count ; i++) {
            calc *=rest;
        }
        sum +=calc;
        return ArmstrongRecHelp(n/10,count,sum);
    }
}

int isArmstrong(int n){
    int count  = ArmstrongHelp(n);
    int sum = 0;
    int new_sum = ArmstrongRecHelp(n,count,sum);
    if (new_sum==n) return 1;
    else return 0;
}




