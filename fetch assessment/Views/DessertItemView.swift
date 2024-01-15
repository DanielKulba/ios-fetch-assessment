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
            
            // https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
            AsyncImage(url: URL(string: meal.strMealThumb))
            { image in image.resizable() } placeholder: {ProgressView().progressViewStyle(CircularProgressViewStyle()) } .frame(width: 128, height: 128) .clipShape(RoundedRectangle(cornerRadius: 25))
        }.padding()
    }
}

