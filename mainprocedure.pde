
  String[] stringPokemon = loadStrings("pokemon.txt");
  //stringPokemon is the array of unsplit text
  
  String[] questions = loadStrings("questions.txt");
  //questions is the array of questions
  
  String[][] splitStringPokemon = new String[stringPokemon.length][questions.length + 1];
  
    ArrayList<Pokemon>possiblePokemon = new ArrayList<Pokemon>();
  //possiblePokemon is the array list of type Pokemon, instead of string
  
  void setup() {  

  for (int i = 0; i < splitStringPokemon.length; i++) {
    String[] rowPokemon = split(stringPokemon[i], '\t');
    //rowPokemon splits the long strings in stringPokemon into multiple strings
    //each one pertaining to a specific question's answer or the Pokemon's name
    for (int j = 0; j < questions.length + 1; j++) {
      splitStringPokemon[i][j] = rowPokemon[j];
    }
  }
  
  for (int i = 0; i < splitStringPokemon.length; i++){
    for (int j = 0; j < questions.length + 1; j++){
      print (splitStringPokemon[i][j], "  ");
    }
    println("");
  }
  
  //splitStringPokemon is a 2D array where each row is a pokemon,
  //the first column has the pokemon names
  //and the other columns are the answers to the
  //different questions in the questions array
  

  for (int i = 0; i < splitStringPokemon.length; i++) {
    possiblePokemon.add(new Pokemon(splitStringPokemon[i]));
  }
  
  Pokemon pokemonGuess = userInput(possiblePokemon, questions);
  //userOutput(pokemonGuess);
  
}


void mouseClicked(){

  if( yesButtonWasClicked() ) { //return userAnswer
    println("You answered YES");
    userAnswer[i] = true;
    
    background(0);
    drawButtons();
    displayQuestion(questionPicker(possiblePokemon, questions));
  }
  
  else if( noButtonWasClicked() ) { //return userAnswer
    println("You answered NO");
    userAnswer[i] = false;
    
    background(0);
    drawButtons();
    displayQuestion(questionPicker(possiblePokemon, questions));
  }
}