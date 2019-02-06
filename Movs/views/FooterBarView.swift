//
//  FooterBarView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/5/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class FooterBarView: UIView {

    let screenSize = UIScreen.main.bounds;
    let heightFooter:CGFloat = 60;
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: screenSize.height - heightFooter, width: screenSize.width, height: heightFooter))
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = ColorsMovs.PURPLE
        setupMoviesButton()
        setupFavoritesButton()
    }
    
    private func setupMoviesButton(){
        let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: heightFooter))
        
        let icon = UIImageView(image: UIImage(named: "ios-film-purple-extra-light"))
        icon.frame = CGRect(x: screenSize.width/4 - 13, y: 10, width: 26, height: 26)
        
        let label = UILabel(frame: CGRect(x: 0, y: 36, width: screenSize.width/2, height: 20))
        label.font = UIFont(name: FontMovs.DOSIS_MEDIUM, size: 14)
        label.textColor = ColorsMovs.PURPLE_ULTRA_LIGHT
        label.textAlignment = NSTextAlignment.center
        label.text = "Movies"
        
        buttonView.addSubview(icon)
        buttonView.addSubview(label)
        addSubview(buttonView)
    }

    private func setupFavoritesButton(){
        let buttonView = UIView(frame: CGRect(x: screenSize.width/2, y: 0, width: screenSize.width/2, height: heightFooter))
        
        let icon = UIImageView(image: UIImage(named: "ios-heart-empty-purple-light"))
        icon.frame = CGRect(x: screenSize.width/4 - 13, y: 10, width: 26, height: 26)
        
        let label = UILabel(frame: CGRect(x: 0, y: 36, width: screenSize.width/2, height: 20))
        label.font = UIFont(name: FontMovs.DOSIS_MEDIUM, size: 14)
        label.textColor = ColorsMovs.PURPLE_ULTRA_LIGHT
        label.textAlignment = NSTextAlignment.center
        label.text = "Favorites"
        
        buttonView.addSubview(icon)
        buttonView.addSubview(label)
        
        buttonView.isUserInteractionEnabled = true;
        buttonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.selectFavorites)))
        
        addSubview(buttonView)
    }
    
    @objc func selectFavorites(sender:UITapGestureRecognizer){
       print(sender.view)
    }
}
