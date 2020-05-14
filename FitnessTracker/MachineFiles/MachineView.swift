//
//  MachineView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI
import UIKit

struct MachineView: View {
    var body: some View {
        HStack {
            NavigationLink (destination: CardioView()) {
                AddCardioView()
                
            }.border(Color.black)
            
            NavigationLink (destination: WorkoutView() ) {
                AddWorkoutView()
                
            }.border(Color.black)
        }
    }
}


struct  AddCardioView: View {
    
    var body: some View {
        
        
        HStack {
            
            Text("Add Cardio")
            
            
        }.frame(width:150, height:150)
        
    }
}


struct  AddWorkoutView: View {
    
    var body: some View {
        
        
        HStack {
            
            Text("Add Workout")
            
            
        }.frame(width:150, height:150)
        
    }
}


struct MachineView_Previews: PreviewProvider {
    static var previews: some View {
        MachineView()
    }
}
