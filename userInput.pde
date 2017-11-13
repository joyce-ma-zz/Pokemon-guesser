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
  textSize(50);
  
  fill(255,255,75);
  ellipse(500,100,500,175);
  
  fill(0);
  text("Pokemon Guesser",290,115);

  fill(230);
  rect(185,450,630,300);
  
  //YES BUTTON
  fill(0,255,0);
  rect(225, 500, 200, 200);
  
  fill(255,255,0);
  text("YES", 275, 600);
  
  //NO BUTTON
  fill(255,0, 0);
  rect(575, 500, 200, 200);
  
  fill(255,255,0);
  text("NO", 625, 600);
}


void displayQuestion(String i) { //use questionPicker to find i
  
  fill( 255 );
  text(i, 125, 360);
  
}


boolean yesButtonWasClicked() {
  if( mouseX >= 225 && mouseX <= 425 && mouseY >= 500 && mouseY <=700 )
      return true;
      
  else
    return false;
}


boolean noButtonWasClicked() {
  if( mouseX >= 575 && mouseX <=775 && mouseY >= 500 && mouseY <=700 )
      return true;
      
  else
    return false;
}  