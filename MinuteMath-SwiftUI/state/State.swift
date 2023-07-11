//
//  State.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 7/3/23.
//

import Foundation

class AppState: ObservableObject {
//    @Published var apiUrl: String = "http://127.0.0.1:8800"
    @Published var apiUrl: String = "http://10.0.0.209:8800"
    
    @Published var test = 0
    
    //set manager stuff
    
    init(){
//        let testSet = QuestionSet()
//        testSet.fetch(baseUrlString: apiUrl, setName: "AR-EA")
    }
}

class WrappedStruct<T>: ObservableObject {
    @Published var item: T
    
    init(withItem item:T) {
        self.item = item
    }
}
