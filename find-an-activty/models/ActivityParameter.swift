//
//  PriceRange.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import Foundation

public struct ActivityParameter {
    var priceRange: PriceRange?
    var numberOfParticipants: Int?
    var activityType: ActivityTypeEnum?
}

struct PriceRange {
    var minPrice: Float
    var maxPrice: Float
}

enum ActivityTypeEnum: String, CaseIterable {
    case education = "education"
    case recreational = "recreational"
    case social = "social"
    case diy = "diy"
    case cooking = "cooking"
    case relaxation = "relaxation"
    case music = "music"
    case busywork = "busywork"
}
