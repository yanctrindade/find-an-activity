//
//  RenderViewProtocol.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import Foundation

protocol RenderViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalViewSetup()
}

extension RenderViewProtocol {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        additionalViewSetup()
    }
}
