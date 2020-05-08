//
//  Machine.swift
//  FitnessTracker
//
//  Created by Muskan Sharma on 5/1/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import Foundation

class Machine {
    private var name: String
    private var burn: Int

    
    init(name:String, burn:Int) {
        
        self.name = name
        self.burn = burn
        
    }
    
    func getName() -> String {
    return self.name
    }
    
    func getBurn() -> Int {
    return self.burn
    }

}
