//
//  MainViewController.swift
//  Movs
//
//  Created by Ever Aliaga on 2/4/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = MainView(frame: UIScreen.main.bounds)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

