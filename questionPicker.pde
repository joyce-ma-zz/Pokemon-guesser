//Import file
//count trues and falses
//find ratio
// ask question with closest ratio to 1.0 possible

void questionPicker(ArrayList possiblePokemon, String[] questions){
  String[] answers = loadStrings("answers.txt");
  int falses;
  int trues;
  for (int i = 0; i < questions.length; i++){
    for (int j = 0; j < possiblePokemon.size(); j++){
      if (possiblePokemon.get(j).getAnswer(i) == true);
    }
  }

}
