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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second"
        view.backgroundColor = .purple
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            delegate?.changeTitle("<3")
        }
    }
}
