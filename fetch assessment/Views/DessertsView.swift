//
//  ContentView.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/12/24.
//

import SwiftUI

struct DessertsView: View {
    @EnvironmentObject var network: DessertListProvider
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach(network.desserts, id:\.idMeal){item in
                        NavigationLink(destination: DetailedDessertView(meal: item)){
                            DessertItemView(meal: item)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Desserts")
            .onAppear{
                network.getDesserts()
            }
        }
    }
}

#Preview {
    DessertsView()
        .environmentObject(DessertListProvider())
}




