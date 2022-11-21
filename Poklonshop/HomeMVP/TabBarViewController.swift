//
//  TabBarViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .white
        
        configureTabBar()
    }
    
    
    private func configureTabBar() {
        let storyboardHome = UIStoryboard.init(name: "Home", bundle: nil)
        guard let vc = storyboardHome.instantiateViewController(withIdentifier: "HomeViewController" ) as? HomeViewController else {return}
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIcon"))
        
        let storyboardDraft = UIStoryboard.init(name: "Draft", bundle: nil)
        guard let vcDraft = storyboardDraft.instantiateViewController(withIdentifier: "DraftViewController" ) as? DraftViewController else {return}
        vcDraft.tabBarItem = UITabBarItem(title: "Draft", image: UIImage(named: "draftIcon"), selectedImage: UIImage(named: "draftIcon"))
        
        let storyboardCart = UIStoryboard.init(name: "Cart", bundle: nil)
        guard let vcCart = storyboardCart.instantiateViewController(withIdentifier: "CartViewController" ) as? CartViewController else {return}
        vcCart.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "cartIcon"), selectedImage: UIImage(named: "cartIcon"))
        
        let storyboardProfile = UIStoryboard.init(name: "Profile", bundle: nil)
        guard let vcProfile = storyboardProfile.instantiateViewController(withIdentifier: "ProfileViewController" ) as? ProfileViewController else {return}
        vcProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), selectedImage: UIImage(named: "profileIcon"))
        
        let viewControllerList = [vc, vcDraft,  vcCart, vcProfile]
        viewControllers = viewControllerList.map {
            UINavigationController(rootViewController: $0)
        }
        selectedIndex = 0
    }

}
