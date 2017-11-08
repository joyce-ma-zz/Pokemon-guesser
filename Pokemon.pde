class Pokemon {
  String name;
  String[] answers;
  String[] questions; //question index matches answers index
  
  Pokemon (String[] ssp, String[] q){
    this.name = ssp[0];
    print (this.name);
    this.answers = new String[questions.length]; 
    for (int i = 1; i < ssp.length; i++){
      this.answers[i - 1] = ssp[i];
      println (this.answers[i - 1]);
    }
    this.questions = q;
  }
  
}
