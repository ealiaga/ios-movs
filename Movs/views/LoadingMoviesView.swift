//
//  LoadingMoviesView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/6/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class LoadingMoviesView: UIView {

    let screenSize = UIScreen.main.bounds;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupView(){
        let viewLoading = UIView(frame: CGRect(x: 20, y: 20, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        addSubview(viewLoading)
    }
    
    private func getGradientLayerLoading(bounds: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ UIColor.white.withAlphaComponent(0.3).cgColor, UIColor.white.withAlphaComponent(0.6).cgColor, UIColor.white.withAlphaComponent(0.9).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.8)
        gradientLayer.frame = bounds
        return gradientLayer
    }
    

}
