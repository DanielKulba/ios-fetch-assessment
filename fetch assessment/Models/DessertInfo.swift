//
//  DessertItem.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/14/24.
//

import SwiftUI

struct DessertInfo {
    let itemName, id: String
//    let dessertImage: Image
    
    init(itemName: String, imageURL: String, id: String) {
        self.itemName = itemName
//        self.dessertImage = AsyncImage(url: URL(string: imageURL))
//            .frame(width: 50, height: 50) as! Image
        self.id = id
    }
}
