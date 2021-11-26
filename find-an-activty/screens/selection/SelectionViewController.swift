//
//  SelectionViewController.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import UIKit

class SelectionViewController: UIViewController {
    
    let uiController: SelectionView
    let viewModel: SelectionViewModel
    
    init(viewModel: SelectionViewModel) {
        self.viewModel = viewModel
        self.uiController = SelectionView()
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
