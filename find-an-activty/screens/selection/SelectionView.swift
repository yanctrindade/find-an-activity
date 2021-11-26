//
//  SelectionView.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import UIKit

protocol SelectionViewDelegate: AnyObject {
    func findActivityButtonTapped()
}

class SelectionView: UIView {
    
    weak var delegate: SelectionViewDelegate?
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fill the form to find an activity or just press find button for a random one (:"
        label.numberOfLines = 0
        return label
    }()
    
    var participantsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Number of Participants"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var activityTypeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Select Activity Type"
        textField.borderStyle = .roundedRect
        textField.inputView = activityTypePickerView
        
        var pickerAccessory = UIToolbar()
        pickerAccessory.autoresizingMask = .flexibleHeight
        var frame = pickerAccessory.frame
        frame.size.height = 44.0
        pickerAccessory.frame = frame
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnClicked(_:)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnClicked(_:)))
        pickerAccessory.items = [cancelButton, flexSpace, doneButton]
        textField.inputAccessoryView = pickerAccessory
        
        return textField
    }()
    
    var priceRangeSlider: UISlider = {
        let priceRangerSlider = UISlider()
        priceRangerSlider.translatesAutoresizingMaskIntoConstraints = false
        return priceRangerSlider
    }()
    
    var findButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Find an Activity!", for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(findBtnClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 24
        return stackView
    }()
    
    var activityTypePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()

    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        activityTypeTextField.resignFirstResponder()
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        activityTypeTextField.resignFirstResponder()
    }
    
    @objc func findBtnClicked(_ button: UIButton?) {
        delegate?.findActivityButtonTapped()
    }
                         
}

extension SelectionView: RenderViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(participantsTextField)
        verticalStackView.addArrangedSubview(activityTypeTextField)
        verticalStackView.addArrangedSubview(priceRangeSlider)
        verticalStackView.addArrangedSubview(findButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    func additionalViewSetup() {
        backgroundColor = .white
    }
    
}
