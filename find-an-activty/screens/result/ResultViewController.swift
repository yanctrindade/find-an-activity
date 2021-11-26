//
//  ResultViewController.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    let uiController: ResultView
    let viewModel: ResultViewModel
    
    init(viewModel: ResultViewModel) {
        self.viewModel = viewModel
        self.uiController = ResultView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = uiController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
