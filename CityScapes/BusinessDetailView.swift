//
//  BusinessDetailView.swift
//  CityScapes
//
//  Created by Kelvin on 7/19/24.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "No Business Selected")
    }
}

#Preview {
    BusinessDetailView()
}
