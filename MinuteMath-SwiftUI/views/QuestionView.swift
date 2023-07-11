import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var setManager: SetManager = SetManager(numQuestions: 5)
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer().frame(height:50)
                Text("Minute Math")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Spacer()
                Text(setManager.currentQuestionText)
                    .font(.system(size: 20))
                Spacer()
                VStack{
                    var _ = print(setManager.currentQuestionType)
                    if setManager.currentQuestionType == .MC{
                        MCQuestionView()
                    }
                }
            }
        }
        .onAppear(){
            setManager.fetch(baseUrlString: appState.apiUrl, setName: "AR-EA")
//            setManager.setFirstQuestion()//comment when not doing this file's preview
//            print(appState.setManager?.currentQuestionType)
        }
        .environmentObject(setManager)
    }
}

struct QuestionButton: View {
    @State var title: String
    @State var answerNumber: Int
    @EnvironmentObject var setManager: SetManager
    
    var answerPressedCallback: (Int) -> Void
    var body: some View {
        Button(action: {
            answerPressedCallback(answerNumber)
            setManager.answerWasPressed(answer: answerNumber)
        }){
            let potentialAnswers = setManager.currentQuestion?.mcQuestionData?.potentialAnswers ?? ["", "", "", ""]
            Text(potentialAnswers[answerNumber])
                .frame(maxWidth: .infinity, minHeight: 200)
        }
        .background(CustomColors.mainButtonRed, ignoresSafeAreaEdges: [])
            .border(.blue)
            .foregroundColor(.black)
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView()
//    }
//}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View{
        QuestionView().environmentObject(AppState())
    }
}

