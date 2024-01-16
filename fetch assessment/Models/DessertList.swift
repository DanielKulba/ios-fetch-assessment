//
//  Meal.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/14/24.
//
import Foundation

// used for decoding https://themealdb.com/api/json/v1/1/filter.php?c=Dessert

struct Meals: Decodable{
    var meals: [Meal]
}

struct Meal: Decodable{
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}
