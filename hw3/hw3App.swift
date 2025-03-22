//
//  hw3App.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//

import SwiftUI

@main
struct hw3App: App {
    @State var diningHallModel = DiningHallModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(diningHallModel)
        }
    }
}
