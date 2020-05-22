//
//  BaseViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/21/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class BaseViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    // MARK: - Keyboard
    
    func registerKeyboardNotifications() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboardByTappingOutside() {
        
        view.endEditing(true)
    }
    
    // MARK: - Alerts

    func presentAlert(withTitle title: String = "", message: String = "", cancelAction: CompletionHandler? = nil) {
        
        let alertController = UIAlertController(
            withTitle: title,
            message: message,
            cancelAction: cancelAction
        )
        present(alertController, animated: true)
    }
    
    @objc func presentNotYetImplementedAlert() {
        
        presentAlert(
            withTitle: "Not Yet Implemented",
            message: Constants.Alert.Miscellaneous.notYetImplementedMessage
        )
    }
}

// MARK: - Child View Controller Management

extension BaseViewController {
    
    func addChild(_ childVC: UIViewController, to containerView: UIView) {
        
        var isContainerViewInViewHierarchy = false
        
        if containerView === view {
            isContainerViewInViewHierarchy = true
        }
        else {
            var containerViewSuperview: UIView? = containerView
            
            while containerViewSuperview != nil && !isContainerViewInViewHierarchy {
                containerViewSuperview = containerViewSuperview?.superview
                isContainerViewInViewHierarchy = view === containerViewSuperview
            }
        }
        
        guard isContainerViewInViewHierarchy else {
            fatalError("Attempting to add \(type(of: childVC)) as a child view controller of \(type(of: self)) in a view that is not in \(type(of: self))'s view hierarchy.")
        }
        
        childVC.willMove(toParent: self)
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.autoPinEdgesToSuperviewEdges()
        childVC.didMove(toParent: self)
    }
    
    func removeChild(_ childVC: UIViewController) {
        
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    func removeAllChildren() {
        
        children.forEach {
            removeChild($0)
        }
    }
}

