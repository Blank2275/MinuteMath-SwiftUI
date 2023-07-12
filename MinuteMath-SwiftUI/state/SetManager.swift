//
//  SetManager.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 7/3/23.
//

import Foundation

enum QuestionType {
    case None, MC
}

enum QuestionState {
    case Answering, Answered
}

class SetManager: ObservableObject{
    @Published var currentQuestion: QuestionData?
    @Published var currentQuestionType: QuestionType = .None
    @Published var currentQuestionText: String = ""
    @Published var currentQuestionState: QuestionState = .Answering
    @Published var answerWasCorrect: Bool = false
    
    var numQuestions: Int
    var currentQuestionNumber: Int = 0
    var currentAnswerPicked: Int = 0
    
    var mcQuestions: [QuestionData] = []
    
    init(numQuestions: Int){
        self.numQuestions = numQuestions
    }
    
    
    func setQuestion(){
        self.currentQuestion = self.pickQuestion()
        if self.currentQuestionType == .MC {
            self.currentQuestionText = self.currentQuestion?.mcQuestionData?.question ?? ""
        }
    }
    
    func pickQuestion() -> QuestionData? {
        let numQuestions = self.mcQuestions.count
        if numQuestions > 0 {
            let index = Int.random(in: 0..<numQuestions)
            self.currentQuestionType = .MC
            return self.mcQuestions[index]
        }
        return nil
    }
    
    func isAnswerCorrect() -> Bool {
        var correctAnswerNumber = 0
        
        //this data is accessed differently depending on the type of problem
        if self.currentQuestionType == .MC {
            correctAnswerNumber = self.currentQuestion?.mcQuestionData?.answer ?? -1
        }
        
        if correctAnswerNumber == self.currentAnswerPicked {
            return true
        }
        
        return false
    }
    
    func advanceQuestion(){
        self.currentQuestionNumber += 1
        self.setQuestion()
        self.currentQuestionState = .Answering
    }
    
    func answerWasPressed(answer: Int){
        self.currentAnswerPicked = answer
        
        self.currentQuestionState = .Answered
        
        self.answerWasCorrect = self.isAnswerCorrect()
        
        if self.answerWasCorrect {
            
            self.handleCorrectAnswer()
        }
    }
        //load next problem and update number of completed questions
    
    func handleCorrectAnswer() {
        self.advanceQuestion()
        //will do other stuff
    }
        
    func fetch(baseUrlString: String, setName: String){
        let mcString = baseUrlString + "/\(setName)/data/MC"
        guard let url = URL(string: mcString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error fetching MC Questions at \(mcString) : \(error)")
            }
            if let data = data {
                guard let MCQuestions = try? JSONDecoder().decode([MCQuestionData].self, from: data) else {return}
                for question in MCQuestions {
                    self.mcQuestions.append(QuestionData(mcQuestion: question))
                }
                DispatchQueue.main.sync {
                    self.doneFetchingData()
                }
            }
        }
        
        task.resume()
    }
    
    func doneFetchingData(){
        self.setQuestion()
    }
}

class QuestionData: ObservableObject {
    @Published var mcQuestionData: MCQuestionData?
    init(mcQuestion: MCQuestionData){
        mcQuestionData = mcQuestion
    }
}

struct MCQuestionData: Codable {
    var question: String
    var potentialAnswers: [String]
    var answer: Int
    var id: String
    var hintID: Int
}

