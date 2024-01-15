//
//  DetailedDessertView.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/14/24.
//

import SwiftUI

struct DetailedDessertView: View{
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
        
    }
    
    var body: some View{
        ScrollView{
            VStack{
                Text("welcome to the detailed view!")
                Text(meal.strMeal)
                Text(meal.idMeal)
                Text("hello")
            }
        }
        .onAppear{
            
        }
        .navigationTitle(meal.strMeal)
    }
}
