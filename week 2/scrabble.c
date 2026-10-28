#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
int koko(string word);
int main()
{
    string word1 = get_string("Player 1:");
    string word2 = get_string("Player 2:");
    int new_word1 = koko(word1);
    int new_word2 = koko(word2);
    if (new_word1 > new_word2)
    {
        printf("Player 1 Wins!\n");
    }
    else if (new_word1 < new_word2)
    {
        printf("Player 2 Wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }
}
int koko(string word)
{
    int points[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};
    int sum = 0;
    for (int i = 0; word[i] != '\0'; i++)
    {
        if (isalpha(word[i]))
        {
            char capital = toupper(word[i]);
            int index = capital - 'A';
            sum = sum + points[index];
        }
    }
    return sum;
}
