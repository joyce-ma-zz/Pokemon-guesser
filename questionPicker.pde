
int questionPicker(ArrayList<Pokemon> possiblePokemon, String[] questions){
  int trues = 0;
  float [] ratio = new float[questions.length];
  float bestDiff = 1;
  int bestQuestion = 0;
  
  for (int i = 0; i < questions.length; i++){             //Goes through all of the questions
    trues = 0;
    for (int j = 0; j < possiblePokemon.size(); j++){     //Goes through all of the pokemon
      if (possiblePokemon.get(j).getAnswer(i)){
        trues++;
      }
    }
    ratio[i] =  (float)trues/possiblePokemon.size(); // ratio of true/total
    //debug
    //println (questions[i], ratio[i]);
  }
  
  for (int i = 0; i < ratio.length; i++){ //Checks if ratio[i] is closer to 0.5 than bestRatio
    if (bestDiff > abs(ratio[i] - 0.5)){
      bestDiff = abs(ratio[i] - 0.5);
      bestQuestion = i;
    } 
  }
  return (bestQuestion);
  
}