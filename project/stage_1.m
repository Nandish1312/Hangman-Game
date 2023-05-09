%this stage is to check whether the program is being able to print the introductory statements about the game, randomly selecting the word and printing the corresponding hashes.

function Game_Hangman()

%print function for the introduction of the game 

fprintf("welcome to the game- HANGMAN\n");
fprintf("The game is all about guessing a word, each wrong letter will result to hanging one body part such as a \nhand or a leg to a gallows and at the end if the gamer fails to guess the word correctly, he/she looses");
fprintf("\n");

%calling Draw_Gallows function to create the initial figure of gallows 

%Draw_Gallows()

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