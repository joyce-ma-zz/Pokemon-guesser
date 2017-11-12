ArrayList eliminate (ArrayList <Pokemon>possiblePokemon, boolean inputA, int answerNum){
  ArrayList<Pokemon> nPossiblePokemon = new ArrayList<Pokemon>();
  
  if (inputA == false){ //go through possible pokemon, adding the ones that are possible
     for (int i = 0; i < possiblePokemon.size(); i++){
       if (possiblePokemon.get(i).getAnswer(answerNum) == false){ 
         nPossiblePokemon.add(possiblePokemon.get(i));
       } 
     }
   }
   
   else if (inputA == true){ // same as above but for true
     for (int i = 0; i <possiblePokemon.size(); i++){
       if (possiblePokemon.get(i).getAnswer(answerNum) == true){
         nPossiblePokemon.add(possiblePokemon.get(i));
       }
     }
   }
  
  return nPossiblePokemon;
}