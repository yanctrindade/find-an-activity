//
//  Coordinator.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import UIKit

class AppCoordinator {
    
    private var presenter: UINavigationController
    private var window: UIWindow
    private weak var appDelegate: AppDelegate?
    
    init(appDelegate: AppDelegate, window: UIWindow) {
        self.appDelegate = appDelegate
        self.window = window
        self.presenter = UINavigationController()
    }
    
    func start() {
        let selectionViewModel = SelectionViewModel()
        let selectionViewController = SelectionViewController(viewModel: selectionViewModel)
        self.presenter = UINavigationController(rootViewController: selectionViewController)
        self.appDelegate?.window = self.window
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
    
    func selectionToResult(activity: ActivityResponse) {
        let resultViewModel = ResultViewModel(activity: activity)
        let resultViewController = ResultViewController(viewModel: resultViewModel)
        presenter.pushViewController(resultViewController, animated: false)
    }
    
}
