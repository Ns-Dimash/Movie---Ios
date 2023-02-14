//
//  HeaderCarouselView.swift
//  project2
//
//  Created by Dimash Nsanbaev on 11/11/22.
//

import UIKit
import SnapKit

class HeaderCarouselView: UIView {
    


    private let heroImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "joker")
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.addSubview(heroImageView)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = self.bounds
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
