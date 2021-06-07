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
            "\n","\n. 1er joueur Quel est votre nom ? ")
        // on laisse le choix au joueur d'indiquer son nom
        if let firstPlayerName = readLine() {
            print("Bonjour \(firstPlayerName)")
        // on stocke le nom du joueur à la propriété qui correspond
            player1.name = firstPlayerName
        }
    
        menu(numeroEquipe: 1)
        
        print ("2eme jouer quel est votre nom ?")
        if let firstPlayersName2 = readLine() {
            print ("Bonjour \(firstPlayersName2)")
            player2.name = firstPlayersName2
        }
        
        menu(numeroEquipe: 2)
        
        startBattle()
        
    }
    // fonction du menu
    private func menu (numeroEquipe:Int) {
        print("Créer votre equipe","\n1. Nouvelle equipe ","\n2. retour ")
        
        if let choice = readLine() {
            
            if choice == "1" {
                selectionPersonage(numeroEquipe:numeroEquipe)
            }
            else if choice == "2" {
                startGame()
            }
        }
    }
    // fonction pour laisser le choix aux joueurs de selectionner leurs persos
    private func selectionPersonage (numeroEquipe:Int) {
        //tableaux qui contient les personnages choisis
        var perso = [Character]()
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
                default : break
                }
            }
        }
        
        // on identifie le joueur grace au paramétre de la fonction
        if (numeroEquipe == 1) {
            // on  rajoute le contenu du tableaux des perso choisi au joueur identifé
            persoPlayer1.append(contentsOf: perso)
        } else if (numeroEquipe == 2) {
            persoPlayer2.append(contentsOf: perso)
        }
        // on informe le joueur que l'equipe est consitué 
        print("Votre équipe est constituée")
        
    }
    
    // laisser la possibilité aux joueurs de personaliser le nom du personnage
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
        return Character(name: "", lifePoints: 0)
    }

    // tabelaux contenant les infos joueur
    private var persoPlayer1 = [Character]()
    private var persoPlayer2 = [Character]()


    // joueurs avec leurs caractériques qui est le le nom
    private var player1 = Player (name: String())
    private var player2 = Player (name: String())

    // fonction qui lance la battle
    private func startBattle () {
        // commencer par definir le personnage qui attaque et le faire attaquer tant que sa vie n'est pas 0
        while persoPlayer1.count > 0, persoPlayer2.count > 0 {
            print ("\(player1.name) choisis le personnage qui attaque")
            let fighter1 = persoSelection(characters: persoPlayer1)
            // force du personnage en fonction du choix de l'arme
            fighter1.strenght = weaponSelection().damages
            //choisir le personnage qui subit les degats dans l'equipe adverse
            print ("\(player1.name) choisis le personnage qui subit les degats")
            let fighter2 = persoSelection(characters: persoPlayer2)
            // la force du personnage en fonction de l'arme choisi
            fighter2.strenght = weaponSelection().damages
            // suppression de l'index qui correspond à la valeur retour du perdant
            let looserIndex = fight(perso1: fighter1, perso2: fighter2)
            if (looserIndex == 0) {
                persoPlayer1.enumerated().forEach { (index, character) in
                    if (character.name == fighter1.name) {
                        persoPlayer1.remove(at: index)
                    }
                }
            } else {
                persoPlayer2.enumerated().forEach { (index, character) in
                    if (character.name == fighter2.name) {
                        persoPlayer2.remove(at: index)
                    }
                }
            }
        }
        
        print("fin de la partie")
        if (persoPlayer1.count > 0) {
            print("le Joueur 1 à gagné")
        } else {
            print("le Joueur 2 à gagné")
        }
        
    }


    // fonction combat avec 2 parametres avec les propriétés des personnage
    func fight(perso1:Character, perso2:Character) -> Int {
        
        print("Début du Fight !")
        print(perso1.lifePoints)
        print(perso2.lifePoints)
        // lancer le fight
        while perso2.lifePoints > 0 , perso1.lifePoints > 0 {
            // personnaliser une attaque qui varie en fonction de l'apparition du coffre
            var attaque = 0;
            // choisir un chiffre au hasar entre 1 et 10
            let number = Int.random(in: 1...10)
            // si 1 ou 2 ou 3
            if (number < 4) {
                // on fait varié la force du personnage
                attaque = Int.random(in: perso1.strenght-20...perso1.strenght+100)
                // on informe le joueur qu'il a trouvé un coffre avec une arme qui augmente la force de son personnage
                print("\(perso1.name) trouve un coffre avec une arme de \(attaque) de dégats")
            } else {
                // sinon l'attaque correspond à la force initiale du personnage
                attaque = perso1.strenght
            }
            // on informe le joueur de l'attaque de son personnage
            print("\(perso1.name) attaque \(perso2.name)")
            // on baisse la vie du personnage 2 en fonction de la force du personnage 1 ; info stocké dans la variable attaque
            perso2.lifePoints -= attaque
            // on informe le joueur des dégats infligés
            print("\(perso1.name) inflige \(attaque) dégats à \(perso2.name)")
            print(" il reste \(perso2.lifePoints) à \(perso2.name)")
            if perso2.lifePoints > 0 {
                var attaque = 0;
                let number = Int.random(in: 1...10)
                if (number < 4) {
                    attaque = Int.random(in: perso2.strenght-20...perso2.strenght+100)
                    print("\(perso2.name) trouve un coffre avec une arme de \(attaque) de dégats")
                } else {
                    attaque = perso2.strenght
                }
                print("\(perso2.name) attaque \(perso1.name)")
                perso1.lifePoints -= attaque
                print("\(perso2.name) inflige \(attaque) dégats à \(perso1.name)")
                print(" il reste \(perso1.lifePoints) à \(perso1.name)")
            }
        }
        // si la vie du perso1 est inférieur à ou egale à 0 informé le joueur que son perso est mort
        if(perso1.lifePoints <= 0) {
            print("\(perso1.name) est mort")
            // on retourne le resultat qui indentifie le perdant
            return 0
        }
        
        print("\(perso2.name) est mort")
        return 1
        
    }
    // fonction qui stocke le choix du joueur
    func persoSelection(characters:[Character]) -> Character {
        
        print("\(characters.description)")
        
        for i in 0 ..< characters.count {
            print(i+1)
        }
        
        if let choice = readLine(){
            let selection = Int(choice) ?? 1
            if (selection > 0 && selection <= characters.count) {
                return characters[selection - 1]
            }
        }
        return Character(name:"", lifePoints: 0)
    }
    //laisser le choix au joueur de selectionner son arme et stocker l'information
    func weaponSelection() -> Weapon {
        
        print ("choisis son arme",
               "\n1 Axe",
               "\n2 Sword")
        var weapon = Weapon()
        if let choice = readLine() {
            if choice == "1" {
                weapon = Axe.init()
            }
            if choice == "2" {
                weapon = Sword.init()
                
            }
        }
        return weapon
    }


    
}


enum CharactENUM {
    case warrior
    case colos
    case magus
    case dwarf
}


