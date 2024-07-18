//
//  BusinessSearch.swift
//  CityScapes
//
//  Created by Kelvin on 7/18/24.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses: [Business] = [Business]()
    var region = Region()
    var total = 0
}
