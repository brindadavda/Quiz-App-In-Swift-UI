//
//  Enums.swift
//  QuizApp
//
//  Created by Brinda Davda on 25/06/24.
//

import Foundation


enum CoinsValue : Int{
    case right = 10
    case wrong = 0
}


enum AppFont : String{
    case ragular = "ABeeZee-Regular"
    case italic = "ABeeZee-Italic"
}


enum Categories : String{
    case science = "science"
    case history = "history"
    case math = "math"
    case geography = "geography"
    case literature = "literature"
    case sports = "sports"
    
    var imageName : String{
        switch self{
        case .science : return "science"
        case .history : return "history"
        case .math : return "math"
        case .geography: return "geography"
        case .sports: return "sports"
        case .literature: return "literature"
        }
    }
}
