//
//  SelectionView.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import UIKit

class SelectionView: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectionView: RenderViewProtocol {
    
    func buildViewHierarchy() {
         
    }
    
    func setupConstraints() {
         
    }
    
    func additionalViewSetup() {
        backgroundColor = .white
    }
    
}
