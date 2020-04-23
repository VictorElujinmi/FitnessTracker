//
//  Person.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import Foundation


class Person {
    
    private var name: String
    private var calorieGoal: Int
    private var prt: Int
    
    
    init (name: String) {
        
        self.name = name
        calorieGoal = 0
        prt = 0
        
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getCalGoal() -> Int {
        return self.calorieGoal
    }
    
    func getName() -> Int {
        return self.prt
    }
    
    func setName(name: String) {
        
        self.name = name
    }
    
    func getCalGoal(calorieGoal: Int ) {
         self.calorieGoal = calorieGoal
    }
    
    func getCalGoal(prt: Int ) {
         self.prt = prt
    }
    
}
