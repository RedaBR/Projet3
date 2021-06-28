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
        var erreur  = true
        print ("\n. Bienvenue dans Battle ",
               "\n","\n. 1er joueur Quel est votre nom ? ")
        while erreur {
            // on laisse le choix au joueur d'indiquer son nom
            if let firstPlayerName = readLine() {
                
                // on stocke le nom du joueur à la propriété qui correspond
                player1.name = firstPlayerName
                erreur  = false
                if firstPlayerName == ""  {
                    print ("erreur")
                    erreur = true
                    
                }
               
            }
        }
        print ("Salutation à toi cher(e) \(player1.name)")
        
        menu(numeroEquipe: 1)
        
        print ("2eme jouer quel est votre nom ?")
        
        var error = true
        while error {
            
            if let firstPlayersName2 = readLine() {
                if player1.name == firstPlayersName2 {
                    print ("ce nom est déja existant, veuillez saisir un autre nom");
                    error = false
                }
                else if player1.name != firstPlayersName2
                {
                    
                    player2.name = firstPlayersName2
                    error = false
                    
                }
                 if firstPlayersName2 == "" {
                    print ("erreur")
                    error = true
                    
                }
            }
            
        }
        print ("Salutations à toi cher  \(player2.name)")
        
        menu(numeroEquipe: 2)
        battle()
    }
    
    
    
    // fonction du menu
    private func menu (numeroEquipe:Int) {
        print("Créer votre equipe","\n1. Nouvelle equipe ","\n2. retour ")
        var choice = ""
        while choice == "" {
            if let text = readLine() {
                if ( text != "1" && text != "2" ) {
                    print ("Veuillez choisir entre les 2 propositions en tapant 1 ou 2 Merci ")
                }
                else {
                    choice = text
                }
            }
        }
        
        if choice == "1" {
            characterSelection(numeroEquipe:numeroEquipe)
        }
        else if choice == "2" {
            startGame()
            
        }
        
        
    }
    
    enum CharactENUM {
        case iron
        case eren
        case saruman
        case golem
    }
    
    
    
    
    
    // fonction pour laisser le choix aux joueurs de selectionner leurs persos
    private func characterSelection (numeroEquipe:Int) {
        //tableaux qui contient les personnages choisis
        var perso = [Character]()
        // limiter la selection des perso à 3
        while perso.count < 3 {
            
            print("Selectionne les personnages pour constituer ton équipe",
                  "\n1 Iron is the champion he have 300 lifepoints ",
                  "\n2 Eren is the titan he have 556 lifepoints" ,
                  "\n3 Golem is the rock he have 1000 lifepoints",
                  "\n4 Saruman is the magicien he have 400 lifepoints")
            
            var error = true
            while error {
                
                if let selection = readLine(){
                    switch selection  {
                    case "1" :
                        perso.append(newCharacter(characterType: .iron))
                        error = false
                    case "2" :
                        perso.append(newCharacter(characterType: .eren))
                        error = false
                    case "3" :
                        perso.append(newCharacter(characterType: .golem))
                        error = false
                    case "4" :
                        perso.append(newCharacter(characterType: .saruman))
                        error = false
                    default :
                        
                        print("erreur")
                    }
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
            
            case .iron :
                return Iron(name: charaterNamed)
            case .eren :
                return Eren(name:charaterNamed)
            case .saruman :
                return Saruman(name: charaterNamed)
            case .golem :
                return Golem(name: charaterNamed)
            }
        }
        return Character(name: "", lifePoints: 0)
    }
    
    
    // fonction qui stocke le choix du joueur
    func persoSelection(characters:[Character]) -> (Int, Character) {
        
        
        print("\(characters.description)")
        
        for i in 0 ..< characters.count {
            print(i+1)
        }
        var selection = -1
        while (selection == -1) {
            if let choice = readLine(){
                
                let integerChoice = Int(choice) ?? -1
                if (integerChoice != -1 && integerChoice > 0 && integerChoice <= characters.count)
                {
                    selection = integerChoice
                }
                else  {
                    print("erreur de saisie, veuillez reesayer")
                }
            }
            
        }
        
        return ( selection - 1, characters[selection - 1])
    }
    
    
    //laisser le choix au joueur de selectionner son arme et stocker l'information
    
    func weaponSelection() -> Weapon {
        print ("1 Axe",
               "\n2 Sword")
        var erreur = true
        var weapon = Weapon()
        while erreur {
            if let choice = readLine() {
                if choice == "1" {
                    weapon = Axe.init()
                    erreur = false
                }
                else if choice == "2" {
                    weapon = Sword.init()
                    erreur = false
                }
                else {
                    print("erreur")
                }
            }
        }
        
        return weapon
        
    }
    
    
    // tabelaux contenant les infos joueur
    private var persoPlayer1 = [Character]()
    private var persoPlayer2 = [Character]()
    
    
    // joueurs avec leurs caractériques qui est le le nom
    private var player1 = Player (name: String())
    private var player2 = Player (name: String())
    
    // fonction qui lance la battle
    func battle() {
        var tours = 0
        // commencer par definir le personnage qui attaque et le faire attaquer tant que sa vie n'est pas 0
        while persoPlayer1.count > 0, persoPlayer2.count > 0 {
            
            var fightPlayer:Player
            var defPlayer:Player
            var persoFightPlayer = [Character]()
            var persoDefPlayer = [Character]()
            
            if (tours % 2 == 0) {
                fightPlayer = player1
                persoFightPlayer = persoPlayer1
                defPlayer = player2
                persoDefPlayer = persoPlayer2
            } else {
                fightPlayer = player2
                persoFightPlayer = persoPlayer2
                defPlayer = player1
                persoDefPlayer = persoPlayer1
            }
            
            var attack = true;
            
            if (tours > 0) {
                print ("\(fightPlayer.name) veuillez choisir entre Attaque ou Soins",
                       "\n1 Attaque",
                       "\n2 Soins")
                var erreur = true
                
                while erreur {
                    if let text = readLine(){
                        if text == "1" {
                            print("\(fightPlayer.name) Vous avez choisi d'attaquer.")
                            attack = true
                            erreur = false
                        }else if text == "2" {
                            attack = false
                            erreur = false
                        }
                        else {
                            (text != "1" && text != "2")
                            print ("erreur")
                            erreur = true
                        }
                    }                }
                
            }
            
            
            if attack {
                print ("\(fightPlayer.name) Veuillez Choisir un personnage de votre équipe")
                let (selectedIndex, f1) = persoSelection(characters: persoFightPlayer)
                print("Choisir son arme")
                f1.strenght = weaponSelection().damages
                print("Veuillez choisir le personnage que vous voulez attaquer dans l'équipe adverse")
                let (selectedIndex2, f2) = persoSelection(characters:persoDefPlayer)
                
                fight(fighter1: f1, fighter2: f2)
                if (f2.lifePoints <= 0) {
                    print("\(f2.name) est mort")
                    if (tours % 2 == 0) {
                        persoPlayer2.remove(at: selectedIndex2)
                    } else {
                        persoPlayer1.remove(at: selectedIndex2)
                    }
                }
            }
            else {
                print("Vous avez choisi les soins",
                      "\n Veuillez choisir le personnage que vous voulez soigner")
                let (index, persoSoigné) = persoSelection(characters: persoFightPlayer)
                persoSoigné.lifePoints += 100
                print(" \(persoSoigné.name) a recupéré 100 LifePoints ",
                      "Vie de\(persoSoigné.name):\(persoSoigné.lifePoints)LifePoints")
            }
            
            tours += 1
        }
        
        print("fin de la partie")
        if (persoPlayer1.count > 0) {
            print("le Joueur 1 à gagné")
        } else {
            print("le Joueur 2 à gagné")
        }
        print ("Félicitations vous avez effectué \(tours)tours afin de remporter la victoire")
        
    }
    
    func fight(fighter1:Character, fighter2:Character) {
        var strenght1 = 0;
        let number = Int.random(in: 1...10)
        if (number < 4) {
            strenght1 = Int.random(in: fighter1.strenght-20...fighter1.strenght+100)
            print("\(fighter1.name) trouve un coffre avec une arme de \(strenght1) de dégats")
        } else {
            strenght1 = fighter1.strenght
        }
        print("\(fighter1.name) attaque \(fighter2.name)")
        fighter2.lifePoints -= strenght1
        print("\(fighter1.name) inflige \(strenght1) dégats à \(fighter2.name)")
        print(" Score: \(fighter1.name) à \(fighter1.lifePoints) points de vie",
              "\n\(fighter2.name) à \(fighter2.lifePoints) points de vie")
    }
}




