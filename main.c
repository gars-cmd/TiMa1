#include <stdio.h>
#include "NumClass.h"


int main(int argc, char const *argv[])
{
int a = 0;
int b = 0;
scanf("%d" , &a);
scanf("%d" , &b);

printf("The Armstrong numbers are:");
for (int i = a; i <= b; i++)
{
    if (isArmstrong(i)==1)
    {
        printf(" %d" , i);
    }
    
}
printf("\n");
printf("The Palindromes are:");
for (int i = a; i <= b; i++)
{
    if (isPalindrome(i)==1)
    {
        printf(" %d" , i);
    }
    
}

printf("\n");
printf("The Prime numbers are:");
for (int i = a; i <= b; i++)
{
    if (isPrime(i)==1)
    {
        printf(" %d" , i);
    }
    
}

printf("\n");
printf("The Strong numbers are:");
for (int i = a; i <= b; i++)
{
    if (isStrong(i)==1)
    {
        printf(" %d" , i);
    }
    

}
printf("\n");
    return 0;
}
