import java.util.Arrays;
import java.util.List;
PrintWriter pw;
PrintWriter questionPw;

String[] stringPokemon;

String[] questions;

String[][] splitStringPokemon;

ArrayList<Pokemon>possiblePokemon = new ArrayList<Pokemon>();
//possiblePokemon is the array list of type Pokemon, instead of string

String[] userAnswer;
int numUQ = 0;

//input cache to read user's input when needed.
String inputCache;
//indicate name input is needed for entering pokemon
boolean needInputN;
//indicate question input is needed
boolean needInputQ;

void setup() {  

  size(1000, 1000);

  stringPokemon = loadStrings("pokemon.txt");
  //stringPokemon is the array of unsplit text

  questions = loadStrings("questions.txt");
  //questions is the array of questions

  userAnswer = new String[questions.length];
  //user answers are stored in case a new pokemon should be created

  //user's words
  inputCache = "";
  
  needInputN = false;
  needInputQ = false;
  
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
  //the first column has the pokemon names  for ( i = 0;

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

}


void draw() {

}

void mouseClicked() {
  if ( yesButtonWasClicked() ) { //return userAnswer
    if (needInputQ){
      int unaskedQ = 0;
      for (int i = 0; i < userAnswer.length; i++){
        if (userAnswer[i] == null){
          unaskedQ = i;
        }
      }
      userAnswer[unaskedQ] = "TRUE";
      
      background (0);
      fill(255);
      unaskedQ = 0;
      textSize(20);
      text("Guessed wrong... Please answer these questions so we can add your Pokemon.", 20, 300);
      for (int i = 0; i < userAnswer.length; i++){
        if (userAnswer[i] == null){
          unaskedQ = i;
          numUQ ++;
        }
      }
      if (numUQ > 0){
        drawButtons();
        displayQuestion(questions[unaskedQ]);
      }
      else {
        needInputQ = false;
        needInputN = true;
      }

    }
    else if (possiblePokemon.size() == 1){
      background (0);
      displayQuestion("Guessed right!");
    }  
    else{
      int questionNum = questionPicker(possiblePokemon, questions);
      possiblePokemon = eliminate(possiblePokemon, true, questionNum);
      userAnswer[questionNum] = "TRUE";
      userInput(possiblePokemon, questions);
    }
  } 
  else if ( noButtonWasClicked() ) { //return userAnswer
    if (needInputQ){
      int unaskedQ = 0;
      for (int i = 0; i < userAnswer.length; i++){
        if (userAnswer[i] == null){
          unaskedQ = i;
        }
      }
      userAnswer[unaskedQ] = "FALSE";
      
      background (0);
      fill(255);
      unaskedQ = 0;
      textSize(20);
      text("Guessed wrong... Please answer these questions so we can add your Pokemon.", 20, 300);
      for (int i = 0; i < userAnswer.length; i++){
        if (userAnswer[i] == null){
          unaskedQ = i;
          numUQ ++;
        }
      }
      if (numUQ > 0){
        drawButtons();
        displayQuestion(questions[unaskedQ]);
      }
      else {
        needInputQ = false;
        needInputN = true;
      }
    }
    else if (possiblePokemon.size() == 0 || possiblePokemon.size() == 1){
      background (0);
      fill(255);
      int unaskedQ = 0;
      textSize(20);
      text("Guessed wrong... Please answer these questions so we can add your Pokemon.", 20, 300);
      for (int i = 0; i < userAnswer.length; i++){
        if (userAnswer[i] == null){
          unaskedQ = i;
          numUQ ++;
        }
      }
      drawButtons();
      displayQuestion(questions[unaskedQ]);
      needInputQ = true;
      //pokemonAdder(pokemonToAdd, pokemonGuess, questionToAdd);
    }  
    else{
      int questionNum = questionPicker(possiblePokemon, questions);      
      possiblePokemon = eliminate(possiblePokemon, false, questionNum);
      userAnswer[questionPicker(possiblePokemon, questions)] = "FALSE";
      userInput(possiblePokemon, questions);
    }
  }
  
}