PrintWriter pw;
PrintWriter questionPw;
import java.util.Arrays;
import java.util.List;
  
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
    // for adding 'true' to the new one
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
  List<String> questionLinesBuffer = new ArrayList<String>(25);
  
  for (int i=0; i<questionLines.size(); i++) {
     questionLinesBuffer.add(questionLines.get(i));
  }
  // Shift type-related questions down 1 space to make room for new question
  questionLinesBuffer.add("");
  
  for (int i=questionLinesBuffer.size()-16; i<questionLines.size(); i++) {
    questionLinesBuffer.set(i+1, questionLines.get(i));

  }
  
  questionLinesBuffer.set(questionLinesBuffer.size()-16, questionToAdd);
  // Join new list of question and pokemon w/ their new info into a string
  // separated per line and add them to their respective files
  String questionUpdate = String.join("\r\n", questionLinesBuffer);
  String pokemonUpdate = String.join("\r\n", newLines);
  questionPw.println(questionUpdate);
  pw.println(pokemonUpdate);
  
  questionPw.close();
  pw.close();
}
