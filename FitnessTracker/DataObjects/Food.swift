//
//  Food.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import Foundation

class Food {
    private var name: String
    private var calorie: Int
    private var prt: Int
    
    init(name:String, calorie:Int, prt:Int) {
        
        self.name = name
        self.calorie = calorie
        self.prt = prt
        
    }
    
    func getName() -> String {
    return self.name
    }
    
    func getCalorie() -> Int {
    return self.calorie
    }
    
    func getPrt() -> Int{
        return self.prt
    }
    
}


