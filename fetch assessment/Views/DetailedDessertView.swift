//
//  DetailedDessertView.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/14/24.
//

import SwiftUI

struct DetailedDessertView: View{
    
    // used to load details for the given recipe
    @ObservedObject var detailsProvider: DessertDetailsProvider
    
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
        self.detailsProvider = DessertDetailsProvider()
    }
    
    var body: some View{
        let details = detailsProvider.dessertDetails
        ScrollView{
            VStack{
                Text(meal.strMeal).font(.title)
                ExternalRoundedImage(imgUrl: meal.strMealThumb, width: 300, height: 300)
                
                let ingredients = details?.ingredients ?? []
                Text("Ingredients:").font(.title2)
                
                ForEach(ingredients, id: \.name){ item in
                    Text("\(item.name): \(item.measurement)")
                }
                
                Text("Instructions:").font(.title2).padding(.top, 20)
                Text(details?.strInstructions ?? "No instructions available")
            }.padding()
        }
        .onAppear{
            // load dessert details for given meal id
            detailsProvider.getDessertDetails(idMeal: meal.idMeal)
        }
    }
}
