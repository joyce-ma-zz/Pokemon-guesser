

ArrayList eliminate (ArrayList <Pokemon>possiblePokemon, boolean inputA  , int answerNum){

//pokemon this can apply to
   //p = this.possiblePokemon;   

   if (inputA == false){ //go through possible pokemon, eliminating the ones that ae not possible
     for (int i = 0; i < possiblePokemon.size(); i++){
       if (possiblePokemon.get(i).getAnswer(answerNum) == true){ 
         possiblePokemon.remove(i);
       } 
     }
   }
   else if (inputA == true){ // same as above but for T,F instead of F,T
     for (int i = 0;i <possiblePokemon.size(); i++){
       if (possiblePokemon.get(i).getAnswer(answerNum) == false){
         possiblePokemon.remove(i);
       }
     }
   }
  return possiblePokemon;
}