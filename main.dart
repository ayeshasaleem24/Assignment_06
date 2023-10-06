import 'dart:math';
import 'dart:io';

void main() {
  final quiz = Quiz();
  quiz.start();
}

class Quiz {
  Map<String, String> questions = {
    "What is 9 * 9 ": "81",
    "What is a group of crows called?": "murder",
    "how many rivers in pakistan?": "24",
    "What is the capital of Italy?": "Rome",
    "what is the capital of pakistan?": "Islamabad",
    "What is the largest planet in our solar system?": "Jupiter",
    "What is the symbol for oxygen in chemistry?": "O",
    "How many continents are there on Earth?": "7",
    "what is the national animal of pakistan?": "markhor",
    "who is the prime minister of pakistan?": "Mr. Anwaar-ul-Haq Kakar",
    "what is the national game of pakistan?": "Field Hockey",
    "how many countries are in the world?": "195 countries",
    "Which is the only body part that is fully grown from birth?": "the eyeball",
    "What is the smallest city in Pakistan?": "Jhelum",
    "50 times of 8 is equal to": "400",
    "The Angel who delivered messages to Prophet Muhammad (PBUH) from Allah was?": "Jibrael",
    "how many mountains are in the world?": "1,187,049",
    "who is the first prime minister of pakistan?": "Liaquat Ali Khan",
    "who created the first app in the world?": "Steve Jobs",
    "what is the population of karachi?": "17,236,000",
    "what is our national flower?": "Jasmine",
    "What is the oldest name of Karachi ?": "Kolachii",
  };

  List<int> randList = [];

  int totalQuestions = 0;
  int correctAnswers = 0;

  Quiz() {
    totalQuestions = questions.length;
    randList = generateRandomQuestions(totalQuestions, 22);
  }

  List<int> generateRandomQuestions(int maxIndex, int numQuestions) {
    List<int> randomIndices = [];
    while (randomIndices.length < numQuestions) {
      int index = Random().nextInt(maxIndex);
      if (!randomIndices.contains(index)) {
        randomIndices.add(index);
      }
    }
    return randomIndices;
  }

  void start() {
    print("Welcome to the Quiz!");
    for (var index in randList) {
      var question = questions.keys.elementAt(index);
      var correctAnswer = questions[question]; // Fixed this line
      askQuestion(question, correctAnswer!); // Added the '!' to assert non-null
    }
    displayResult();
  }

  void askQuestion(String question, String correctAnswer) {
    print(question);
    String? userAnswer = stdin.readLineSync();
    if (userAnswer != null && userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
      print("Correct!");
      correctAnswers++;
    } else {
      print("Incorrect. The correct answer is: $correctAnswer");
    }
  }

  void displayResult() {
    double percentage = (correctAnswers / randList.length) * 100;
    print("You got $correctAnswers out of ${randList.length} questions correct.");
    print("Your score: $percentage%");
    if (percentage > 50) {
      print("Congratulations!");
    }
    askToRestart();
  }

  void askToRestart() {
    print("Do you want to restart the quiz? (yes/no)");
    String? restart = stdin.readLineSync();
    if (restart != null && restart.toLowerCase() == "yes") {
      correctAnswers = 0;
      randList = generateRandomQuestions(totalQuestions, 22);
      start();
    } else {
      print("Thank you for playing!");
    }
  }
}
