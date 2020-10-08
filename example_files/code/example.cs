using System;
class GuessTheNumberGame
{
    // Guess the number: example taked from http://www.rosettacode.org/
    static void Main()
    {
        int randomNumber = new Random().Next(1, 11);
 
        Console.WriteLine("I'm thinking of a number between 1 and 10. Can you guess it?");
        while(true)
        {
            Console.Write("Guess: ");
            if (int.Parse(Console.ReadLine()) == randomNumber)
                break;
            Console.WriteLine("That's not it. Guess again.");
        }
        Console.WriteLine("Congrats!! You guessed right!");
    }
};