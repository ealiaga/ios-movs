//
//  MoviesGridView.swift
//  Movs
//
//  Created by Ever Aliaga on 2/8/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesGridView: UIScrollView {

    let screenSize = UIScreen.main.bounds;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.endEditing(true)
    }
    
    public func showMoviesVew(movies: [Movie]){
        self.subviews.forEach({ $0.removeFromSuperview() })
        
        var i = 0;
        for movie in movies {
            
            var frameImage: CGRect
            var frameLabel: CGRect
            
            if i % 2 == 0 {
                frameImage = getFrameImageLeft(index: i)
                frameLabel = getFrameLabelLeft(index: i)
            }
            else {
                frameImage = getFrameImageRight(index: i)
                frameLabel = getFrameLabelRight(index: i)
            }
            
            let imageURL = "\(API.imageBaseURL)\(movie.posterPath)"
            
            let imageView = UIImageView(frame: frameImage)
            imageView.backgroundColor = ColorsMovs.GRAY_LIGHT
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 9
            imageView.af_setImage(withURL: URL(string: imageURL)!)
            
            addSubview(imageView)
            
            let label = UILabel(frame: frameLabel)
            label.textColor = ColorsMovs.GRAY
            label.font = UIFont(name: FontMovs.DOSIS_MEDIUM, size: 16)
            label.text = movie.title
            addSubview(label)
            
            i = i + 1
        }
        
        super.contentSize = CGSize(width: screenSize.width, height: CGFloat(220 * ceil(CGFloat(movies.count)/2.0)))
    }
    
    private func getFrameImageLeft(index: Int) -> CGRect {
        let y = 20 + index/2 * 210;
        return CGRect(x: 25, y: y, width: Int(screenSize.width/2 - 40), height: 160)
    }
    
    private func getFrameImageRight(index: Int) -> CGRect {
        let y = 20 + index/2 * 210
        let x = 15 + screenSize.width/2
        return CGRect(x: Int(x), y: Int(y), width: Int(screenSize.width/2 - 40), height: 160)
    }
    
    private func getFrameLabelLeft(index: Int) -> CGRect {
        let y = 30 + index/2 * 210 + 160;
        return CGRect(x: 25, y: Int(y), width: Int(screenSize.width/2 - 40), height: 15)
    }
    
    private func getFrameLabelRight(index: Int) -> CGRect {
        let y = 30 + index/2 * 210 + 160;
        let x = 15 + screenSize.width/2
        return CGRect(x: Int(x), y: Int(y), width: Int(screenSize.width/2 - 40), height: 15)
    }
}
