//
//  MachineView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct MachineView: View {
    var body: some View {
        
       VStack {
        
        HStack { //stacking the buttons side by side
            Button(action: {}) {
            Text("Cardio")
                .foregroundColor(Color.black)
            
                
        }
        .padding(10)
        .border(Color.purple)
        .position(.init(x: 63, y: 45))
       
        Button(action: {}) {
            Text("Strength")
                .foregroundColor(Color.black)
                .padding()
         }
         .padding(10)
        .border(Color.orange)
        .position(.init(x: 63, y: 45))
      
       
        Button(action: {}) {
            Text("Body")
                .foregroundColor(Color.black)
         }
         .padding(10)
        .border(Color.green)
            .position(.init(x: 63, y: 45))
        
        }
        
        
        Text("Machine View")
        
            
        }
    }
}

struct MachineView_Previews: PreviewProvider {
    static var previews: some View {
        MachineView()
    }
}
