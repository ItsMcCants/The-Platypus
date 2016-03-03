//
//  Challenges.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class Challenges: NSObject {
    var image : UIImage
    var name  : String
    var challengeInfo : String
    var badge : UIImage
    var background : UIImage
    var gameData : [String: UIImage?]
    var gameOrder: [String]
    var sound: String
    var number: Int
    
    init(image:UIImage?, name:String?, challengeInfo:String?, badge:UIImage?, background: UIImage?, gameData: [String: UIImage?], gameOrder: [String], sound: String?, number: Int){
       
        self.name = name!
        self.image = image!
        self.challengeInfo = challengeInfo!
        self.badge = badge!
        self.background = background!
        self.gameData = gameData
        self.gameOrder = gameOrder
        self.sound = sound!
        self.number = number
        
    }
    
    class func giveAllChallenges() -> [Challenges] {
        let brewDict = ["Modelo" : UIImage(named: "Modelo"), "Pabst" : UIImage(named: "Pabst"), "Shock Top" : UIImage(named: "Shock Top"), "Keystone" : UIImage(named: "Keystone"), "Becks" : UIImage(named: "Becks"), "Sapporo": UIImage(named: "Sapporo"), "Fat Tire" : UIImage(named: "Fat Tire"), "Stella Artois" : UIImage(named: "Stella Artois"), "New Castle" : UIImage(named: "New Castle"), "Fosters" : UIImage(named: "Fosters"), "Lagunitas" : UIImage(named: "Lagunitas"), "Sierra Nevada" : UIImage(named: "Sierra Nevada"), "Heineken" : UIImage(named: "Heineken")]
        let brewOrder = ["Modelo", "Pabst", "Shock Top", "Keystone", "Becks", "Sapporo", "Fat Tire", "Stella Artois", "New Castle", "Fosters", "Lagunitas", "Sierra Nevada", "Heineken"]
        let brewChallenge = Challenges(image: UIImage(named: "1.jpg"), name: "Brew", challengeInfo: "Brew challenge", badge: UIImage(named: "logo"), background: UIImage(named: "barbackground"), gameData: brewDict, gameOrder: brewOrder, sound: "Brew", number: 0)
        
        let pokemonDict = ["Charmander" : UIImage(named: "Charmander"), "Squirtle" : UIImage(named: "Squirtle")]
        let pokemonOrder = ["Charmander", "Squirtle", "Venasaur", "Scyther", "Arbok", "Articuno", "Eevee", "Raichu", "Hitmonchan", "Jolteon", "Hitmonlee", "Pidgeot", "Dratini", "Blastoise", "Dragonite", "Meowth", "Snorlax", "Beedrill", "Dratini", "Charizard"]
        let pokemonChallenge = Challenges(image: UIImage(named: "pokeball"), name: "Pokemon", challengeInfo: "Pokemon Challenge", badge: UIImage(named: "pokeball"), background: UIImage(named: "background2"), gameData: pokemonDict, gameOrder: pokemonOrder, sound: "Pokemon", number: 1)
   
        let gitDict = ["Desktop" : UIImage(named: "Desktop"), "Project Name" : UIImage(named:"Project Name"), "git init" : UIImage(named: "git init"),"git add ." : UIImage(named: "git add ."), "commit -m" : UIImage(named: "commit -m"), "first commit" : UIImage(named: "first commit"),"remote" : UIImage(named: "remote"), "add origin" : UIImage(named: "add origin"), "github link" : UIImage(named: "github link"),"push -u" : UIImage(named: "push -u"), "origin master" : UIImage(named: "origin master"), "Allow" : UIImage(named: "Allow"), "Last": UIImage(named: "Last")]
        let gitOrder = ["Desktop", "Project Name", "git init", "git add .", "commit -m", "first commit", "remote", "add origin", "github link", "push -u", "origin master", "Allow", "Last"]
        
        let gitChallenge = Challenges(image: UIImage(named: "Octocat"), name: "Github", challengeInfo: "Learn Github", badge: UIImage(named: "Octocat"), background: UIImage(named: "gitback"), gameData: gitDict, gameOrder: gitOrder, sound: "Git", number: 2)
        
        let yogaDict = ["Big Toe Pose" : UIImage(named: "Big Toe Pose"), "Boat Pose" : UIImage(named: "Boat Pose"), "Bow Pose" : UIImage(named: "Bow Pose"), "Cat Pose" : UIImage(named: "Cat Pose"), "Cobra Pose" : UIImage(named: "Cobra Pose"), "Monkey Pose" : UIImage(named: "Monkey Pose"), "Firefly Pose" : UIImage(named: "Firefly Pose"), "Eagle Pose" : UIImage(named: "Eagle Pose"), "Dolphin Pose" : UIImage(named: "Dolphin Pose"), "Cow Pose" : UIImage(named: "Cow Pose"), "Camel Pose" : UIImage(named: "Camel Pose")]
        let yogaOrder = ["Big Toe Pose", "Boat Pose", "Bow Pose", "Cat Pose", "Cobra Pose", "Monkey Pose", "Firefly Pose", "Eagle Pose", "Dolphin Pose", "Cow Pose", "Camel Pose"]
        
        let yogaChallenge = Challenges(image: UIImage(named: "yoga"), name: "Yoga", challengeInfo: "Yoga Challenge", badge: UIImage(named: "yoga"), background: UIImage(named: "yogaback"), gameData: yogaDict, gameOrder: yogaOrder, sound: "Yoga", number: 3)
        

        let gotDict = ["Drogo" : UIImage(named: "Drogo"), "Daenerys" : UIImage(named: "Daenerys"), "Arya" : UIImage(named: "Arya"), "Bran Stark" : UIImage(named: "Bran Stark"), "Cersei" : UIImage(named: "Cersei"), "Joffrey" : UIImage(named: "Joffrey"), "Jon Snow" : UIImage(named: "Jon Snow"), "Margaery" : UIImage(named: "Margaery"), "Sandor" : UIImage(named: "Sandor"), "Sansa" : UIImage(named: "Sansa"), "Tyrion" : UIImage(named: "Tyrion"), "Ygritte" : UIImage(named: "Ygritte")]
        
        let gotOrder = ["Drogo", "Daenerys", "Arya", "Bran Stark", "Cersei", "Joffrey", "Jon Snow", "Margaery", "Sandor", "Sansa", "Tyrion", "Ygritte"]
        
        let gotChallenge = Challenges(image: UIImage(named: "gamebadge"), name: "Game of Thrones", challengeInfo: "Learn all the Game of Thrones Main Characters", badge: UIImage(named: "gamebadge"), background: UIImage(named: "ah"), gameData: gotDict, gameOrder: gotOrder, sound: "GOT", number: 4)
        
    
        
        return [brewChallenge, pokemonChallenge, gitChallenge, yogaChallenge, gotChallenge]
        
    }
}

