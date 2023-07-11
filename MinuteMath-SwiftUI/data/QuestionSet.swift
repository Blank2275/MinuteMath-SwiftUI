//
//  QuestionSet.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 7/1/23.
//

import Foundation
//
//class QuestionSet{
//    var mcQuestions: [QuestionData] = []
//    
//    func fetch(baseUrlString: String, setName: String){
//        let mcString = baseUrlString + "/\(setName)/data/MC"
//        guard let url = URL(string: mcString) else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error{
//                print("Error fetching MC Questions at \(mcString) : \(error)")
//            }
//            if let data = data {
//                guard let MCQuestions = try? JSONDecoder().decode([MCQuestionData].self, from: data) else {return}
//                for question in MCQuestions {
//                    self.mcQuestions.append(QuestionData(mcQuestion: question))
//                }
//            }
//        }
//        
//        task.resume()
//    }
//}

