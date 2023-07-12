//
//  PopupViews.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 7/11/23.
//

import SwiftUI

struct CorrectPopupView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            ZStack{
                Color.green
                    .frame(height: 100)
                    .cornerRadius(4)
                    .padding(10)
                Text("Correct!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            }
            Spacer()
        }
    }
}

struct PopupViews_Previews: PreviewProvider {
    static var previews: some View {
        CorrectPopupView()
    }
}
