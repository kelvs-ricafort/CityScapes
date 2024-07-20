//
//  CityScapes.swift
//  CityScapes
//
//  Created by Kelvin on 7/17/24.
//

import SwiftUI

@main
struct CityScapes: App {
    @State var model = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
        }
    }
}
