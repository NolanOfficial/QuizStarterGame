//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var triviaQuestions = Trivia()
    var gameSound: SystemSoundID = 0
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    @IBOutlet weak var answerType: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        var setOfQuestions = triviaQuestions.randomFact()
        questionField.text = setOfQuestions["Question"]
        optionOne.setTitle(setOfQuestions["Option1"], for: .normal)
        optionTwo.setTitle(setOfQuestions["Option2"], for: .normal)
        optionThree.setTitle(setOfQuestions["Option3"], for: .normal)
        optionFour.setTitle(setOfQuestions["Option4"], for: .normal)
        playAgainButton.isHidden = true
        answerType.isHidden = true
        
        
    }
    

    
    func displayScore() {
        // Hide the answer buttons
        optionOne.isHidden = true
        optionTwo.isHidden = true
        optionThree.isHidden = true
        optionFour.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        playAgainButton.setTitle("Play Again?", for: .normal)
        
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        playAgainButton.isHidden = false
        answerType.isHidden = false
        
        
        let correctAnswer = triviaQuestions.randomFact()["Option1"]
        
        if (sender === optionOne &&  correctAnswer == triviaQuestions.randomFact()["Option 1"]) || (sender === optionTwo && correctAnswer == "Option2") {
            correctQuestions += 1
            answerType.text = "Correct!"
            playAgainButton.isHidden = false
            answerType.isHidden = false
            nextRound()
            
        } else {
            answerType.text = "Sorry, that's not it."
            playAgainButton.isHidden = false
            answerType.isHidden = false
            nextRound()
            
        }
        
        
        

    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            
        } else {
            // Continue game
            displayQuestion()
            
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        optionOne.isHidden = false
        optionTwo.isHidden = false
        optionThree.isHidden = false
        optionFour.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

