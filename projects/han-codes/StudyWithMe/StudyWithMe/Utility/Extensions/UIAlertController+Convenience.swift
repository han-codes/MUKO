//
//  UIAlertController+Convenience.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/21/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    convenience init(withTitle title: String = "",
                     message: String,
                     dimissButtonTitle: String = "OK",
                     cancelAction: CompletionHandler? = nil) {
        
        self.init(title: title, message: message, preferredStyle: .alert)
        
        addCancelAction(withTitle: dimissButtonTitle) {
            cancelAction?()
        }
    }
}

// MARK: - Actions
extension UIAlertController {
    
    func addAction(withTitle title: String?,
                   style: UIAlertAction.Style = .default,
                   completion: CompletionHandler? = nil) {
        
        addAction(UIAlertAction(title: title, style: style, handler: { _ in
            completion?()
        }))
    }
    
    func addTextField(withPlaceholder placeholder: String?) {
        
        addTextField { textField in
            textField.placeholder = placeholder
            textField.accessibilityIdentifier = placeholder
        }
    }
    
    func addCancelAction(withTitle title: String = "Cancel",
                         completion: CompletionHandler? = nil) {
        
        addAction(
            withTitle: title,
            style: .cancel,
            completion: completion
        )
    }
}
