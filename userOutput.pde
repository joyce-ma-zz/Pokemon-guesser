boolean userOutput (Pokemon pokemonGuess){
  //displays the program's guess
  text("Is your pokemon " + pokemonGuess.name, 100, 100);
  drawButtons();
  if (yesButtonWasClicked()){
    //if program guessed correctly
    return true;
  }
  else if (noButtonWasClicked()){
    //if program did not guess the correct pokemon
    return false;
  }
  
}