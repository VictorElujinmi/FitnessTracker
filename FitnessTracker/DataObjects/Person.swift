//
//  Person.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import Foundation


struct UserData {
    
    static var name = "userName"
    static var cGoal = "cGoal"
    static var prtGoal = "prtGoal" //protien goal
    static var bGoal = "bGoal" //how many calories user wants to burn
    static var cTotal = "cTotal" // Current Amount of Calories
    static var prtTotal = "prtTotal"
    static var getCTotal = Int16(UserDefaults.standard.integer(forKey: UserData.cTotal))
    static var getPrtToatl = Int16(UserDefaults.standard.integer(forKey: UserData.prtTotal))
    
}



class Person {
    
    private var name: String
    private var calorieGoal: Int
    private var prt: Int
    private var burnGoal: Int
    
    
    init (name: String) {
        
        self.name = name
        calorieGoal = 0
        prt = 0
        burnGoal = 0
        
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
    
    /**
     This method takes in the users desired calorie burn goal and sets the instance vairable
     */
    func setBurnGoal(burnGoal: Int) {
        self.burnGoal = burnGoal
    }
    
    /**
     This method returns teh users desired calorie burn so it can be used in other classes
     */
    func getBurnGoal() -> Int {
        return self.burnGoal
    }
}
