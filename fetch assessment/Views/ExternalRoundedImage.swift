//
//  RoundedImageExternal.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/16/24.
//

import SwiftUI

struct ExternalRoundedImage: View {
    let imgUrl:String
    let width, height: CGFloat
    let cornerRadius: CGFloat
    
    init(imgUrl: String, width: CGFloat, height: CGFloat) {
        self.imgUrl = imgUrl
        self.width = width
        self.height = height
        self.cornerRadius = 25
    }
    
    init(imgUrl: String, width: CGFloat, height: CGFloat, cornerRadius:CGFloat) {
        self.imgUrl = imgUrl
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        // https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
        AsyncImage(url: URL(string: imgUrl)){ image in image.resizable()
        } placeholder: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
