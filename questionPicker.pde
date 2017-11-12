
int questionPicker(ArrayList<Pokemon> possiblePokemon, String[] questions){
  int falses = 0;
  int trues = 0;
  float [] ratio = new float[questions.length];
  float bestRatio = 1;
  int ratioNum = 0;
  
  for (int i = 0; i < questions.length; i++){             //Goes through all of the questions
    for (int j = 0; j < possiblePokemon.size(); j++){     //Goes through all of the pokemon
      if (possiblePokemon.get(j).getAnswer(i)){
        trues++;
      }
      else{
        falses++;
      }
    }
    ratio[i] =  (float)trues/(falses + trues); // ratio of true/total   
  }
  
  for (int i = 0; i < ratio.length; i++){ //Checks if ratio[i] is closer to 0.5 than bestRatio
    if (bestRatio > abs(ratio[i] - 0.5)){
      bestRatio = abs(ratio[i] - 0.5);
      ratioNum = i;
    } 
  }
  return (ratioNum);
  
}