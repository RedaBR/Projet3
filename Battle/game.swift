//
//  classGame.swift
//  Battle
//
//  Created by Reda on 19/05/2021.
//

import Foundation

var perso = [Character]()
var charactPlayer1 = [Character]()
var charactPlayer2 = [Character]()

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
        
       
        // limiter la selection des perso à 3
        while perso.count < 3 {
            
            print("Selectionne jusqu'a 3 personnages pour constituer ton équipe",
              "\n1 Warrior",
              "\n2 Colosus",
              "\n3 Dwarf",
              "\n4 Magus")
            
            // choix du joueur
            if let selection = readLine(){
                switch selection  {
                    case "1" :
                        perso.append(newCharacter(characterType: .warrior))
                    case "2" :
                        perso.append(newCharacter(characterType: .colos))
                    case "3" :
                        perso.append(newCharacter(characterType: .dwarf))
                    case "4" :
                        perso.append(newCharacter(characterType: .magus))
                        
                    default : ("")
                }
            }
        }
        
        // on identifie le joueur
        if (numeroEquipe == 1) {
        // on  rajoute le contenu du tableaux des perso choisi au joueur identifé
            persoPlayer1.append(contentsOf: perso)
        } else if (numeroEquipe == 2) {
            persoPlayer2.append(contentsOf: perso)
        }
        // on informe le joueur que l'equipe est consitué 
        print("Votre équipe est constituée")
        
    }
    
    
  
}


enum CharactENUM {
    case warrior
    case colos
    case magus
    case dwarf
}


func newCharacter (characterType : CharactENUM)->Character  {
    print ("Choisi le nom de ton perso ")

    if let charaterNamed = readLine(){

        switch characterType {
        
        case .warrior :
           return Warrior(name: charaterNamed)
        case .colos :
            return Colosus(name:charaterNamed)
        case .magus :
            return Magus(name: charaterNamed)
        case .dwarf :
            return Dwarf(name: charaterNamed)
        }
    }
    return Character(name: "", lifePoints: 0, strenght: 0)
}

// tabelaux contenant les infos joueur
private var persoPlayer1 = [Character]()
private var persoPlayer2 = [Character]()


// joueurs avec leurs caractériques qui est le le nom
private var player1 = Player (name: String())
private var player2 = Player (name: String())


func startBattle () {
    
    print ("\(player1.name) choisis le personnage qui attaque ",
           "\n  \(persoPlayer1.description)",
           "\n1",
           "\n2",
           "\n3")
    
    if let choice = readLine(){
        switch choice {
        
        case "1":  charactPlayer1.insert(persoPlayer1[0], at: 0)
        case "2":  charactPlayer1.insert(persoPlayer1[1], at: 0)
        case "3": charactPlayer1.insert(persoPlayer1[2], at: 0)
        default:
            print("erreur")
        }
}

    print ("\(player2.name) choisis le personnage qui attaque ",
           "\n  \(persoPlayer2.description)",
           "\n1",
           "\n2",
           "\n3")
    
    if let choice = readLine(){
        switch choice {
        case "1":  charactPlayer2.insert(persoPlayer2[0], at: 0)
        case "2":  charactPlayer2.insert(persoPlayer2[1], at: 0)
        case "3": charactPlayer2.insert(persoPlayer2[2], at: 0)
        default:
            print("erreur")
        }
}
}

