void userInput(ArrayList<Pokemon>possiblePokemon, String[] questions){
  if (possiblePokemon.size() > 1){
    background (0);
    drawButtons();
    displayQuestion(questions[questionPicker(possiblePokemon, questions)]);
  }
  else if (possiblePokemon.size() == 0){
    println("no choice");
  }
  else{
    userOutput(possiblePokemon.get(0));
  }
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


void displayQuestion(String i) { //use questionPicker to find i
  
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