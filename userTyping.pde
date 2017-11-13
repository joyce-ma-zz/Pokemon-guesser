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
    if ( key >= 'A' && key <= 'Z' || key >= 'a' && key <= 'z' ) {
      inputCache += char(key);
    }
    else if ( (key == BACKSPACE || key == DELETE) && inputCache.length() > 0 ) {
      inputCache = inputCache.substring(  0, inputCache.length()-1 );
    }
    else if (key == ENTER || key == RETURN){
      
    }
    background(0);
    displayQuestion("Guessed wrong... What Pokemon were you thinking of?");
    text(inputCache, 20, 120);
  }
}