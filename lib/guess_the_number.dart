//ignore_for_file: avoid_print

import 'dart:io';

import 'game.dart';


void main(){
  var platagain = false;
  var countplay = 1;
  var round = 0;
  List<int> MyList = [];
  do {
    var game = Game();
    late GuessResult guessResult;

    print('╔═════════════════════════════════════════');
    print('║          Guess The Number     ');
    print('╠═════════════════════════════════════════');

    do {
      stdout.write('║ Guess the number between 1 and 100 : ');
      var input = stdin.readLineSync();

      if (input == null) {
        //print('║ !Erorr!, !Input Is NULL!');
        return;
      }
      var guess = int.tryParse(input);
      if (guess == null) {
        //print('║ !Invalid Input Error!, !!Please Enter Number Only!!');
        continue;
      }

      guessResult = game.doGuess(guess);
      if (guessResult == GuessResult.correct) {
        print('║ ➜ $guess ❤ !IS CORRECT! ❤ Totals Guesses ${game
            .getTotalGuesses()}');
        print('║═════════════════════════════════════════');
        print('║                THE END     ');
        print('╚═════════════════════════════════════════');
      }
      else if (guessResult == GuessResult.tooHigh) {
        print('║ ➜ $guess ▲ !IS TOO HIGH! ▲');
      }
      else {
        print('║ ➜ $guess ▼ !IS TOO LOW! ▼');
      }
    } while (guessResult != GuessResult.correct);

    print('Play Again?');
    stdout.write('Press Enter Y or N :');
    var start = stdin.readLineSync();
    if (start == 'Y') {
      platagain = false;
      countplay++;
      continue;
    }
    else if(start =='N'){
      platagain = true;
      print('You play all $countplay mach');
      round++;
      MyList.add(round);


    }
  }while(!platagain);
  for(int i=0;i<MyList.length;i++){
    stdout.write('Round ${i+1} press ');
    stdout.write(MyList[i]);
    print(" Time");
  }
}