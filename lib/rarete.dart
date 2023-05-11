// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft_app_final/character.dart';


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


 

Color  color(Rarete rarete) {
  switch(rarete) {
    
    case Rarete.legendaire: {
      return Colors.deepPurpleAccent;
    }
    case Rarete.rare: {
      return Colors.lightGreen;
    }
    case Rarete.commun: {
      return Colors.lightBlue;
    }
   
  }
}

  
 getRarete(Rarete rarete) {
  switch (rarete) {
    case  Rarete.legendaire:
      {
        return "Légendaire";
      }
      
    case Rarete.rare:
       return "Rare";
      
    case Rarete.commun:
      return "Commun";
  }
}
  
   
  


