

import UIKit
import SnapKit

class MainTabBarViewController: UITabBarController {
    
    
//    private let imageView:UIImageView = {
//       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
//        imageView.image = UIImage(named: "dmr")
//        return imageView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        view.addSubview(imageView)
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: LoginViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "person.fill")
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Login"

        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3], animated: true)

        
        
        
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        imageView.center = view.center
//    }

    

}

