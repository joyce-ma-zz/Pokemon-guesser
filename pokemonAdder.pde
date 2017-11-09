void setup() {
  PrintWriter pw;
  String[] lines = loadStrings("pokemon.txt");
  pw = createWriter("data\pokemon.txt");
  ArrayList<String> newLines = new ArrayList<String>(50);
  
  // Add 'false' to the end of all items in the text file
  for (int i=0; i<lines.length; i++) {
    // Split data into string
    String nextLine = lines[i];
    String[] pokemonData = new String[nextLine.split("\t").length+1];
    pokemonData = nextLine.split("\t");
    // Add false to the end
    pokemonData[nextLine.split("\t").length+1] = "false";
    String joinedPokemonData = String.join("\t", pokemonData);
    newLines.add(joinedPokemonData);
  }
 
  pw.println(joinedPokemonData);
  pw.close();
}
