//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by MacBook Air on 08.05.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
	let text: String
	
	//Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
	let answers: [String]
	//Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
	let rightAnswer: String
	
	//The initialiser needs to be updated to match the new multiple choice quiz data.
	init(q: String, a: [String], correctAnswer: String) {
		text = q
		answers = a
		rightAnswer = correctAnswer
	}
}
