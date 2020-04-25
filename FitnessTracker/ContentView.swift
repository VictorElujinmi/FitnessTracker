//
//  ContentView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        
        VStack {
            
            ProfileView()
            TabView() {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                }
                FoodView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Meal")
                }
                MachineView()
                    .tabItem {
                        Image(systemName: "burn")
                        Text("Workout")
                        
                }
                
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
