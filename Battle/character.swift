//
//  classCharacter.swift
//  Battle
//
//  Created by Reda on 19/05/2021.
//

import Foundation
// un modele personnages avec les propriétés des personnages 
class Character {
    
    var name : String
    var lifePoints : Int
    var strenght : Int
    
    init ( name : String , lifePoints : Int , strenght : Int ) {
        
        self.name = name
        self.lifePoints = lifePoints
        self.strenght = strenght
    }
}
