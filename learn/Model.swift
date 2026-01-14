//
//  DelegateClass.swift
//  learn
//
//  Created by Александр Соколов on 13.01.2026.
//

protocol ModelDelegate: AnyObject {
    func didChangeSomething(_ some: Any)
}

final class Model {
    
    weak var delegate: ModelDelegate?
    
    func changeSomething(_ some: Any) {
        guard let text = some as? String else { return }
        
        delegate?.didChangeSomething(text)
    }
}
