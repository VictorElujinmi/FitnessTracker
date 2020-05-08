//
//  MealListView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 5/8/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI

struct MealListView: View {
    var body: some View {
        
        List {
            
        Text("Sampe Meal")
            
        }.navigationBarTitle("My Meals")
        
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       return  MealListView().environment(\.managedObjectContext, context)
    }
}
