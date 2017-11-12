class Pokemon {
  String name;
  String[] answers;
  //question index matches answers index
  
  Pokemon (String[] ssp){ //ssp = splitStringPokemon
    this.name = ssp[0];
    print (this.name);
    this.answers = new String[ssp.length - 1]; 
    for (int i = 1; i < ssp.length; i++){
      this.answers[i - 1] = ssp[i];
      println (this.answers[i - 1]);
    }
  }
  
  boolean getAnswer (int questionNumber){
    String a = this.answers[questionNumber];
    if (a == "TRUE")
      return true;
    else
      return false;
  }
  
}