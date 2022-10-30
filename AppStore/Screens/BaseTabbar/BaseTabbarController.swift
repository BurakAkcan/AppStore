//
//  BaseTabbarController.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

final class BaseTabbarController: UITabBarController {
    
    private let homeNav = UINavigationController(rootViewController: TodayVC())
    private let appsNav = UINavigationController(rootViewController: AppsVC())
    private let searchNav = UINavigationController(rootViewController: SearchVC())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setTabbars()
    }
    
    private func setTabbars() {
        viewControllers = [
          createNavController(viewController: TodayVC(), imageName: "house", tabbarTitle: "Today"),
          createNavController(viewController: AppsVC(), imageName: "square.stack.3d.up.fill", tabbarTitle: "Apps"),
          createNavController(viewController: SearchVC(), imageName: "magnifyingglass", tabbarTitle: "Search"),
        ]
        
        //UICollectionViewController(collectionViewLayout: )
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray5
        
    }
    
    fileprivate func createNavController(viewController: UIViewController, imageName: String, tabbarTitle: String ) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.title = tabbarTitle
        return navController
    }
    
  }



//view.backgroundColor = .systemBackground
//
//let vc1 = UINavigationController(rootViewController: HomeVC())
//let vc2 = UINavigationController(rootViewController: UpComingVC())
//let vc3 = UINavigationController(rootViewController: SearchVC())
//let vc4 = UINavigationController(rootViewController: DownloadsVC())
//setViewControllers([vc1,vc2,vc3,vc4], animated: true)
//
//vc1.tabBarItem.image = UIImage(systemName: "house")
//vc2.tabBarItem.image = UIImage(systemName: "play.circle")
//vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
//tabBar.tintColor = .label
//
//vc1.title = "Home"
//vc2.title = "Coming Soon"
//vc3.title = "Search"
//vc4.title = "Downloads"


//        setViewControllers([homeNav,appsNav,searchNav], animated: true)
//        homeNav.tabBarItem.image = UIImage(systemName: "house")
//        appsNav.tabBarItem.image = UIImage(systemName: "square.stack.3d.up.fill")
//        searchNav.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        homeNav.title = "Home"
//
//        homeNav.tabBarItem.title = "Today"
//        appsNav.tabBarItem.title = "Apps"
//        searchNav.tabBarItem.title = "Search"
