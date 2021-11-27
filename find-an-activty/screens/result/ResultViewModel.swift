//
//  ResultViewModel.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import Foundation

class ResultViewModel {
    
    let apiClient = APIClient()
    let activity: ActivityResponse
    
    var imageURLRetrieved: (([ImageResponse]) -> ())?
    
    init(activity: ActivityResponse) {
        self.activity = activity
    }
    
    func getImageURL() {
        apiClient.getImage { [weak self] result in
            switch result {
                case .success(let images):
                    self?.imageURLRetrieved?(images)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func getActivityInfo()-> String {
        var content = ""
        if let name = activity.activity {
            content = "Name: \(name)\n"
        }
        if let type = activity.type {
            content = content + "Type: \(type)\n"
        }
        if let participants = activity.participants {
            content = content + "Number of Participants: \(participants)\n"
        }
        if let price = activity.price {
            content = content + "Price: \(price)\n"
        }
        return content
    }
}
