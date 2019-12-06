//
//  Recipe.swift
//  CTRevision02
//
//  Created by MAD2_P02 on 6/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation

class Recipe {
    var name:String
    var preparationTime : Int16
    
    init(name:String, preparationTime:Int16) {
        self.name = name
        self.preparationTime = preparationTime
    }
}
