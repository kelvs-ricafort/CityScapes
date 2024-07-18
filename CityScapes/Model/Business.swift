//
//  Business.swift
//  CityScapes
//
//  Created by Kelvin on 7/18/24.
//

import Foundation

struct Business: Decodable, Identifiable {
    var id: String?
    var alias: String?
    var categories: [Category]
    var coordinates: Coordinate?
    var display_phone: String?
    var distance: Double?
    var image_url: String?
    var is_closed: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var rating: Double?
    var review_count: Int?
    var url: String
}
