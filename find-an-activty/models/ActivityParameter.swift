//
//  PriceRange.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import Foundation

public struct ActivityParameter {
    let priceRange: PriceRange?
    let numberOfParticipants: Int?
    let activityType: ActivityTypeEnum?
}

struct PriceRange {
    let minPrice: Float
    let maxPrice: Float
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
