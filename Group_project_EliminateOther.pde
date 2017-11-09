

Pokemon eliminate (Pokemon other){
   boolean inputA, boolean corrA; // Input answer, correct answer, and 
   Pokemon p; //pokemon this can apply to
   inputA = this.answers;
   corrA = other.answers;
   p = this.p;   
   
   Pokemon[] eliminatedPokemon; // set empty array to keep track of eliminated pokemon

   if (A == false){ //go through possible pokemon, eliminating the ones that ae not possible
     for (int i = 0; i <p.length(); i++){
         int e = i;
       if (corrA == true){ 
         eliminatedPokemon.add(e);
         p[i].remove();
       } 
     }
   }
   else if (A == true){ // same as above but for T,F instead of F,T
     for (int i = 0;i <p.length(); i++){
         int e = i;
       if (corrA == false){
         eliminatedPokemon.add(e);
         p[i].remove();
       }
     }
   }
}