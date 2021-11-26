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
        
        uiController.delegate = self
        uiController.activityTypePickerView.dataSource = self
        uiController.activityTypePickerView.delegate = self
        uiController.activityTypeTextField.delegate = self
        
        viewModel.activityFound = { [weak self] activity in
            self?.coordinator.selectionToResult(activity: activity)
        }
    }
    
    override func viewDidLayoutSubviews() {
        uiController.setupSliderFrame()
    }

}

extension SelectionViewController: SelectionViewDelegate {
    
    func findActivityButtonTapped() {
        let participants = uiController.participantsTextField.text
        let activityType = uiController.activityTypeTextField.text
        viewModel.findActivity(participants, type: activityType)
    }
    
    func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        viewModel.setPriceRange(rangeSlider)
    }
    
}

extension SelectionViewController: UITextFieldDelegate {
    
}

extension SelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewModel.PICKER_COLUMNS_NUMBER
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.items.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.items[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        uiController.activityTypeTextField.text = viewModel.items[row]
        uiController.activityTypePickerView.resignFirstResponder()
    }
    
}
