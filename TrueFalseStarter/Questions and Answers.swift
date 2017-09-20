//
//  Questions and Answers.swift
//  TrueFalseStarter
//
//  Created by Nolan Fuchs on 9/19/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


import GameKit

struct Trivia {
    let trivia: [[String : String]] = [ // Trivia Questions
        ["Question": "Who is the founder of SpaceX?", "Answer": "Elon Musk"],
        ["Question": "When was the first iPhone released?", "Answer": "2007"],
        ["Question": "When was the Swift programming language released?", "Answer": "2014"],
        ["Question": "Which is the most visited country in the world?", "Answer": "France"],
        ["Question": "How many World Cup trophies does Germany have?", "Answer": "4"],
        ["Question": "Which is NOT a German type of car?", "Answer": "Lamborghini"],
        ["Question": "What year was the first laptop made?", "Answer": "1981"],
        ["Question": "Who was the first programmer?", "Answer": "Ada Lovelace"],
        ["Question": "How many people live on Earth?", "Answer": "7.5 Billion"],
        ["Question": "Who invented the first cellphone?", "Answer": "Martin Cooper"]
    ]
    
    // Making sure their are no repeating questions
    var lastRandomNumber = -1
    mutating func randomFact() -> [String: String] {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        
        if randomNumber == lastRandomNumber {
            return randomFact()
        } else {
            lastRandomNumber = randomNumber
            return trivia[randomNumber]
        }
    }
    
}






















