//
//  ContentView.swift
//  CityScapes
//
//  Created by Kelvin on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for?", text: $query)
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                
            }
        }
        .padding()
        .task {
            await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
