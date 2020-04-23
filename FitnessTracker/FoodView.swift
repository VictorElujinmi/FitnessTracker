//
//  FoodView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/22/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    @State var calories: CGFloat
    @State var goal: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.65)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 25.0))
                .frame(width: 150, height:150)
                .rotationEffect(Angle(degrees: -205))
            
            Circle()
                .trim(from: 0.0, to: (calories/goal) * 0.65)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 25.0))
            .frame(width: 150, height:150)
                .rotationEffect(Angle(degrees: -205))
            Text("300 Calories")
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(calories: 1000.0, goal: 2000.0)
    }
}