//
//  ResultView.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import UIKit

class ResultView: UIView {
    
    var randomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var activityInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 24
        return stackView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ResultView: RenderViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(randomImageView)
        verticalStackView.addArrangedSubview(activityInfoLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            randomImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func additionalViewSetup() {
        backgroundColor = .white
    }
    
}
