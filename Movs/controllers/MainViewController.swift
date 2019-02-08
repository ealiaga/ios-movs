//
//  MainViewController.swift
//  Movs
//
//  Created by Ever Aliaga on 2/4/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    let mainView = MainView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onDidReceiveData(_:)),
                                               name: NSNotification.Name("SUCCESS_MOVIES"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onDidNotReceiveData(_:)),
                                               name: NSNotification.Name("ERROR_MOVIES"),
                                               object: nil)
    }
    
    override func loadView() {
        super.loadView()

        self.mainView
            .footerView
            .buttonMovies
            .addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.selectMovies)))
        
        self.mainView
            .footerView
            .buttonFavorites
            .addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.selectFavorites)))
        
        self.mainView
            .searchBarView
            .seachtTextFiled
            .addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        self.view = self.mainView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    private func showMovies(){
        let movies = PersistenceManager.shared.getMovies()
        mainView.showMovies(movies: movies)
    }
    
    private func searchMovies(title: String){
        let movies = PersistenceManager.shared.searchMovieByTilte(title: title)
        if movies.count > 0 {
            mainView.showMovies(movies: movies)
        }
        else {
            mainView.showEmptySearchView()
        }
    }
    
    @objc func onDidReceiveData(_ notification: Notification)
    {
        showMovies()
    }
    
    @objc func onDidNotReceiveData(_ notification: Notification)
    {
        mainView.showErrorView()
    }
    
    @objc func selectFavorites(sender:UITapGestureRecognizer){
        mainView.showFavorites()
    }
    
    @objc func selectMovies(sender:UITapGestureRecognizer){
        showMovies()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        mainView.showLoadingMoviesView()
        
        let text = textField.text!
        if text.count == 0 {
            showMovies()
        }
        else{
            searchMovies(title: text)
        }
    
    }
}

