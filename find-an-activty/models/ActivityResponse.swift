//
//  Activity.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import Foundation

public struct ActivityResponse: Decodable {
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Double?
    let link: String?
    let key: String?
    let acessibility: Int?
    let error: String?
}
