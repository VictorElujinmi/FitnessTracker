//
//  HomeView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            
            Text("Home View")
                
            
            Button ("Reset") {
                UserDefaults.standard.set(nil, forKey: UserData.name)
            }
            .padding(.top)
            
        }
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
