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
        if player1.name == player2.name || player2.name == player1.name { print ("ce nom est déja existant"); return }
            
            menu(numeroEquipe: 2)
        
        
    }
    
    startBattle(perso1:Character , perso2:Character)
    
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
    
    enum CharactENUM {
        case warrior
        case colos
        case magus
        case dwarf
    }
    
    
    
    
    
    // fonction pour laisser le choix aux joueurs de selectionner leurs persos
    private func selectionPersonage (numeroEquipe:Int) {
        //tableaux qui contient les personnages choisis
        var perso = [Character]()
        // limiter la selection des perso à 3
        while perso.count < 3 {
            
            print("Selectionne les personnages pour constituer ton équipe",
                  "\n1 Warrior is the champion he have 300 lifepoints ",
                  "\n2 Colosus is the titan he have 556 lifepoints" ,
                  "\n3 Dwarf is the rock he have 436 lifepoints ",
                  "\n4 Magus is the magicien he have 400 lifepoints")
            
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
    
    func soins (characters:[Character]) -> Character
    {
        print ("\(characters.description)")
        
        for i in  0 ..< characters.count {
            print(i+1)
        }
      
        if let choice = readLine(){
            let selection = Int(choice) ?? 1
            if (selection > 0 && selection <= characters.count) {
                return characters[selection - 1]
            }
                    }
        
        return Character(name: String(), lifePoints: Int())
    }
    
    
    
    
    
    // tabelaux contenant les infos joueur
    private var persoPlayer1 = [Character]()
    private var persoPlayer2 = [Character]()


    // joueurs avec leurs caractériques qui est le le nom
    private var player1 = Player (name: String())
    private var player2 = Player (name: String())

    // fonction qui lance la battle
    func startBattle(perso1:Character, perso2:Character) {
        var tours = 0
        // commencer par definir le personnage qui attaque et le faire attaquer tant que sa vie n'est pas 0
        while persoPlayer1.count > 0, persoPlayer2.count > 0,perso2.lifePoints > 0 , perso1.lifePoints > 0 {
            tours += 1
    
            print("Début du Fight !")
            print(perso1.lifePoints)
            print(perso2.lifePoints)
            var tours = 0
            // lancer le fight
                tours += 1
                if tours == 0 {
                    
                    print ( "\(perso1.name) Veuillez Choisir un personnage de votre équipe pour attaquer")
                        let fighter1 = persoSelection(characters: persoPlayer1)
                            print("Choisir son arme")
                            fighter1.strenght = weaponSelection().damages
                            print("Veuillez choisir le personnage que vous voulez attaquer dans l'équipe adverse")
                            var persoAttacked2 = persoSelection(characters:persoPlayer2)

                            
                            var strenght1 = 0;
                            let number = Int.random(in: 1...10)
                            if (number < 4) {
                                strenght1 = Int.random(in: perso2.strenght-20...perso2.strenght+100)
                                print("\(perso1.name) trouve un coffre avec une arme de \(strenght1) de dégats")
                            } else {
                                strenght1 = perso1.strenght
                            }
                            print("\(perso1.name) attaque \(perso2.name)")
                                perso2.lifePoints -= strenght1
                            print("\(perso1.name) inflige \(strenght1) dégats à \(perso2.name)")
                            print(" Score: \(perso2.lifePoints)LifePoints à \(perso2.name)",
                                        "\n \(perso1.lifePoints) à \(perso1.name)")
                    
                    
                    
                    print ( "\(perso2.name) Veuillez Choisir un personnage de votre équipe pour attaquer")
                        let fighter2 = persoSelection(characters: persoPlayer2)
                            print("Choisir son arme")
                            fighter2.strenght = weaponSelection().damages
                            print("Veuillez choisir le personnage que vous voulez attaquer dans l'équipe adverse")
                            var persoAttacked1 = persoSelection(characters:persoPlayer1)

                    // personnaliser une attaque qui varie en fonction de l'apparition du coffre
                    var strenght2 = 0;
                    // choisir un chiffre au hasar entre 1 et 10
                    let number2 = Int.random(in: 1...10)
                    // si 1 ou 2 ou 3
                    if (number < 4) {
                        // on fait varié la force du personnage
                        strenght2 = Int.random(in: perso1.strenght-20...perso1.strenght+100)
                        // on informe le joueur qu'il a trouvé un coffre avec une arme qui augmente la force de son personnage
                        print("\(perso2.name) trouve un coffre avec une arme de \(strenght2) de dégats")
                    } else {
                        // sinon l'attaque correspond à la force initiale du personnage
                        strenght2 = perso2.strenght
                    }
                    // on informe le joueur de l'attaque de son personnage
                    print("\(perso2.name) attaque \(perso1.name)")
                    // on baisse la vie du personnage 1 en fonction de la force du personnage 2 ; info stocké dans la variable strenght2
                    perso2.lifePoints -= strenght2
                    // on informe le joueur des dégats infligés
                    print("\(perso2.name) inflige \(strenght2) dégats à \(perso1.name)")
                    
                    }
                
                    
                else { print ("\(player1.name) veuillez choisir entre Attaque ou Soins",
                              "\n1 Attaque",
                                "\n1 Soins")
                if let choice = readLine(){
                    if choice == "1" {
                        print ("\(player1.name) Vous avez choisi d'attaquer.",
                                            "\n Veuillez Choisir un personnage de votre équipe")
                    let fighter1 = persoSelection(characters: persoPlayer1)
                        print("Choisir son arme")
                        fighter1.strenght = weaponSelection().damages
                        print("Veuillez choisir le personnage que vous voulez attaquer dans l'équipe adverse")
                        var persoAttacked = persoSelection(characters:persoPlayer2)

                        
                        var strenght1 = 0;
                        let number = Int.random(in: 1...10)
                        if (number < 4) {
                            strenght1 = Int.random(in: perso2.strenght-20...perso2.strenght+100)
                            print("\(perso1.name) trouve un coffre avec une arme de \(strenght1) de dégats")
                        } else {
                            strenght1 = perso2.strenght
                        }
                        print("\(perso1.name) attaque \(perso2.name)")
                            perso2.lifePoints -= strenght1
                        print("\(perso1.name) inflige \(strenght1) dégats à \(perso2.name)")
                        print(" Score: \(perso2.lifePoints)LifePoints à \(perso2.name)",
                                    "\n \(perso1.lifePoints) à \(perso1.name)") }
                    if choice == "2" {
                        print("Vous avez choisi les soins",
                        "\n Veuillez choisir le personnage que vous voulez soigner")
                        let persoSoigné = soins(characters: persoPlayer1)
                        persoSoigné.strenght += 100
                        print(" \(perso1.name) a recupéré 100 LifePoints ",
                            "Vie de\(perso1.name):\(perso1.strenght)LifePoints")
                    }
                    
                    
                    print ("\(player2.name) veuillez choisir entre Attaque ou Soins",
                                    "\n1 Attaque",
                                    "\n1 Soins")
                        if let choice = readLine(){
                            if choice == "1" {
                                print ("\(player2.name) Vous avez choisi d'attaquer.",
                                                    "\n Veuillez Choisir un personnage de votre équipe")
                            let fighter2 = persoSelection(characters: persoPlayer2)
                                print("Choisir son arme")
                                fighter2.strenght = weaponSelection().damages
                                print("Veuillez choisir le personnage que vous voulez attaquer dans l'équipe adverse")
                                var persoAttacked = persoSelection(characters:persoPlayer2)

                                
                                var strenght2 = 0;
                                let number = Int.random(in: 1...10)
                                if (number < 4) {
                                    strenght2 = Int.random(in: perso2.strenght-20...perso2.strenght+100)
                                    print("\(perso2.name) trouve un coffre avec une arme de \(strenght2) de dégats")
                                } else {
                                    strenght2 = perso2.strenght
                                }
                                print("\(perso2.name) attaque \(perso1.name)")
                                    perso1.lifePoints -= strenght2
                                print("\(perso2.name) inflige \(strenght2) dégats à \(perso1.name)")
                                print(" Score: \(perso1.lifePoints)LifePoints à \(perso1.name)",
                                            "\n \(perso2.lifePoints) à \(perso2.name)")
                            }
                            if choice == "2" {
                                print("Vous avez choisi les soins",
                                "\n Veuillez choisir le personnage que vous voulez soigner")
                                let persoSoigné = soins(characters: persoPlayer1)
                                persoSoigné.strenght += 100
                                print(" \(perso2.name) a recupéré 100 LifePoints ",
                                    "Vie de\(perso2.name):\(perso2.strenght)LifePoints")
                            }
                            
                        }
                    
        // si la vie du perso1 est inférieur à ou egale à 0 informé le joueur que son perso est mort
        if(perso1.lifePoints <= 0) {
             
            persoPlayer1.remove(at: perso1.lifePoints)
            print("\(perso1.name) est mort")
            // on retourne le resultat qui indentifie le perdant
            
        }
        else if(perso2.lifePoints<=0) {
            persoPlayer2.remove(at: perso2.lifePoints)
        }
        print("\(perso2.name) est mort")

                }

               
                    
        print("fin de la partie")
        if (persoPlayer1.count > 0) {
            print("le Joueur 1 à gagné")
        } else {
            print("le Joueur 2 à gagné")
        }
        print ("Félicitations vous avez effectué \(tours)tours afin de remporter la victoire")
                    
                            




                }


    }

    }
}
