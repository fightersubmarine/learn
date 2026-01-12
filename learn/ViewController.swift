//
//  ViewController.swift
//  learn
//
//  Created by Александр Соколов on 12.01.2026.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var button: UIButton = {
        let view = UIButton()
        
        view.setTitle("tap", for: .normal)
        view.backgroundColor = .purple
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(showController), for: .touchUpInside)
        
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        
        view.text = "some text"
        view.textAlignment = .center
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hi"
        view.backgroundColor = .white
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(button)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 50),
        ])
    }
    
    // MARK: - Action
    
    @objc
    func showController() {
        let viewController = SecondViewController()
        viewController.delegate = self
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Extension

extension ViewController: SecondViewControllerDelegate {
    
    func changeTitle(_ title: String) {
        label.text = title
    }
}

