//
//  SecondViewController.swift
//  learn
//
//  Created by Александр Соколов on 12.01.2026.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func changeTitle(_ title: String)
}

final class SecondViewController: UIViewController {
    
    // MARK: - Property
    
    weak var delegate: SecondViewControllerDelegate?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .purple
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            delegate?.changeTitle("<3")
        }
    }
}
