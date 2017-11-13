import java.util.Arrays;
import java.util.List;
PrintWriter pw;
PrintWriter questionPw;

String[] stringPokemon;

String[] questions;

String[][] splitStringPokemon;

ArrayList<Pokemon>possiblePokemon = new ArrayList<Pokemon>();
//possiblePokemon is the array list of type Pokemon, instead of string

boolean[] userAnswer;


void setup() {  

  size(500, 500);

  stringPokemon = loadStrings("pokemon.txt");
  //stringPokemon is the array of unsplit text

  questions = loadStrings("questions.txt");
  //questions is the array of questions

  userAnswer = new boolean[questions.length];
  //user answers are stored in case a new pokemon should be created

  splitStringPokemon = new String[stringPokemon.length][questions.length + 1];

  for (int i = 0; i < splitStringPokemon.length; i++) {
    String[] rowPokemon = split(stringPokemon[i], '\t');
    //rowPokemon splits the long strings in stringPokemon into multiple strings
    //each one pertaining to a specific question's answer or the Pokemon's name
    splitStringPokemon[i][0] = rowPokemon[0];
    splitStringPokemon[i][1] = rowPokemon[1];
    //there are some spaces left blank for the type true-or-false answers(values to be assigned later)
    for (int j = 15; j < splitStringPokemon[0].length; j++) {
      splitStringPokemon[i][j] = rowPokemon[j - 13];      
    }
  }
  //splitStringPokemon is a 2D array where each row is a pokemon,
  //the first column has the pokemon names
  //and the other columns are the answers to the
  //different questions in the questions array

  for (int i = 0; i < splitStringPokemon.length; i++) {
    possiblePokemon.add(new Pokemon(splitStringPokemon[i]));
    String type = "Is it " + possiblePokemon.get(i).answers[0] + " type?";
    for (int j = 0; j < 14; j++){
      if (type.equals(questions[j]))
        possiblePokemon.get(i).answers[j] = "TRUE";
      else
        possiblePokemon.get(i).answers[j] = "FALSE";
    }
  }

  userInput(possiblePokemon, questions);

  //useroutput doesnt work rn
  //if (userOutput(pokemonGuess)) {
  //  println("guessed right!");
  //} else {
  //  pokemonAdder(pokemonToAdd, pokemonGuess, questionToAdd);
  //}
}


void draw() {
}

void mouseClicked() {
  if ( yesButtonWasClicked() ) { //return userAnswer
  
    println("You answered YES");
    
    int questionNum = questionPicker(possiblePokemon, questions);

    println("possible pokemon size before eliminating " + possiblePokemon.size());
    
    possiblePokemon = eliminate(possiblePokemon, true, questionNum);
    userAnswer[questionNum] = true;
    
    println("possible pokemon size after eliminating " + possiblePokemon.size());

    userInput(possiblePokemon, questions);
    
  } 
  
  else if ( noButtonWasClicked() ) { //return userAnswer
  
    println("You answered NO");
    
    println("possible pokemon size before eliminating " + possiblePokemon.size());

    int questionNum = questionPicker(possiblePokemon, questions);      
    possiblePokemon = eliminate(possiblePokemon, false, questionNum);
    userAnswer[questionPicker(possiblePokemon, questions)] = false;
    userInput(possiblePokemon, questions);
    
    println("possible pokemon size after eliminating " + possiblePokemon.size());

  }
  
}