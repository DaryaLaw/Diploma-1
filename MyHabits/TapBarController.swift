//
//  TapBarController.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class TapBarController: UITabBarController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = setViewControllers()
        self.tabBar.tintColor = .habitViolet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewControllers() -> [UIViewController] {
        let habitsController = HabitsViewController()
        habitsController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "rectangle.grid.1x2.fill"), selectedImage: UIImage(systemName: "rectangle.grid.1x2.fill"))
        let habitsNavigationController = UINavigationController(rootViewController: habitsController)
        let infoViewController = InfoViewController()
        infoViewController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), selectedImage: UIImage(systemName: "info.circle.fill"))
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)
        var controllers: [UIViewController] = []
        controllers.append(habitsNavigationController)
        controllers.append(infoNavigationController)
        return controllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
