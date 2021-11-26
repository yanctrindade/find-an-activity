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
    
    func findActivity() {
        print("Find Activity Button Tapped")
        apiClient.getActivity(with: nil) { result in
            switch result {
                case .success(let activity):
                    break
                case .failure(let error):
                    break
            }
        }
    }
    
}
