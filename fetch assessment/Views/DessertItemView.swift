//
//  DessertItem.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/14/24.
//

import SwiftUI

struct DessertItemView: View {
    let meal:Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        HStack{
            Text(meal.strMeal)
            Spacer()
            ExternalRoundedImage(imgUrl: meal.strMealThumb, width: 128, height: 128)
        }.padding()
    }
}

