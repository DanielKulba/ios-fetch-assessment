//
//  Network.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/14/24.
//

import SwiftUI

class DessertListProvider: ObservableObject{
    @Published var desserts:[Meal]=[]
    
    func getDesserts() {
           guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { fatalError("Missing URL") }

           let urlRequest = URLRequest(url: url)

           let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
               if let error = error {
                   print("Request error: ", error)
                   return
               }

               guard let response = response as? HTTPURLResponse else { return }

               if response.statusCode == 200 {
                   guard let data = data else { return }
                   
                   DispatchQueue.main.async {
                       do {
                           let decodedDesserts = try JSONDecoder().decode(Meals.self, from: data)
                           
                           self.desserts = decodedDesserts.meals
                       } catch let error {
                           print("Error decoding: ", error)
                       }
                   }
               }
           }
           dataTask.resume()
       }
    }

class DessertDetailsProvider: ObservableObject{
    @Published var dessertDetails:DessertDetails?
    
    func getDessertDetails(idMeal:String){
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let decodedDesserts = try JSONDecoder().decode(DessertResponse.self, from: data)
                        
                        self.dessertDetails = decodedDesserts.meals[0]
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}

