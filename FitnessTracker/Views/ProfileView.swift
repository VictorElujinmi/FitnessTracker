//
//  ProfileView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/25/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        
        
        HStack(alignment: .center, spacing: 20.0){
            Button(action: {}) {
                Image(systemName: "person.circle") .font(.system(size: 40))
            }
            Text("Version 1")
        }.frame(width: 370, height:50)
        .border(Color.black)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
