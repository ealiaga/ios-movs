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

    var moviesGridView = MoviesGridView()
    var loadingMoviesView = LoadingMoviesView()
    var emptySearchView = EmptySearchView()
    var errorView = ErrorView()
    var emptyFavoritesView = EmptyFavoritesView()
    
    var searchBarView = SerachBarView()
    var footerView = FooterBarView()
    
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
        setupContentView()
        setupFooter()
    }
    
    private func setupHeader(){
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 60))
        headerView.backgroundColor = ColorsMovs.PURPLE
        
        headerView.addSubview(getTitle())
        
        addSubview(headerView)
    }
    
    private func getTitle() -> UILabel {
        let title: UILabel = UILabel(frame: CGRect(x:0, y:36, width: screenSize.width, height: 20))
        title.textColor = UIColor.white
        title.text = "Movies"
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont(name: FontMovs.DOSIS_SEMI_BOLD, size: 24)
        return title;
    }
    
    private func setupSearchBar(){
        searchBarView = SerachBarView(frame: screenSize)
        addSubview(searchBarView)
    }

    private func setupFooter(){
        footerView = FooterBarView(frame: screenSize)
        addSubview(footerView)
    }
    
    private func setupContentView(){
        let frame = CGRect(x: 0, y: 120, width: screenSize.width, height: screenSize.height - 180)
        
        self.moviesGridView = MoviesGridView(frame: frame)
        self.loadingMoviesView = LoadingMoviesView(frame: frame)
        self.emptyFavoritesView = EmptyFavoritesView(frame: frame)
        self.errorView = ErrorView(frame: frame)
        self.emptySearchView = EmptySearchView(frame: frame)
        
        addSubview(self.loadingMoviesView)
    }
    
    public func showLoadingMoviesView(){
        self.moviesGridView.removeFromSuperview()
        self.errorView.removeFromSuperview()
        self.emptySearchView.removeFromSuperview()
        self.emptyFavoritesView.removeFromSuperview()
        
        addSubview(self.loadingMoviesView)
    }
    
    public func showMovies(movies: [Movie]){
        self.footerView.selectMovies()
        
        self.loadingMoviesView.removeFromSuperview()
        self.errorView.removeFromSuperview()
        self.emptySearchView.removeFromSuperview()
        self.emptyFavoritesView.removeFromSuperview()
        
        self.moviesGridView.showMoviesVew(movies: movies)
        addSubview(self.moviesGridView)
    }
    
    public func showFavorites(){
        self.footerView.selectFavorites()
        self.showEmptyFavoritesView()
    }
    
    public func showErrorView(){
        self.moviesGridView.removeFromSuperview()
        self.loadingMoviesView.removeFromSuperview()
        self.emptySearchView.removeFromSuperview()
        self.emptyFavoritesView.removeFromSuperview()
        
        addSubview(self.errorView)
    }
    
    public func showEmptySearchView(){
        self.moviesGridView.removeFromSuperview()
        self.loadingMoviesView.removeFromSuperview()
        self.errorView.removeFromSuperview()
        self.emptyFavoritesView.removeFromSuperview()
        
        addSubview(self.emptySearchView)
    }
    
    public func showEmptyFavoritesView(){
        self.moviesGridView.removeFromSuperview()
        self.loadingMoviesView.removeFromSuperview()
        self.errorView.removeFromSuperview()
        self.emptySearchView.removeFromSuperview()
        
        addSubview(self.emptyFavoritesView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.endEditing(true)
    }
}
