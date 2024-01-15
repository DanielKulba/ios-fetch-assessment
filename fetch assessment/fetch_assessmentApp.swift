//
//  fetch_assessmentApp.swift
//  fetch assessment
//
//  Created by Daniel Kulbachenko on 1/12/24.
//

import SwiftUI

@main
struct fetch_assessmentApp: App {
    var network = Network()

        var body: some Scene {
            WindowGroup {
                DessertsView()
                    .environmentObject(network)
            }
        }
}

