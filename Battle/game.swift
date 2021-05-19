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
        
        créerVotreEquipe(numeroEquipe: 1)
        
        print ("2eme jouer quel est votre nom ?")
        if let firstPlayersName2 = readLine() {
            print ("Bonjour \(firstPlayersName2)")
            player2.name = firstPlayersName2
        }
        
        créerVotreEquipe(numeroEquipe: 2)
        
        
        
    }
    
    func créerVotreEquipe (numeroEquipe:Int) {
           
        print("Créer votre equipe","\n1. Nouvelle equipe ","\n2. retour ")
     
        if let choice = readLine() {
        
            if choice == "1" {
                selectionPersonage(numeroEquipe: numeroEquipe)
            }
            else if choice == "2" {
                startGame()
            }
        }
    }
    
    func selectionPersonage (numeroEquipe:Int) {
        
        var perso = [Character]()
        while perso.count < 3 {
            
            print("Selectionner jusqua 3 personnages pour constituer ton équipe",
              "\n1 Warrior",
              "\n2 Colosus",
              "\n3 Dwarf",
              "\n4 Magus")
            
            
            if let selection = readLine(){
        
                
                switch selection {
                    case "1" : print("Warrior",
                                    "\n choisis le nom de ton Warrior")
                        if let characterNamed = readLine(){
                            let warrior = Warrior(name: characterNamed)
                            perso.append(warrior)
                            print("\(characterNamed) is the Warrior")
                        }
                                
                    case "2" : print("Colosus",
                                    "\n choisis le nom de ton colosus")
                        if let characterNamed = readLine(){
                            let colosus = Colosus(name: characterNamed)
                            perso.append(colosus)
                            print("\(characterNamed) is the Colosus")
                        }
                    case "3" : print("dwarf",
                                     "\n choisis le nom de ton Dwarf")
                        if let characterNamed = readLine(){
                            let dwarf = Dwarf(name: characterNamed)
                            perso.append(dwarf)
                            print("\(characterNamed) is the Dwarf")
                        }
                        
                    case "4" : print("magus",
                                    "\n choisis le nom de magus")
                        if let characterNamed = readLine(){
                            let magus = Magus(name: characterNamed)
                            perso.append(magus)
                            print("\(characterNamed)is the Magus")
                        }
                        
                    default : ("")
                }
            }
        }
        
        if (numeroEquipe == 1) {
            persoPlayer1.append(contentsOf: perso)
        } else if (numeroEquipe == 2) {
            persoPlayer2.append(contentsOf: perso)
        }
        
        print("Votre équipe est constituée")
    }
    
    
  
}
