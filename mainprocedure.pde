String[] stringPokemon;

String[] questions;

String[][] splitStringPokemon;

ArrayList<Pokemon>possiblePokemon = new ArrayList<Pokemon>();
//possiblePokemon is the array list of type Pokemon, instead of string

String[] userAnswer;


//indicate answer input is needed for entering pokemon
boolean needInputA;


void setup() {  

  size(1000, 1000);

  stringPokemon = loadStrings("pokemon.txt");
  //stringPokemon is the array of unsplit text

  questions = loadStrings("questions.txt");
  //questions is the array of questions
  
  userAnswer = new String[questions.length];
  //user answers are stored in case a new pokemon should be created


  needInputA = false;


  splitStringPokemon = new String[stringPokemon.length][questions.length + 1];

  for (int i = 0; i < splitStringPokemon.length; i++) {
    String[] rowPokemon = split(stringPokemon[i], '\t');
    //rowPokemon splits the long strings in stringPokemon into multiple strings
    //each one pertaining to a specific question's answer or the Pokemon's name

    //there are some spaces left blank for the type true-or-false answers(values to be assigned later)
    for (int j = 0; j < rowPokemon.length; j++) {
      splitStringPokemon[i][j] = rowPokemon[j];
    }
  }
  //splitStringPokemon is a 2D array where each row is a pokemon,
  //the first column has the pokemon names  for ( i = 0;

  //and the other columns are the answers to the
  //different questions in the questions array

  for (int i = 0; i < splitStringPokemon.length; i++) {
    possiblePokemon.add(new Pokemon(splitStringPokemon[i]));
    
    //assign true-or-false values for each Pokemon for the type questions
    String type = "Is it " + possiblePokemon.get(i).answers[possiblePokemon.get(i).answers.length - 15] + " type?";
    for (int j = questions.length - 15; j < questions.length; j++) {
      if (type.equals(questions[j])){
        possiblePokemon.get(i).answers[j] = "TRUE";
        //debugging
        //println(possiblePokemon.get(i).name, possiblePokemon.get(i).answers[possiblePokemon.get(i).answers.length - 1]);
      }
      else
        possiblePokemon.get(i).answers[j] = "FALSE";
    }
  }

  userInput(possiblePokemon, questions);
}


void draw() {
}

void mouseClicked() {
  if (!needInputN || !needInputQ) {
    if ( yesButtonWasClicked() ) { //return userAnswer
      //if answering remaining questions to create a new pokemon
      if (needInputA) { 
        int unaskedQ = 0;
        for (int i = 0; i < userAnswer.length; i++) {
          if (userAnswer[i] == null) {
            unaskedQ = i;
          }
        }
        //if user answers true to a pokemon type question
        if (unaskedQ >= userAnswer.length - 15) {
          //set all the types to false
          for (int i = userAnswer.length - 15; i < userAnswer.length; i++) {
            userAnswer[i] = "FALSE";
          }
        }
        //set the correct type as true
        userAnswer[unaskedQ] = "TRUE";

        background (50);
        drawBackground();
        fill(255);
        unaskedQ = 0;
        textSize(20);
        text("Oops! We don't have your Pokemon. Answer these questions to add it.", 20, 300);
        int numUQ = 0;
        for (int i = 0; i < userAnswer.length; i++) {
          if (userAnswer[i] == null) {
            unaskedQ = i;
            numUQ ++;
          }
        }
        //ask an unanswered question
        if (numUQ > 0) {
          drawButtons();
          displayQuestion(questions[unaskedQ]);
        }
        //if all questions have been answered
        else {
          needInputA = false;
          needInputQ = true;
          displayQuestion("Type your Pokemon's name.");
        }
      }
      //if the player confirms the program's guess
      else if (possiblePokemon.size() == 1) {
        background (50);
        fill (100,100,255);
        rect(0,200,1000,800);
        displayQuestion("Guessed right!");
      } 
      //if the user's answers do not match a pokemon in the database
      else if (possiblePokemon.size() == 0) {
        guessWrong();
      }
      //if there are still multiple possible pokemon, continue to ask questions
      else {
        int questionNum = questionPicker(possiblePokemon, questions);
        possiblePokemon = eliminate(possiblePokemon, true, questionNum);
        userAnswer[questionNum] = "TRUE";
        //debug
        //println(questions[questionNum], "TRUE");
        userInput(possiblePokemon, questions);
      }
    } else if ( noButtonWasClicked() ) { //return userAnswer
      //if answering remaining questions to create a new pokemon
      if (needInputA) {
        int unaskedQ = 0;
        for (int i = 0; i < userAnswer.length; i++) {
          if (userAnswer[i] == null) {
            unaskedQ = i;
          }
        }
        userAnswer[unaskedQ] = "FALSE";

        background (50);
        drawBackground();
        fill(255);
        unaskedQ = 0;
        textSize(20);
        text("Oops! We don't have your Pokemon. Answer these questions to add it.", 20, 300);
        int numUQ = 0;
        //debug
        //printArray(userAnswer);
        for (int i = 0; i < userAnswer.length; i++) {
          if (userAnswer[i] == null) {
            unaskedQ = i;
            numUQ++;
          }
        }
        //ask an unanswered question
        if (numUQ > 0) {
          drawButtons();
          displayQuestion(questions[unaskedQ]);
        }
        //if all questions have been answered
        else {
          needInputA = false;
          //ask for name
          needInputN = true;
          displayQuestion("Type your Pokemon's name.");
        }
      }
      //if guessed wrong or no pokemon that matches user's answers
      else if (possiblePokemon.size() == 0 || possiblePokemon.size() == 1) {
        guessWrong();
      }  
      //if there are still multiple possible pokemon, continue to ask questions
      else {
        int questionNum = questionPicker(possiblePokemon, questions);      
        possiblePokemon = eliminate(possiblePokemon, false, questionNum);
        userAnswer[questionNum] = "FALSE";
        //debug
        //println(questions[questionNum], "FALSE");
        userInput(possiblePokemon, questions);
      }
    }
  }
}

//if adding new pokemon
void guessWrong() {
  background (50);
  fill (100,100,255);
  rect(0,200,1000,800);
  fill(255);
  int unaskedQ = 0;
  textSize(20);
  text("Oops! We don't have your Pokemon. Answer these questions to add it.", 20, 300);

  //if user already answered true to a pokemon type question
  boolean enteredType = false;
  if (!enteredType) {
    for (int i = userAnswer.length - 15; i < userAnswer.length; i++) {
      if (userAnswer[i] != null) {
        if (userAnswer[i].equals("TRUE")) {
          //set all the types to false
          for (int j = userAnswer.length - 15; j < userAnswer.length; j++) {
            userAnswer[j] = "FALSE";
          }
          //set the correct type as true
          userAnswer[i] = "TRUE";
        }
      }
    }
  }

  for (int i = 0; i < userAnswer.length; i++) {
    if (userAnswer[i] == null) {
      unaskedQ = i;
    }
  }
  drawButtons();
  displayQuestion(questions[unaskedQ]);
  needInputA = true;
}
