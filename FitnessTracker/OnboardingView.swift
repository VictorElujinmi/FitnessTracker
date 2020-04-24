//
//  OnboardingView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/23/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI
import Combine

struct OnboardingView: View {
    @EnvironmentObject var env : MyAppEnvironmentData
    @State var currentPage = 0
  
    var subViews = [
        
        UIHostingController(rootView: PlanMealView()),
        UIHostingController(rootView: PlanWorkOutView()),
        UIHostingController(rootView: ShareView()),
    ]
    
    var body: some View {
        
            PageViewController(controllers: subViews).frame(width: 500, height: 500, alignment: .top)
        
    }
}


struct ShareView: View {
    @EnvironmentObject var env : MyAppEnvironmentData
    
    
    var body: some View {
        
        let navlink = NavigationLink(destination: InformationView(),
        tag: .SecondPage,
        selection: $env.currentPage,
        label: { EmptyView() })
        return  VStack {
            Text("Share your gains with the world")
                .padding()
            navlink
            .frame(width:0, height:0)
            Button("Lets Go!") {
                self.env.currentPage = .SecondPage
                
                }.frame(width: 100, height: 40, alignment: .center
            )
                .padding(12.0)
                .border(Color.black)         
        }

    }
    
}


struct PlanWorkOutView: View {
    
    var body: some View {
        Text("Plan Your Workout")
        
    }
    
}

struct PlanMealView: View {
    
    var body: some View {
        Text("Plan your meal")
        
    }
    
}


struct InformationView: View {
    @EnvironmentObject var env : MyAppEnvironmentData
    
    var body: some  View {
        
        Button("Sign up") {
             self.env.currentPage = .Menu
        }
    }
    
}

struct MainView: View {
    var body: some View {
        
        NavigationView {
            OnboardingView()
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView().environmentObject(MyAppEnvironmentData())
        
    }
}




