//
//  ResultView.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import UIKit

class ResultView: UIView {
    
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
         
    }
    
    func setupConstraints() {
         
    }
    
    func additionalViewSetup() {
         
    }
    
}
