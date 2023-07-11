//
//  Sets.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 6/28/23.
//

import Foundation

enum SetType{
    case Arithmetic, Algebra
}

enum Difficulty{
    case Easy, Intermediate, Advanced
}

struct SetData: Identifiable{
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var setType: SetType
}

var testSetData = [
    SetData(name: "Arithmetic", description: "", imageName: "arithmetic", setType: .Arithmetic),
    SetData(name: "Algebra", description: "", imageName: "algebra", setType: .Algebra)
]
