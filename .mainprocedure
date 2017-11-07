void setup() {  

  String[] stringPokemon = loadStrings("pokemon.txt");
  //stringPokemon is the array of unsplit text
  
  String[] questions = loadStrings("questions.txt");
  //questions is the array of questions
  
  String[][] splitStringPokemon = new String[stringPokemon.length][questions.length + 1];
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
  
  ArrayList<Pokemon>possiblePokemon = new ArrayList<Pokemon>();
  //possiblePokemon is the array list of type Pokemon, instead of string
  
  for (int i = 0; i < splitStringPokemon.length; i++) {
    possiblePokemon.add(new Pokemon(splitStringPokemon[i], questions));
  }
  
  boolean pokemonFound = false;
  while (pokemonFound == false){
    String question = pickQuestion(questions, possiblePokemon);
    displayQuestion(question);
    
    
  }
  
}


void draw() {
}


void drawButtons() {

  //YES BUTTON
  fill(0,255,0);
  rect(100, 150, 50, 50);
  
  fill(255,255,0);
  text("YES", 110, 175);
  
  //NO BUTTON
  fill(255,0, 0);
  rect(200, 150, 50, 50);
  
  fill(255,255,0);
  text("NO", 210, 175);
}


void displayQuestion(String i) {
  fill( 255 );
  text(i, 10, 100);
}


boolean yesButtonWasClicked() {
  if( mouseX >= 100 && mouseX <=150 && mouseY >= 150 && mouseY <=200 )
      return true;
      
  else
    return false;
}


boolean noButtonWasClicked() {
  if( mouseX >= 200 && mouseX <=250 && mouseY >= 150 && mouseY <=200 )
      return true;
      
  else
    return false;
}


void mouseClicked(){
  if( yesButtonWasClicked() ) {
    println("You answered YES");
    
    
    background(0);
    
    drawButtons();
  }
  else if( noButtonWasClicked() ) {
    println("You answered NO");
    
    background(0);
    drawButtons();
  }
}
