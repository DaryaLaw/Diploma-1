//
//  LaunchScreenViewController.swift
//  MyHabits
//
//  Created by Darya on 14.09.2022.
//

import Foundation
import UIKit

class LaunchScreenViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view = LaunchScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
