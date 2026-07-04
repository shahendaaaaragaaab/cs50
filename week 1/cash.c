#include <cs50.h>
#include <stdio.h>
int main(void)
{
    int n;
    do
    {
        n = get_int("change owed: ");
    }
    while (n <= 0);
    int counter = 0;
    while (n >= 25)
    {
        n = n - 25;
        counter++;
    }
    while (n >= 10)
    {
        n = n - 10;
        counter++;
    }
    while (n >= 5)
    {
        n = n - 5;
        counter++;
    }
    while (n >= 1)
    {
        n = n - 1;
        counter++;
    }
    printf("%i\n", counter);
}
