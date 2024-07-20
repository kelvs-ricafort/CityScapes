//
//  CityScapesApp.swift
//  CityScapes
//
//  Created by Kelvin on 7/17/24.
//

import SwiftUI

@main
struct CityScapesApp: App {
    @State var model = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
