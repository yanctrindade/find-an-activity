//
//  SelectionViewModel.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import Foundation

class SelectionViewModel {
    
    let apiClient = APIClient()
    let PICKER_COLUMNS_NUMBER = 1
    let items: [String] = ActivityTypeEnum.allCases.map { $0.rawValue }
    
    var parameteres = ActivityParameter()
    
    var activityFound: ((ActivityResponse) -> ())?
    
    func findActivity(_ participants: String?, type: String?) {
        if let participants = participants, let type = type {
            parameteres.numberOfParticipants = Int(participants)
            parameteres.activityType = ActivityTypeEnum(rawValue: type)
        }
        
        apiClient.getActivity(with: parameteres) { [weak self] result in
            switch result {
                case .success(let activity):
                    self?.activityFound?(activity)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func setPriceRange(_ rangeSlider: RangeSlider) {
        let priceRange = PriceRange(minPrice: Float(rangeSlider.lowerValue), maxPrice: Float(rangeSlider.upperValue))
        parameteres.priceRange = priceRange
    }
    
}
