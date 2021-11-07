#include <stdio.h>


int ArmstrongHelp(int n){
    int count = 0;
    while (n>0){
        n=n/10;
        count++;
    }
    return count;
}

int isArmstrong(int n){
    int a;
    int sum = 0;
    int b = n;
    int i = ArmstrongHelp(n);
    while (b>0){
        int calc = 1;
        a = b%10;
        for (int j = 0; j <i ; ++j) {
            calc *=a;
        }
        sum+=calc;
        b=b/10;
    }
    if (n==sum) return 1;
    else return 0;
}

int isPalindrome(int n){
  int m = n;
  int rest;
  int reverse = 0;
    while (m!=0){
        rest = m%10;
        reverse= reverse*10 + rest;
        m=m/10;
    }
    if (reverse==n) return 1;
    else return 0;
}



