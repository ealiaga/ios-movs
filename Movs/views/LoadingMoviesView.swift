//
//  LoadingMoviesView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/6/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class LoadingMoviesView: UIScrollView {

    let screenSize = UIScreen.main.bounds;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.contentSize = CGSize(width: screenSize.width, height: screenSize.height)
        
        setupViewLeft1()
        setupViewLeft2()
        setupViewLeft3()
        setupViewRight1()
        setupViewRight2()
        setupViewRight3()        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupViewLeft1(){
        let viewLoading = UIView(frame: CGRect(x: 25, y: 20, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        let labelLoading = UIView(frame: CGRect(x: 25, y: 150, width: screenSize.width/2 - 40, height: 15))
        labelLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        labelLoading.layer.cornerRadius = 6
        labelLoading.layer.mask = getGradientLayerLoading(bounds: labelLoading.bounds)
        
        addSubview(viewLoading)
        addSubview(labelLoading)
    }
    
    private func setupViewLeft2(){
        let viewLoading = UIView(frame: CGRect(x: 25, y: 190, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        let labelLoading = UIView(frame: CGRect(x: 25, y: 320, width: screenSize.width/2 - 40, height: 15))
        labelLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        labelLoading.layer.cornerRadius = 6
        labelLoading.layer.mask = getGradientLayerLoading(bounds: labelLoading.bounds)
        
        addSubview(viewLoading)
        addSubview(labelLoading)
    }
    
    private func setupViewLeft3(){
        let viewLoading = UIView(frame: CGRect(x: 25, y: 360, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        let labelLoading = UIView(frame: CGRect(x: 25, y: 490, width: screenSize.width/2 - 40, height: 15))
        labelLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        labelLoading.layer.cornerRadius = 6
        labelLoading.layer.mask = getGradientLayerLoading(bounds: labelLoading.bounds)
        
        addSubview(viewLoading)
        addSubview(labelLoading)
    }
    
    private func setupViewRight1(){
        let viewLoading = UIView(frame: CGRect(x: 15 + screenSize.width/2, y: 20, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        let labelLoading = UIView(frame: CGRect(x: 15 + screenSize.width/2, y: 150, width: screenSize.width/2 - 40, height: 15))
        labelLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        labelLoading.layer.cornerRadius = 6
        labelLoading.layer.mask = getGradientLayerLoading(bounds: labelLoading.bounds)
        
        addSubview(viewLoading)
        addSubview(labelLoading)
    }
    
    private func setupViewRight2(){
        let viewLoading = UIView(frame: CGRect(x: 15 + screenSize.width/2, y: 190, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        let labelLoading = UIView(frame: CGRect(x: 15 + screenSize.width/2, y: 320, width: screenSize.width/2 - 40, height: 15))
        labelLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        labelLoading.layer.cornerRadius = 6
        labelLoading.layer.mask = getGradientLayerLoading(bounds: labelLoading.bounds)
        
        addSubview(viewLoading)
        addSubview(labelLoading)
    }
    
    private func setupViewRight3(){
        let viewLoading = UIView(frame: CGRect(x: 15 + screenSize.width/2, y: 360, width: screenSize.width/2 - 40, height: 120))
        viewLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        viewLoading.layer.cornerRadius = 9
        viewLoading.layer.mask = getGradientLayerLoading(bounds: viewLoading.bounds)
        
        let labelLoading = UIView(frame: CGRect(x: 15 + screenSize.width/2, y: 490, width: screenSize.width/2 - 40, height: 15))
        labelLoading.backgroundColor = ColorsMovs.GRAY_LIGHT
        labelLoading.layer.cornerRadius = 6
        labelLoading.layer.mask = getGradientLayerLoading(bounds: labelLoading.bounds)
        
        addSubview(viewLoading)
        addSubview(labelLoading)
    }
    
    private func getGradientLayerLoading(bounds: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ UIColor.white.withAlphaComponent(0.3).cgColor, UIColor.white.withAlphaComponent(0.6).cgColor, UIColor.white.withAlphaComponent(0.9).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.8)
        gradientLayer.frame = bounds
        return gradientLayer
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.endEditing(true)
    }
}
