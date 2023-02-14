//
//  HeaderCarouselView.swift
//  project2
//
//  Created by Dimash Nsanbaev on 11/11/22.
//

import UIKit
import SnapKit

class HeaderWithCarousel: UIView {
    
    
    let myCarousel:iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.autoscroll = -0.1
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myCarousel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeaderWithCarousel:iCarouselDataSource{
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
         let view = UIView(frame: CGRect(x: 0, y: 200, width: 205, height: 300))
        view.backgroundColor = .red
        
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ph_\(index+1)")
        imageView.layer.borderColor = CGColor(gray: 1, alpha: 1)
        imageView.layer.borderWidth = 1
        return view
    }
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
}
