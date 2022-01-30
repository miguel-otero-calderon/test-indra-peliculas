//
//  TabBarViewController.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import UIKit

/// Primary tab controller for core app UI
final class TabBarViewController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpControllers()
    }

    /// Sets up tab bar controllers
    private func setUpControllers() {
        guard let email = UserDefaults.standard.string(forKey: "email"),
              let username = UserDefaults.standard.string(forKey: "username") else {
            return
        }

        let currentUser = LoginEntity(
            username: username,
            email: email,
            password: ""
        )

        // Define VCs
        
        let movie = (MovieWireFrame.createMovieModule() as? MovieView)!
        let search = (SearchWireFrame.createSearchModule() as? SearchView)!
        let profile = (ProfileWireFrame.createProfileModule() as? ProfileView)!
        
        let nav1 = UINavigationController(rootViewController: movie)
        let nav2 = UINavigationController(rootViewController: search)
        let nav3 = UINavigationController(rootViewController: profile)

        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label

        if #available(iOS 15.0, *) {
            movie.navigationItem.backButtonDisplayMode = .minimal
            search.navigationItem.backButtonDisplayMode = .minimal
            profile.navigationItem.backButtonDisplayMode = .minimal
        } else {
            nav1.navigationItem.backButtonTitle = ""
            nav2.navigationItem.backButtonTitle = ""
            nav3.navigationItem.backButtonTitle = ""
        }

        // Define tab items
        nav1.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "Movies"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "Search"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)

        // Set controllers
        self.setViewControllers(
            [nav1, nav2, nav3],
            animated: false
        )
    }
}
