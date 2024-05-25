//
//  NewViewController.swift
//  valiaApp
//
//  Created by Valia Smolin on 21.05.2024.
//

import Foundation
import UIKit

class NewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            
        
        self.navigationItem.title = "Profile"
        
    }
    
    @objc func goToProfile() {
        tabBarController?.selectedIndex = 1
    }
}
