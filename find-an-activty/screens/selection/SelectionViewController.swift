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
    
    let items = ["Yan", "Maria", "Juliana"]
    
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
        
        uiController.delegate = self
        uiController.activityTypePickerView.dataSource = self
        uiController.activityTypePickerView.delegate = self
        uiController.activityTypeTextField.delegate = self
    }

}

extension SelectionViewController: SelectionViewDelegate {
    
    func findActivityButtonTapped() {
        print("Find Activity Button Tapped")
        //coordinator.selectionToResult(activity: ActivityResponse())
    }
    
}

extension SelectionViewController: UITextFieldDelegate {
    
}

extension SelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        uiController.activityTypeTextField.text = items[row]
        uiController.activityTypePickerView.resignFirstResponder()
    }
    
}
