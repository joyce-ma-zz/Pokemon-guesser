void userOutput (Pokemon pokemonGuess){
  background(50);
  fill (100,100,255);
  rect(0,200,1000,800);
  displayQuestion("Is your pokemon " + pokemonGuess.name + "?");
  drawButtons();
}