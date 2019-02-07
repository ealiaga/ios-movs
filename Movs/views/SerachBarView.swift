//
//  SerachBarView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/5/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class SerachBarView: UIView, UITextFieldDelegate {

    let screenSize = UIScreen.main.bounds;
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 60, width: screenSize.width, height: 60))
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = ColorsMovs.PURPLE
        
        let seachtTextFiled = UITextField(frame: CGRect(x: 10, y: 5, width: screenSize.width-20, height: 36))
        seachtTextFiled.backgroundColor = ColorsMovs.PURPLE_LIGHT
        seachtTextFiled.textColor = UIColor.white
        seachtTextFiled.font = UIFont(name: FontMovs.DOSIS_SEMI_BOLD, size: 18)
        seachtTextFiled.attributedPlaceholder = NSAttributedString(string: "Search",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: ColorsMovs.PURPLE_ULTRA_LIGHT])
        seachtTextFiled.layer.cornerRadius = 9;
        seachtTextFiled.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: seachtTextFiled.frame.height))
        seachtTextFiled.leftViewMode = .always
        seachtTextFiled.rightViewMode = .always
        seachtTextFiled.delegate = self;
        
        addSubview(seachtTextFiled)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   
 
}
