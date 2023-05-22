//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var choice1: UIButton!
	@IBOutlet weak var choice2: UIButton!
	@IBOutlet weak var choice3: UIButton!
	@IBOutlet weak var progressBar: UIProgressView!
	
	var quizBrain = QuizBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		updateUI()
	}
	@IBAction func aswerButtonPressed(_ sender: UIButton) {
			
		let userAnswer = sender.currentTitle!
		let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
		
		if userGotItRight {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
			
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
	}
	
	@objc func updateUI() {
		questionLabel.text = quizBrain.getQuestionText()
		
		//Need to fetch the answers and update the button titles using the setTitle method.
		let answerChoices = quizBrain.getAnswers()
		choice1.setTitle(answerChoices[0], for: .normal)
		choice2.setTitle(answerChoices[1], for: .normal)
		choice3.setTitle(answerChoices[2], for: .normal)
		
		progressBar.progress = quizBrain.getProgress()
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		
		choice1.backgroundColor = UIColor.clear
		choice2.backgroundColor = UIColor.clear
		choice3.backgroundColor = UIColor.clear
		
	}

}
