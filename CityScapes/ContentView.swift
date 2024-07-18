//
//  ContentView.swift
//  CityScapes
//
//  Created by Kelvin on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                Button {
                    // TODO: Implememt query
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            List(businesses) { b in
                Text(b.name ?? "No Business Found")
            }
        }
        .padding()
        .task {
             businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
