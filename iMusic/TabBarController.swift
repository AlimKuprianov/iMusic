//
//  TabBarController.swift
//  iMusic
//
//  Created by Алим Куприянов on 07.08.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.9230089188, green: 0.2888513207, blue: 0.376057148, alpha: 1)
        
        
        viewControllers = [
            createVC(rootViewController: SearchMusicViewController(), image: #imageLiteral(resourceName: "ios10-apple-music-search-5nav-icon"), title: "Search"),
            createVC(rootViewController: ViewController(), image: #imageLiteral(resourceName: "ios10-apple-music-library-5nav-icon"), title: "Library")
        ]
    }
    
    
    private func createVC(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        return navigationVC
    }
    
}
