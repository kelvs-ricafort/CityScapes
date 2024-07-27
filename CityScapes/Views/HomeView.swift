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
    
    @State var query = ""
    @FocusState var queryBoxFocused: Bool
    
    @State var showOptions = false
    @State var popularOn = false
    @State var dealsOn = false
    @State var wheelchairOn = false
    @State var wifiOn = false
    
    @State var categorySelection = "restaurants"
 
    var body: some View {
        @Bindable var model = model
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation {
                            showOptions = true
                        }
                    }
                Button {
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                    // Perform a search
                    model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
            .padding(.horizontal)
            
            // Query options. Show if textbox is focused.
            if showOptions {
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    Toggle("Wheelchair Accessible", isOn: $wheelchairOn)
                    Toggle("WiFi", isOn: $wifiOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                            Text("Hospitals")
                                .tag("hospitals")
                            Text("Hospice")
                                .tag("hospice")
                        }
                    }
                }
                .padding(.horizontal, 40)
                .transition(.push(from: .top))
            }
            // Show Picker
            Picker("", selection: $selectedTab) {
                Image(systemName: "list.bullet.clipboard")
                    .tag(0)
                Image(systemName: "map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            // Show Map Or List
            if selectedTab == 0 {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            } else {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            
        }
        .onAppear {
            model.getBusinesses(query: nil, options: nil, category: nil)
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        if wheelchairOn {
            optionsArray.append("wheelchair_accessible")
        }
        if wifiOn {
            optionsArray.append("wifi_free")
        }
        return optionsArray.joined(separator: ",")
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
