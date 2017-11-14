void pokemonAdder(String[] newPokemonInfo, String questionToAdd) {
  String[] stringLines = loadStrings("pokemon.txt");
  List<String> lines = new ArrayList<String>(Arrays.asList(stringLines));
  pw = createWriter("data\\pokemon.txt");
  // Create array for data to replace current data in the file
  ArrayList<String> newLines = new ArrayList<String>(60);
  // Append new pokemon info to lines of pokemon file
  lines.add(String.join("\t", newPokemonInfo));
  
  /* Add 'false' to the end of all items in the text file except for
     the one pokemon specified */
     
  // Cycle through all lines
  for (int i=0; i<lines.size(); i++) {
    // Place line data in ArrayList
    List<String> pokemonData = new ArrayList<String>(Arrays.asList(lines.get(i).split("\t")));
    // Make space for new question boolean before pokemon type
    pokemonData.add(pokemonData.get(pokemonData.size()-1));
    // Add 'false' just before type for the new question for all pokemon except
    // for the new one, add 'true' for this one
    if (pokemonData.get(0).equals(newPokemonInfo[0])) {
      pokemonData.set(pokemonData.size()-2, "TRUE");
    } else {
      pokemonData.set(pokemonData.size()-2, "FALSE");
    }
    
    String joinedPokemonData = String.join("\t", pokemonData);
    // Add updated info to newLines
    newLines.add(joinedPokemonData);
  } // Finished adding new question info
  
  // Adding new question to list of questions in text file
  String[] stringQuestionLines = loadStrings("questions.txt");
  List<String> questionLines = new ArrayList<String>(Arrays.asList(stringQuestionLines));
  questionPw = createWriter("data\\questions.txt");
  questionLines.add(questionToAdd);
  // Join new list of question and pokemon w/ their new info into a string
  // separated per line and add them to their respective files
  String questionUpdate = String.join("\r\n", questionLines);
  String pokemonUpdate = String.join("\r\n", newLines);
  questionPw.println(questionUpdate);
  pw.println(pokemonUpdate);
  
  questionPw.close();
  pw.close();
}
