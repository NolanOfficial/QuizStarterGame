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
        ["Question": "Who is the founder of SpaceX?", "Option1": "Steve Jobs", "Option2": "Bill Gates", "Option3": "Elon Musk", "Option4": "Mark Zuckerburg"],
        ["Question": "When was the first iPhone released?", "Option1": "2007", "Option2": "2006", "Option3": "2005", "Option4": "2008"],
        ["Question": "When was the Swift programming language released?", "Option1": "2012", "Option2": "2013", "Option3": "2015", "Option4": "2014"],
        ["Question": "Which is the most visited country in the world?", "Option1": "France", "Option2": "United States", "Option3": "Spain", "Option4": "China"],
        ["Question": "How many World Cup trophies does Germany have?", "Option1": "1", "Option2": "3", "Option3": "2", "Option4": "4"],
        ["Question": "Which is NOT a German type of car?", "Option1": "Audi", "Option2": "Lamborghini", "Option3": "Mercedes", "Option4": "BMW"],
        ["Question": "What year was the first laptop made?", "Option1": "1980", "Option2": "1981", "Option3": "1982", "Option4": "1983"],
        ["Question": "Who was the first programmer?", "Option1": "Linus Torvalds", "Option2": "Donald Knuth", "Option3": "Ada Lovelace", "Option4": "Grace Hopper"],
        ["Question": "How many people live on Earth?", "Option1": "6.0 Billion", "Option2": "7.5 Billion", "Option3": "6.5 Billion", "Option4": "8.0 Billion"],
        ["Question": "Who invented the first cellphone?", "Option1": "Martin Cooper", "Option2": "Alexander Bell", "Option3": "Steve Wozniak", "Option4": "Thomas Edison"]
    ]
    
    // Generating a random fact
    
    var storeNumber = 0
    
    mutating func randomFact() -> [String: String] {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        
        if storeNumber == randomNumber {
            storeNumber = randomNumber
            return randomFact()
        } else {
            storeNumber = randomNumber
            return trivia[randomNumber]
        }
        }
    }

























