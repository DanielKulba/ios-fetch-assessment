//
//  DessertDetails.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/15/24.
//

import Foundation

// used for decodinghttps://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID

struct DessertResponse: Decodable{
    var meals:[DessertDetails]
}

struct Ingredient: Decodable {
    let name: String
    let measurement: String
}


struct DessertDetails: Decodable{
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?

    let ingredients: [Ingredient]
    
    
    //https://swiftsenpai.com/swift/decode-dynamic-keys-json/
    private struct DynamicCodingKey: CodingKey {
            var stringValue: String
            init?(stringValue: String) {
                self.stringValue = stringValue
            }
            var intValue: Int? { return nil }
            init?(intValue: Int) { return nil }
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKey.self)

        // Decode all the regular properties
        self.idMeal = try container.decode(String.self, forKey: .init(stringValue:"idMeal")!)
        self.strMeal = try container.decode(String.self, forKey: .init(stringValue:"strMeal")!)
        self.strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .init(stringValue: "strDrinkAlternate")!)
        self.strCategory = try container.decode(String.self, forKey: .init(stringValue:"strCategory")!)
        self.strArea = try container.decode(String.self, forKey: .init(stringValue:"strArea")!)
        self.strInstructions = try container.decode(String.self, forKey: .init(stringValue:"strInstructions")!)
        self.strMealThumb = try container.decode(String.self, forKey: .init(stringValue:"strMealThumb")!)
        self.strTags = try container.decodeIfPresent(String.self, forKey: .init(stringValue: "strTags")!)
        self.strYoutube = try container.decodeIfPresent(String.self, forKey: .init(stringValue: "strYoutube")!)
        self.strSource = try container.decodeIfPresent(String.self, forKey: .init(stringValue:"strSource")!)
        self.strImageSource = try container.decodeIfPresent(String.self, forKey: .init(stringValue: "strImageSource")!)
        self.strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .init(stringValue: "strCreativeCommonsConfirmed")!)
        self.dateModified = try container.decodeIfPresent(String.self, forKey: .init(stringValue: "dateModified")!)

        
        // dynamically parse the ingredients and measurements to avoid repetition
        var ingredients: [Ingredient] = []
                for index in 1...20 {
                    let ingredientKey = DynamicCodingKey(stringValue: "strIngredient\(index)")
                    let measurementKey = DynamicCodingKey(stringValue: "strMeasure\(index)")

                    if let ingredient = try? container.decode(String.self, forKey: ingredientKey!),
                       let measurement = try? container.decode(String.self, forKey: measurementKey!) {
                        if(ingredient != ""){
                            ingredients.append(Ingredient(name: ingredient, measurement: measurement))
                        }
                    }
                }

                self.ingredients = ingredients
    }
}


