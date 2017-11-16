void userOutput (Pokemon pokemonGuess){
  background(50);
  drawBackground();
  displayQuestion("Is your pokemon " + pokemonGuess.name + "?");
  drawButtons();
}