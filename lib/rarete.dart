// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';


    // Random random = new Random();
    // int randomNumber = random.nextInt(10); // from 0 to 9 included
    // print("Generated Random Number Between 0 to 9: $randomNumber");

    // int randomNumber2 = random.nextInt(10) + 1; // from 1 to 10 included
    // print("Generated Random Number Between 1 to 10: $randomNumber2");

// enum Rarete { 
//    deepPurpleAccent, 
//    lightGreen, 
//    lightBlue, 
// }

int randomCharacter() {
  Random random = Random();
  int randomNumber = random.nextInt(2); // from 0 to 2 included
  return randomNumber;
}
 

Color  color() {
  switch(randomCharacter()) {
    
    case 0: {
      return Colors.deepPurpleAccent;
    }
    case 1: {
      return Colors.lightGreen;
    }
    case 2: {
      return Colors.lightBlue;
    }
    default: {
      return Colors.yellow;
    }
  }
}


String rarete() {
  randomCharacter();
   switch (randomCharacter()) {
    case 0 :
      {
        return "Légendaire";
      }
     
    case 1:
      {
        return "Rare";
      }
     
    case 2:
      {
        return "Commun";
      }
    default:
      return "Inconnu";
      
  }
  
}

