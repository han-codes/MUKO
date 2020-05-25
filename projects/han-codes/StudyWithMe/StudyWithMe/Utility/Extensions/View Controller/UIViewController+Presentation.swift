//
//  UIViewController+Presentation.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentOverCurrentContext(_ viewController: UIViewController, animated: Bool, completion: (() -> Swift.Void)? = nil) {
        
        viewController.providesPresentationContextTransitionStyle = true
        viewController.definesPresentationContext = true
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        
        present(
            viewController,
            animated: animated,
            completion: completion
        )
    }
}
