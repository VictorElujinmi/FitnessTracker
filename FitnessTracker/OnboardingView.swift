//
//  OnboardingView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/23/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var currentPage = 0
    var subViews = [
    
        UIHostingController(rootView: nameView()),
        UIHostingController(rootView: bodyView())
    ]
    
    var body: some View {
        PageViewController(controllers: subViews, currentPage: 0)
                
    }
}


struct nameView: View {
    
    var msg = "Message"
    
    var body: some View {
        Text("Whats your Name?")
    }
}

struct bodyView: View {
    
    var msg = "Message"
    
    var body: some View {
        Text("Page 2")
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
