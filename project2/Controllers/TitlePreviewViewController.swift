//
//  TitlePreviewViewController.swift
//  project2
//
//  Created by Dimash Nsanbaev on 12/5/22.
//

import UIKit
import SnapKit
import Cosmos
import TinyConstraints

class TitlePreviewViewController: UIViewController {
    
    private var cosmosView: CosmosView = {
        var view = CosmosView()
        
        return view
    }()
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 100)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return collectionView
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "ph_2")
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let overviewLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let downloadButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        
        return button
    }()
    private let downloadButton1: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Warfare", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        
        return button
    }()
    private let downloadButton2: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fantacy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(cosmosView)
        view.addSubview(downloadButton)
        view.addSubview(downloadButton1)
        view.addSubview(downloadButton2)
        view.addSubview(collectionView)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "di", image: UIImage(systemName: "heart"), target: self, action: nil)

        configureConstraints()
        
    }
    
    
    func configureConstraints(){
        
        image.snp.makeConstraints { make in
            make.height.equalTo(250)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(120)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(40)
        }

       
        cosmosView.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.leading.equalToSuperview().inset(40)
            make.top.equalTo(overviewLabel.snp.bottom).offset(30)
            
        }
        downloadButton1.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.leading.equalToSuperview().inset(155)
            make.top.equalTo(overviewLabel.snp.bottom).offset(30)
            
        }
        downloadButton2.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.leading.equalToSuperview().inset(270)
            make.top.equalTo(overviewLabel.snp.bottom).offset(30)
            
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(downloadButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
        }
        
        
       
        
        
    }
    
    public func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
    }
    
}


extension TitlePreviewViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
}

