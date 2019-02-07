//
//  ErrorView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/7/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    let screenSize = UIScreen.main.bounds;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.endEditing(true)
    }
    
    private func setupView(){
        
        let icon = UIImageView(frame: CGRect(x: screenSize.width/2 - 30, y: screenSize.height/5, width: 60, height: 60))
        icon.image = UIImage(named: "ios-close-circle")
        
        let label = UILabel(frame: CGRect(x: screenSize.width/4, y: screenSize.height/5 + 80, width: screenSize.width/2, height: 60))
        label.textColor = ColorsMovs.GRAY
        label.font = UIFont(name: FontMovs.DOSIS_MEDIUM, size: 21)
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Ups! an error has occurred, please try again"
        label.sizeToFit()
        
        addSubview(icon)
        addSubview(label)
    }

}
