import 'dart:math';

class Rarete {
  void main() {
    Random random = new Random();
    int randomNumber = random.nextInt(10); // from 0 to 9 included
    print("Generated Random Number Between 0 to 9: $randomNumber");

    int randomNumber2 = random.nextInt(10) + 1; // from 1 to 10 included
    print("Generated Random Number Between 1 to 10: $randomNumber2");
  }
}

String rarete() {
  Random random = new Random();
  int randomNumber = random.nextInt(2); // from 0 to 2 included

  switch (randomNumber) {
    case 0:
      {
        return "Fréquent";
      }
      break;
    case 1:
      {
        return "Rare";
      }
      break;
    case 2:
      {
        return "très rare";
      }
    default:
      return "Fréquent";
      break;
  }
}
