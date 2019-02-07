//
//  MainView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/4/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class MainView: UIView {

    let screenSize = UIScreen.main.bounds;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = ColorsMovs.WHITE
        setupHeader()
        setupSearchBar()
        setupFooter()
        setupContentView()
    }
    
    private func setupHeader(){
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 60))
        headerView.backgroundColor = ColorsMovs.PURPLE
        
        headerView.addSubview(getTitle())
        
        addSubview(headerView)
    }
    
    private func getTitle() -> UILabel {
        let title: UILabel = UILabel(frame: CGRect(x:0, y:30, width: screenSize.width, height: 20))
        title.textColor = UIColor.white
        title.text = "Movies"
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont(name: FontMovs.DOSIS_SEMI_BOLD, size: 24)
        return title;
    }
    
    private func setupSearchBar(){
        addSubview(SerachBarView(frame: screenSize))
    }

    private func setupFooter(){
        addSubview(FooterBarView(frame: screenSize))
    }
    
    private func setupContentView(){
        addSubview(LoadingMoviesView(frame: CGRect(x: 0, y: 120, width: screenSize.width, height: screenSize.height - 180)))
    }
}
