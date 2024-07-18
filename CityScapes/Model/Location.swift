//
//  Location.swift
//  CityScapes
//
//  Created by Kelvin on 7/18/24.
//

import Foundation

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var country: String?
    var display_address: [String]?
    var state: String?
    var zip_code: String?
}
