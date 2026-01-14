//
//  ViewController.swift
//  learn
//
//  Created by Александр Соколов on 12.01.2026.
//

import UIKit

final class ViewController: UIViewController {
    
    let model = Model()
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.spacing = 50
        view.axis = .vertical
        
        view.addArrangedSubview(button)
        view.addArrangedSubview(secondButton)
        view.addArrangedSubview(label)
        
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        
        view.setTitle("tap", for: .normal)
        view.backgroundColor = .purple
        
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(showController), for: .touchUpInside)
        
        return view
    }()
    
    private lazy var secondButton: UIButton = {
        let view = UIButton()
        
        view.setTitle("2tap", for: .normal)
        view.backgroundColor = .purple
        
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(chageSomething), for: .touchUpInside)
        
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
        
        model.delegate = self
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: - Action
    
    @objc
    private func showController() {
        let viewController = SecondViewController()
        viewController.delegate = self
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    private func chageSomething() {
        model.changeSomething("lv u")
    }
}

// MARK: - Extension

extension ViewController: SecondViewControllerDelegate {
    
    func changeTitle(_ title: String) {
        label.text = title
    }
}

extension ViewController: ModelDelegate {
    
    func didChangeSomething(_ some: Any) {
        guard let text = some as? String else { return }
        
        label.text = text
    }
}

