//
//  ViewController.swift
//  valiaApp
//
//  Created by Valia Smolin on 21.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad() == UIViewController.viewDidLoad(self)
        setLabel()
        setupButton()
//        setupImageView()
//        setupNewView()
        
        self.navigationItem.title = "Home"
    }
    
    private var label = UILabel()
    
    func setLabel() {
        label.text = "Hello"
        label.backgroundColor = .green
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupButton() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private var newView: UIView = {
        let newView = UIView()
        newView.backgroundColor = .red
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }()
    
    private func setupNewView() {
        view.addSubview(newView)
        
        NSLayoutConstraint.activate([
            newView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            newView.widthAnchor.constraint(equalToConstant: 300),
            newView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func goToHome() {
        tabBarController?.selectedIndex = 0
    }
    
    func presentController() {
        let newViewController = NewViewController()
        present(newViewController, animated: true, completion: nil)
    }
    
    func addChildController() {
        let newViewController = NewViewController()
        addChild(newViewController)
        view.addSubview(newViewController.view)
    }
}
