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
            
       MealItem()
            
            
        }.navigationBarTitle("My Meals")
        
    }
}


struct MealItem: View {
   // var Meal: Meal
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "star.fill").frame(width: 100, height: 100, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name: Sample")
                    Text("Caloire Count: ####")
                    Text("Protein Count: ####")
                }
            }
            Text("Add Button")
                .padding(.leading, 250.0)
                .frame( alignment: .bottomTrailing)
                
        }
       
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       return  MealListView().environment(\.managedObjectContext, context)
    }
}
