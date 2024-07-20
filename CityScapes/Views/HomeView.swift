//
//  HomeView.swift
//  CityScapes
//
//  Created by Kelvin on 7/17/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
 
    var body: some View {
        @Bindable var model = model
        VStack {
            HStack {
                TextField("What are you looking for?", text: $model.query)
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
            // Show Picker
            Picker("", selection: $selectedTab) {
                Image(systemName: "list.bullet.clipboard")
                    .tag(0)
                Image(systemName: "map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            // Show Map Or List
            if selectedTab == 0 {
                ListView()
            } else {
                MapView()
            }
            
        }
        .onAppear {
            model.getBusinesses()
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
