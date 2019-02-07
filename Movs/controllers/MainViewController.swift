//
//  MainViewController.swift
//  Movs
//
//  Created by Ever Aliaga on 2/4/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.themoviedb.org/3/movie/popular?api_key=1b5a305147a6d6b3238c5cdf7208abe8&language=en-US&page=1").responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = MainView(frame: UIScreen.main.bounds)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

