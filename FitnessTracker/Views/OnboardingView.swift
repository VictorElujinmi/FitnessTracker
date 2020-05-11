//
//  OnboardingView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/23/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI
import Combine



struct MainView: View {
    var body: some View {
        
        NavigationView {
            OnboardingView()
        }
    }
}



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
                
                }.frame(width: 100, height: 40, alignment: .center)
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
    
    @State var name: String = ""
    @State var calorie: String = ""
    @State var prt: String = ""
    @State var burnGoal: String = ""
    @EnvironmentObject var env : MyAppEnvironmentData
    
    var body: some  View {
        
        VStack {
            userQuery(label: "Name", placeholder: "Whats your name", quest: $name)
            userQuery(label: "Calorie Goal", placeholder: "Daily calorie goal", quest: $calorie).keyboardType(.decimalPad)
            userQuery(label: "Protien Goal", placeholder: "Daily Protien goal", quest: $prt).keyboardType(.numberPad)
            userQuery(label: "Calorie Deficit Goal", placeholder: "Daily Deficit goal", quest: $burnGoal).keyboardType(.numberPad)
           
            //Will extract view to have reusable and same buttons
            Button("Done") {
                // Would do input Validiaiton here
                UserDefaults.standard.set(self.name, forKey: UserData.name)
                UserDefaults.standard.set(self.prt, forKey: UserData.prtGoal)
                UserDefaults.standard.set(self.calorie, forKey: UserData.cGoal)
                UserDefaults.standard.set(self.burnGoal, forKey: UserData.bGoal)
                UserDefaults.standard.set(0, forKey: UserData.cTotal)
                UserDefaults.standard.set(0, forKey: UserData.prtTotal)
                
                print(UserDefaults.standard.string(forKey: UserData.name)! as String)
                print(UserDefaults.standard.integer(forKey: UserData.cGoal) as Int)
                print(UserDefaults.standard.integer(forKey: UserData.prtGoal) as Int)
                print(UserDefaults.standard.integer(forKey: UserData.bGoal) as Int)
                
            }
            .frame(width: 100, height: 40)
            .border(Color.black)
            .padding(12.0)
        }
        .padding(.all)
   }
    
}







struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView().environmentObject(MyAppEnvironmentData())
        //InformationView()
        
        
    }
}





struct userQuery: View {
    
    var label: String
    var placeholder: String
    @Binding var quest: String
    var body: some View {
        HStack {
            Text("\(label) :")
            TextField("\(placeholder)?", text: $quest, onCommit: {print (self.quest)})
                .textContentType(.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            
        }
    }
}
