//
//  MainViewController.swift
//  ApiApp
//
//  Created by Nam Pham on 19/01/2023.
//

import UIKit

/// Controller to house tabs and root tabs
final class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    
    private func setUpTabs(){
        
        let charactersVC = CharacterViewController()
        let EpisodeVC = EpisodeViewController()
        let SettingVC = SettingViewController()
        let LocationVC = LocationViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        EpisodeVC.navigationItem.largeTitleDisplayMode = .automatic
        SettingVC.navigationItem.largeTitleDisplayMode = .automatic
        LocationVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: EpisodeVC)
        let nav3 = UINavigationController(rootViewController: SettingVC)
        let nav4 = UINavigationController(rootViewController: LocationVC)
       
        
        nav1.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 4)
        nav4.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"), tag: 3)
        
        for nav in [nav1,nav2,nav3,nav4]{
            nav.navigationBar.prefersLargeTitles
            = true
        }
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
    }
    

}
