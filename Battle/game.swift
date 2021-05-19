//
//  classGame.swift
//  Battle
//
//  Created by Reda on 19/05/2021.
//

import Foundation

class Game {
    
func startGame(){
    print (" 1er joueur Quel est votre nom ? ")
    if let firstPlayerName = readLine() {
          print("Bonjour \(firstPlayerName)")
       player1.name = firstPlayerName
        }
    
    print ("2eme jouer quel est votre nom ?")
    if let firstPlayersName2 = readLine() {
        print ("Bonjour \(firstPlayersName2)")
        
        player2.name = firstPlayersName2
    }
    
}
    
    func créerVotreEquipe () {
        for _ in 1...1 {
            
            print(player1.name)
            
    print("Créer votre equipe",
    "\n1. Nouvelle equipe ",
    "\n2. retour ")
     
        if let choice = readLine() {
            if choice == "1" {
               selectionPersonage()
            }
            else if choice == "2" {
                startGame()
                créerVotreEquipe()
            }
        }
    }

        for _ in 1...1 {
            
            print(player2.name)
            
            print("Créer votre equipe",
            "\n1. Nouvelle equipe ",
            "\n2. retour ")
             
                if let choice = readLine() {
                    if choice == "1" {
                       selectionPersonage()
                    }
                    else if choice == "2" {
                        startGame()
                        créerVotreEquipe()
                    }
}
}
    }
}
