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
  stringPokemon = loadStrings("pokemon.txt");
  //stringPokemon is the array of unsplit text
  
  String[] questions = loadStrings("questions.txt");
  //questions is the array of questions
  
  userAnswer = new boolean[questions.length];
  
  splitStringPokemon = new String[stringPokemon.length][questions.length + 1];

  for (int i = 0; i < splitStringPokemon.length; i++) {
    String[] rowPokemon = split(stringPokemon[i], '\t');
    //rowPokemon splits the long strings in stringPokemon into multiple strings
    //each one pertaining to a specific question's answer or the Pokemon's name
    for (int j = 0; j < questions.length + 1; j++) {
      splitStringPokemon[i][j] = rowPokemon[j];
    }
  }
  //splitStringPokemon is a 2D array where each row is a pokemon,
  //the first column has the pokemon names
  //and the other columns are the answers to the
  //different questions in the questions array


  for (int i = 0; i < splitStringPokemon.length; i++) {
    possiblePokemon.add(new Pokemon(splitStringPokemon[i]));
  }

  Pokemon pokemonGuess = userInput(possiblePokemon, questions);
  
  println(pokemonGuess.name);
  //useroutput doesnt work rn
  //if (userOutput(pokemonGuess)){
  //  println("guessed right!");
  //}
  // else {
  // doesnt work rn    pokemonAdder(pokemonToAdd, pokemonGuess, questionToAdd);
  //  }

}

  void draw() {
  }

  //void mouseClicked(){

  //  if( yesButtonWasClicked() ) { //return userAnswer
  //    println("You answered YES");
  //    userAnswer[i] = true;

  //    background(0);
  //    drawButtons();
  //    displayQuestion(questionPicker(possiblePokemon, questions));
  //  }

  //  else if( noButtonWasClicked() ) { //return userAnswer
  //    println("You answered NO");
  //    userAnswer[i] = false;

  //    background(0);
  //    drawButtons();
  //    displayQuestion(questionPicker(possiblePokemon, questions));
  //  }
  //}