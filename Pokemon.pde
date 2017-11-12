class Pokemon {
  String name;
  String[] answers;
  //question index matches answers index
  
  Pokemon (String[] ssp){ //ssp = splitStringPokemon
    this.name = ssp[0];
    this.answers = new String[ssp.length + 12]; //+13 to make room for type answers and -1 to remove name space 
    for (int i = 1; i < ssp.length; i++){
      this.answers[i - 1] = ssp[i];
    }
  }
  
  boolean getAnswer (int questionNumber){
    String a = this.answers[questionNumber];
    String b = "TRUE";
    if (a.equals(b)){
      return true;
    }
    else
      return false;
  }
  
}