//indicate name input is needed for entering pokemon
boolean needInputN = false;

//indicate question input is needed for entering pokemon
boolean needInputQ = false;

//user's text input
String inputCache = "";

void keyPressed() {
  if (needInputN) {
    userTyping(key, "Type your Pokemon's name.");
  }
  if (needInputQ) {
    userTyping(key, "Type a question only true for that Pokemon.");
  }
}

void userTyping(char character, String request) {
  if ( character >= 'A' && character <= 'Z' || character >= 'a' && character <= 'z' || character =='-'
  || character == '?' || character == ' ') {
    inputCache += character;
  } else if ( (character == BACKSPACE || character == DELETE) && inputCache.length() > 0 ) {
    inputCache = inputCache.substring(  0, inputCache.length()-1 );
  } else if (character == ENTER || character == RETURN) {
    if (inputCache.length() > 0){
      enterKeyPressed();
    }
  }
  background(0);
  textSize(20);
  text("Oops! We don't have your Pokemon. Answer these questions to add it.", 20, 300);
  textSize(45);
  text(inputCache, 500 - inputCache.length()*15, 500);
  displayQuestion(request);

}

void enterKeyPressed(){
  if (needInputQ) {
    ////pokemonAdder(userAnswer, inputCache);
    //debug
    println ("question " + inputCache);
    needInputQ = false;
    background(0);
    displayQuestion("Thanks for entering a Pokemon!");
  }
  else if (needInputN){
    
    getNewRow();
    
    //no longer asks to input name
    needInputN = false;
    
    //asks to input question next
    needInputQ = true;
    //debug
    println ("name " + inputCache);
    inputCache = "";
  }
}

void getNewRow () {
  
  //new string array that contains pokemon's properties
  String[] newRow = new String[userAnswer.length - 13];
  
  //first column of the new row is the pokemon's name
  newRow[0] = inputCache;
  
  //all answers but type answers are entered into new row
  for (int i = 1; i < newRow.length - 1; i++) {
    newRow[i] = userAnswer[i-1];
  }
  //pokemon type is entered into last column of new row
  for (int i = userAnswer.length - 14; i < userAnswer.length; i++) {
    if (userAnswer[i].equals("TRUE")) {
      newRow[newRow.length - 1] = questions[i].substring(6, questions[i].length() - 6);
    }
  }
}