//String type (){
//  String words = "asdf";
//  boolean done = false;
//  println("hey ");
//    if (keyPressed) {
//      //debug
//      println("ke");
//      println("key="+char(key));
//      if (key == ENTER){
//        done = true;
//      }
//      else{
//        words += char(key);
//        text(words, 20, 120);
//      }
//  }
//  return words;
//}

void keyPressed() {
  if (needInputN) {
    if ( key >= 'A' && key <= 'Z' || key >= 'a' && key <= 'z' || key =='-') {
      inputCache += char(key);
    }
    else if ( (key == BACKSPACE || key == DELETE) && inputCache.length() > 0 ) {
      inputCache = inputCache.substring(  0, inputCache.length()-1 );
    }
    else if (key == ENTER || key == RETURN){
      //add pokemon here.
      println("Pokemon to add:");
      println("name="+ inputCache);
      for (int i = 0; i < userAnswer.length; i++){
         println(userAnswer[i]);
      }
      println();
    }
    background(0);
    displayQuestion("Enter your Pokemon's name.");
    text(inputCache, 20, 120);
  }
}