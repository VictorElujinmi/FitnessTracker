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
                    
                    
                    NavigationLink (destination: OnboardingView()) {
                        AddMealView()
                    }.border(Color.black)
                    
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
        
    }
}

struct cGuageView:  View {
    @State var calories: CGFloat
    @State var goal: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.65)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 25.0))
                .frame(width: 150, height:150)
                .rotationEffect(Angle(degrees: -205))
                .padding()
            
            Circle()
                .trim(from: 0.0, to: (calories/goal) * 0.65)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 25.0))
                .frame(width: 150, height:150)
                .rotationEffect(Angle(degrees: -205))
            Text("300 Calories")
        }
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


