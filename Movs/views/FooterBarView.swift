//
//  FooterBarView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/5/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class FooterBarView: UIView {

    let screenSize = UIScreen.main.bounds
    let heightFooter:CGFloat = 60
    
    var iconMovies = UIImageView()
    var labelMovies = UILabel()
    var iconFavorites = UIImageView()
    var labelFavorites = UILabel()
    
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
        
        iconMovies = UIImageView(frame: CGRect(x: screenSize.width/4 - 13, y: 10, width: 26, height: 26))
        
        labelMovies = UILabel(frame: CGRect(x: 0, y: 36, width: screenSize.width/2, height: 20))
        labelMovies.font = UIFont(name: FontMovs.DOSIS_MEDIUM, size: 14)
        labelMovies.textColor = ColorsMovs.PURPLE_ULTRA_LIGHT
        labelMovies.textAlignment = NSTextAlignment.center
        labelMovies.text = "Movies"
        
        buttonView.addSubview(iconMovies)
        buttonView.addSubview(labelMovies)
        
        buttonView.isUserInteractionEnabled = true;
        buttonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.selectMovies)))
        setupMoviesActive()
        
        addSubview(buttonView)
    }

    private func setupFavoritesButton(){
        let buttonView = UIView(frame: CGRect(x: screenSize.width/2, y: 0, width: screenSize.width/2, height: heightFooter))
        
        iconFavorites = UIImageView(frame: CGRect(x: screenSize.width/4 - 13, y: 10, width: 26, height: 26))

        labelFavorites = UILabel(frame: CGRect(x: 0, y: 36, width: screenSize.width/2, height: 20))
        labelFavorites.font = UIFont(name: FontMovs.DOSIS_MEDIUM, size: 14)
        labelFavorites.textColor = ColorsMovs.PURPLE_ULTRA_LIGHT
        labelFavorites.textAlignment = NSTextAlignment.center
        labelFavorites.text = "Favorites"
        
        buttonView.addSubview(iconFavorites)
        buttonView.addSubview(labelFavorites)
        
        buttonView.isUserInteractionEnabled = true;
        buttonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.selectFavorites)))
        
        setupFavoritesInActive()
        
        addSubview(buttonView)
    }
    
    private func setupMoviesActive(){
        iconMovies.image = UIImage(named: "ios-film-white")
        labelMovies.textColor = UIColor.white
    }
    
    private func setupMoviesInActive(){
        iconMovies.image = UIImage(named: "ios-film-purple-extra-light")
        labelMovies.textColor = ColorsMovs.PURPLE_ULTRA_LIGHT
    }
    
    private func setupFavoritesActive(){
        iconFavorites.image = UIImage(named: "ios-heart-empty-white")
        labelFavorites.textColor = UIColor.white
    }
    
    private func setupFavoritesInActive(){
        iconFavorites.image = UIImage(named: "ios-heart-empty-purple-light")
        labelFavorites.textColor = ColorsMovs.PURPLE_ULTRA_LIGHT
    }
    
    @objc func selectMovies(sender:UITapGestureRecognizer){
        setupMoviesActive()
        setupFavoritesInActive()
    }
    
    @objc func selectFavorites(sender:UITapGestureRecognizer){
        setupFavoritesActive()
        setupMoviesInActive()
        
    }
}
