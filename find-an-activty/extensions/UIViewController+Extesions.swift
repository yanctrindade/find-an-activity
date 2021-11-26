//
//  UIViewController+Extesions.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import UIKit

extension UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var coordinator: AppCoordinator {
        return self.appDelegate.coordinator
    }
    
}
