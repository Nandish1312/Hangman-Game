%function Game_Hangman, the main function of the program. it only runs the program. does not take any input arguments 

%this Draw_Gallows() function will create a figure of gallows which is integrated with the first function Game_Hnagman().

%this stage was to test whether the Draw_Gallows fucntion makes a gallows or not

function Game_Hangman()

%print function for the introduction of the game 

fprintf("welcome to the game- HANGMAN\n");
fprintf("The game is all about guessing a word, each wrong letter will result to hanging one body part such as a \nhand or a leg to a gallows and at the end if the gamer fails to guess the word correctly, he/she looses");
fprintf("\n");

%calling Draw_Gallows function to create the initial figure of gallows 

Draw_Gallows()

%calling the random function randi to generate a set of random integers 

Word_Selection = randi(15);

%selecting a random word to play with using switch case with 15 different cases 

switch Word_Selection
    case 1
        Random_Word = 'hardwork';
    case 2
        Random_Word = 'success';
    case 3
        Random_Word = 'communication';
    case 4
        Random_Word = 'communicator';
    case 5
        Random_Word = 'perspective';
    case 6
        Random_Word = 'perception';
    case 7
        Random_Word = 'reflective';
    case 8
        Random_Word = 'balanced';
    case 9
        Random_Word = 'principled';
    case 10
        Random_Word = 'thinker';
    case 11
        Random_Word = 'caring';
    case 12
        Random_Word = 'inquirer';
    case 13
        Random_Word = 'knowledgeable';
    case 14
        Random_Word = 'informative';
    case 15
        Random_Word = 'sensible';  
        
%end of switch case 

end

%finding the length of the word generated 

Length_Word = length(Random_Word);

%declaring an empty array to hold the letters unknown 

Unknown_Word = [];

%setting each character of the word to an hash 

for i = (1:Length_Word)
    Unknown_Word = [Unknown_Word '#'];
    
%end of for loop   
end


%printing the unknown word using the print function 

fprintf("the word is %s \n", Unknown_Word);

%declaring the number of correct, incorrect and number of guesses left 

Wrong_Guesses = 0;
Correct_Letters = 0;
Number_GuessesLeft = 6;

%initiaing a while loop unitll the Number_GuessesLeft = 0

while 1
   
    %asking the user for a letter 
    
    Input_Letter = input("Guess a letter: ", 's');
   
    %converting the input letter to lowercase
    
    Letter_ToLower = lower(string(Input_Letter));
    
    %searching for the letter inside the word 
    
    Find_LetterInString = strfind(Random_Word, Letter_ToLower);
    
    %taking the length of Find_LetterInString to find the numbers of correctly guessed letters 
    
    Correct_LengthInput = length(Find_LetterInString);
    
    %adding the correct input letters to the Correct letters 
    
    Correct_Letters = Correct_Letters + Correct_LengthInput;
    
    %if condition to check the whether the letter is correct or not
    
    if (Correct_LengthInput >= 1)
        
        %looping through the Correct length input  
        
        for i = (1:Correct_LengthInput)
            
            %if statement 
            if (Length_Word == Correct_Letters)
                
            %call the Game_End function 
            Game_End(Length_Word, Correct_Letters, Random_Word)
            
              return;
            else 
                fprintf("correct letter guessed ");
                
            %end of if statement
            end 
            
             %replacing the index of the # with the correctly guessed letter 
             
             Unknown_Word(Find_LetterInString(i))=Letter_ToLower;
             
             %printing the known letters of the word 
             
             fprintf("%s\n", Unknown_Word);
                
        %end of for loop 
        
        end 
        
    else 
        
         %incrementing the number wrong by one 
         
         Wrong_Guesses = Wrong_Guesses + 1;
         
         %calling the function that draws the hangman 
         
         %Draw_HangingMan(Wrong_Guesses)
         
         %checking whether to end the game or not 
         
         if (Wrong_Guesses == 6)
             
             %printfunction to print the unknown word
             
             fprintf("%s\n", Unknown_Word);
             
              %call the Game_End function to end the game
             
             %Game_End(Length_Word, Correct_Letters, Random_Word)
             
             %breaking the while loop
             
             break;
             
         else
             
             fprintf("wrong letter\n");
             Number_GuessesLeft = Number_GuessesLeft - 1;
             fprintf("%d more false alarm remaining\n", Number_GuessesLeft)
             fprintf("%s\n", Unknown_Word);
             
         %end of if statement 
         
         end 
         
    %end of if statement  
    
    end 
    
%end of while statment 
    
end 

%end of the function Game_Hangman

end 

%this function will create a figure of gallows which is integrated with the first function Game_Hnagman().

function Draw_Gallows()

%to hold on to the subject in the figure rather than replacing it 
hold on 

%rectangle to create the boarder of the image 
rectangle('position', [5 5 5 5], 'LineWidth', 5, 'edgecolor','k');

%lines are the lines that form the gallows to be used
%3 simple lines are being used to create the drawing 

%'k' is used to make the lines black 

S1 = line([9,9],[9,5]);
S1.Color = 'k';
S1.LineWidth = 4;

S2 = line([7.5,9], [9,9]);
S2.Color = 'k';
S2.LineWidth = 4;

S2 = line([7.5,7.5], [8,9]);
S2.Color = 'k';
S2.LineWidth = 4;

%end of the function 

end 

