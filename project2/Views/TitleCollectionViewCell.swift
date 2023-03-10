//
//  TitleCollectionViewCell.swift
//  project2
//
//  Created by Dimash Nsanbaev on 11/27/22.
//


import UIKit
import SDWebImage
import SnapKit


class TitleCollectionViewCell: UICollectionViewCell {
    
       static let identifier = "TitleCollectionViewCell"
       
       private let posterImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           return imageView
       }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           contentView.addSubview(posterImageView)
           
       }
       
       required init?(coder: NSCoder) {
           fatalError()
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           posterImageView.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }
       }
       
       
       public func configure(with model: String) {
           
           guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
               return
           }

           posterImageView.sd_setImage(with: url, completed: nil)
       }
       
   }
    

