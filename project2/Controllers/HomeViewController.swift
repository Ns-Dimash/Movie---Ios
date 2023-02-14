//
//  HomeViewController.swift
//  project2
//
//  Created by Dimash Nsanbaev on 11/10/22.
//

import UIKit
import SnapKit

enum Sections:Int{
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4

}

class HomeViewController: UIViewController {
    
    let sectionTitles:[String] = ["Populair","Trending TV","Popular","Upcoming Movies","Top Rated"]
     
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .systemBackground
        let headerView = HeaderWithCarousel(frame: CGRect(x: 0, y: 0, width:0, height: 300))
        table.tableHeaderView = headerView
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.register(CollectionViewTableViewCell.self,forCellReuseIdentifier:CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        navigationItem.title = "Movie"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        setupViews()
        setupConstraints()
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    
}

// MARK: - TableView

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                    return UITableViewCell()
                }
        cell.delegate = self

                

                switch indexPath.section {
                case Sections.TrendingMovies.rawValue:
                    APICaller.shared.getTrendingMovies { result in
                        switch result {
                            
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                    
                    
                case Sections.TrendingTv.rawValue:
                    APICaller.shared.getTrendingTvs { result in
                        switch result {
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                case Sections.Popular.rawValue:
                    APICaller.shared.getPopularMovies{ result in
                        switch result {
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                case Sections.Upcoming.rawValue:
                    
                    APICaller.shared.getUpcomingMovies { result in
                        switch result {
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                case Sections.TopRated.rawValue:
                    APICaller.shared.getTopRated { result in
                        switch result {
                        case .success(let titles):
                            cell.configure(with: titles)
                        case .failure(let error):
                            print(error)
                        }
                    }
                default:
                    return UITableViewCell()

                }
                
                return cell
            }
            
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        header.textLabel?.font = UIFont(name: "Futura Bold", size: 13)
        header.textLabel?.textColor = .label
    }
}


extension HomeViewController:iCarouselDataSource{
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
         let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
}
// MARK: - Setup Views and Constraints

private extension HomeViewController {
    
    func setupViews() {
        view.addSubview(homeFeedTable)
    }
    
    func setupConstraints() {
        homeFeedTable.snp.makeConstraints {
            make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}


extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
