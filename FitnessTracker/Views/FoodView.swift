//
//  FoodView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI
import UIKit

struct FoodView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                cGuageView(calories: 2000, goal: 3000)
                
                VStack {
                    NavigationLink (destination: MealListView()) {
                        AddMealView()
                    }.border(Color.black)
                    
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            
        }
        
    }
}

struct cGuageView:  View {
    @State var calories: Int
    @State var goal: Int
  
    var body: some View {
        
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.65)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 25.0))
                .frame(width: 150, height:150)
                .rotationEffect(Angle(degrees: -205))
                .padding()
   
            Circle()
                .trim(from: 0.0, to: (self.getCalories()/self.getprt()) * 0.65)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 25.0))
                .frame(width: 150, height:150)
                .rotationEffect(Angle(degrees: -205))
            Text("Calories:" + UserDefaults.standard.string(forKey: UserData.name)! as String)
            
        }
    }
    
    func getCalories() -> CGFloat {
        
        
        let  calConversion = UserDefaults.standard.string(forKey: UserData.cGoal)! as String
        if let calCGFloat = NumberFormatter().number(from: calConversion) {
            let f = CGFloat(truncating: calCGFloat)
            return f
    }
        return 0
        
    }
    

func getprt() -> CGFloat {
        
        
    let  prtConversion = UserDefaults.standard.string(forKey: UserData.prtGoal)! as String
        if let calCGFloat = NumberFormatter().number(from: prtConversion) {
            let f = CGFloat(truncating: calCGFloat)
            return f
    }
        return 0
        
    }
    
}

struct  AddMealView: View {
    
    var body: some View {
        
        
        HStack {
            
            Image(systemName: "star.fill")
            Text("Add Meal")
            
            
        }.frame(width:150, height:150)
        
    }
}



struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        
        FoodView()
    }
}


