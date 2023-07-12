import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var setManager: SetManager = SetManager(numQuestions: 5)
    @State var showPopup: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer().frame(height:50)
                    Text("Minute Math")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Spacer()
                    if setManager.currentQuestionState == .Answering { // if you are currently answering a question, show options
                        Text(setManager.currentQuestionText)
                            .font(.system(size: 20))
                        Spacer()
                        VStack{
                            if setManager.currentQuestionType == .MC{
                                MCQuestionView()
                            }
                        }
                    } else { //otherwise it means you got it incorrect
                        IncorrectAnswerView()
                    }
                }
                if showPopup {
                    VStack{
                        if setManager.answerWasCorrect {
                            CorrectPopupView()
                        }
                        
                    }
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                }
            }.onChange(of: setManager.currentQuestionNumber) { newQuestionNumber in
                //don't do anything if currentQuestionState is answering
                
                withAnimation(.easeIn){
                    showPopup = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    withAnimation(.easeOut){
                        showPopup = false
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
                .font(.system(size: 25))
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

