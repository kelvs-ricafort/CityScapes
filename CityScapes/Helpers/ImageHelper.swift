//
//  ImageHelper.swift
//  CityScapes
//
//  Created by Kelvin on 7/19/24.
//

import Foundation

struct ImageHelper {
    static func ratingToStars(rating: Double) -> String {
        return "regular_\(round((rating * 2.0)) * 0.5)"
    }
}
