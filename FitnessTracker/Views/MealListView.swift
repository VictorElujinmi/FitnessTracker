//
//  MealListView.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 5/8/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

struct MealListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Meal.name, ascending: true)]) var meals: FetchedResults<Meal>
    @State var showAddSheet = false
    var body: some View {
        
    //FetchRequest
        
        ScrollView {
            
      
                ForEach(meals) { meal in
                    MealItem(mealName: meal.name!, mealCal: meal.prtCount, mealPrt: meal.calorieCount)
                    }
        .navigationBarTitle("My Meals")
        .navigationBarItems(trailing: Button(action: {
        self.showAddSheet = true
                    }, label: {
        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                    }))
            
                .sheet(isPresented: $showAddSheet) {
                    AddSheet().environment(\.managedObjectContext, self.managedObjectContext)
                    
            }
            
        }
        
    }
    
}


struct MealItem: View {
   // var Meal: Meal
    @State var mealName: String
    @State var mealCal: Int16
    @State var mealPrt: Int16
    
    var body: some View {
       
       return VStack(alignment: .leading) {
            HStack {
                Image(systemName: "star.fill").frame(width: 100, height: 100).border(Color.black)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name: \(mealName)")
                    Text("Caloire Count: \(mealCal)")
                    Text("Protein Count: \(mealPrt)")
                }
            }
            Image(systemName: "plus.circle").padding(.leading, 310.0).font(.system(size: 32))
                
        }
       
    }
}

struct AddSheet: View {
    
    @State var name: String = ""
    @State var calorie = ""
    @State var prt = ""
    @State var showingAlert = false
    @State var msg = "Please add Meal Name"
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
   
    var body: some View {
       
        NavigationView {
            Form {
                Section(header: Text("Meal Name")) {
                    TextField("Name", text: $name){
                        //on commit
                        
                        
                    }
                } //Name Section
                
               Section(header: Text("Caloire Count")) {
                TextField("Calories", text: $calorie)
                 //on commit
                //validation
             
            } //Calorie Section
            
                Section(header: Text("Protien Count")) {
                    TextField("Protien", text: $prt)
                    //on commit
                    //validation
                   
                } //prt
                Button("Add Meal!") {
                    guard self.name != "" else {
                        self.msg = "Please add Meal Name"
                        self.showingAlert = true
                        return
                    }
                    
                    let newMeal = Meal(context: self.managedObjectContext)
                    newMeal.name = self.name
                    
                    guard Int16(self.calorie) !=  nil else {
                        self.msg = "Please add a Calorie Count"
                        self.showingAlert = true
                        return
                    }
                        newMeal.calorieCount = Int16(self.calorie)!
                    
                    guard Int16(self.prt) !=  nil else {
                        self.msg = "Please add a Protien Count"
                        self.showingAlert = true
                        return
                    }
                    newMeal.prtCount = Int16(self.prt)!
                    
                    newMeal.id = UUID()
                    do {
                    try self.managedObjectContext.save()
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Invalid input"), message: Text(msg), dismissButton: .default(Text("Got it!")))
                }
                .navigationBarTitle("Add Order")
                
            }
            
        }
        
    }
    
   
}



struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       return  MealListView().environment(\.managedObjectContext, context)
    }
}

