//
//  MCQuestionView.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 7/3/23.
//

import SwiftUI

struct MCQuestionView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack{
            HStack{
                QuestionButton(title: "a", answerNumber: 0, answerPressedCallback: questionButtonPressed)
                QuestionButton(title: "b", answerNumber: 1, answerPressedCallback: questionButtonPressed)
            }
            HStack{
                QuestionButton(title: "c", answerNumber: 2, answerPressedCallback: questionButtonPressed)
                QuestionButton(title: "d", answerNumber: 3, answerPressedCallback: questionButtonPressed)
            }
        }
    }
    
    func questionButtonPressed(answerNumber: Int){
        
    }
}

struct IncorrectAnswerView: View {
    @EnvironmentObject var setManager: SetManager
    
    var body: some View {
        VStack {
            VStack{
                Spacer()
                Text("Incorrect")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                Spacer()
                Button("Next Problem") {
                    setManager.advanceQuestion()
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
    }
}

//struct MCQuestionView_Previews: PreviewProvider {
//    static var previews: some View {
////        MCQuestionView()
//    }
//}
