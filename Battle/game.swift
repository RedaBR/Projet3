//
//  classGame.swift
//  Battle
//
//  Created by Reda on 19/05/2021.
//

import Foundation

class Game {
    //fonction qui lance le jeu , identifie et nomme les joueurs
    func startGame(){
        print ("\n. Bienvenue dans Battle ",
               "\n",
            "\n. 1er joueur Quel est votre nom ? ")
        if let firstPlayerName = readLine() {
            print("Bonjour \(firstPlayerName)")
            player1.name = firstPlayerName
        }
        
        menu(numeroEquipe: 1)
        
        print ("2eme jouer quel est votre nom ?")
        if let firstPlayersName2 = readLine() {
            print ("Bonjour \(firstPlayersName2)")
            player2.name = firstPlayersName2
        }
        
        menu(numeroEquipe: 2)
        
        
        
    }
    // fonction du menu
    func menu (numeroEquipe:Int) {
           
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
    // fonction pour laisser le choix à l'utilisateur de selectionner ses persos
    func selectionPersonage (numeroEquipe:Int) {
        
        var perso = [Character]()
        // limiter la selection des perso à 3
        while perso.count < 3 {
            
            print("Selectionner jusqua 3 personnages pour constituer ton équipe",
              "\n1 Warrior",
              "\n2 Colosus",
              "\n3 Dwarf",
              "\n4 Magus")
            
            // choix du joueur
            if let selection = readLine(){
        
                
                switch selection {
                    case "1" : print("Warrior",
                                    "\n choisis le nom de ton Warrior")
                        if let characterNamed = readLine(){
                            // on rajoute le nom choisi au personnage
                            let warrior = Warrior(name: characterNamed)
                            //on rajoute le personnage au tableau des persos
                            perso.append(warrior)
                            // on informe le joueur de son choix
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
        // on identifie le joueur
        if (numeroEquipe == 1) {
        // on le contenu du tableaux des perso choisi au joueur identifé
            persoPlayer1.append(contentsOf: perso)
        } else if (numeroEquipe == 2) {
            persoPlayer2.append(contentsOf: perso)
        }
        // on informe le joueur que l'equipe est consitué 
        print("Votre équipe est constituée")
    }
    
    
  
}
