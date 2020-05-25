//
//  RegistrationViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/24/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseXibViewController, AuthenticationButtonDelegate {

    // MARK: - Outlets
    
    // MARK: - Properties
    
    var authenticationContainerViewController: AuthenticationContainerViewController
    
    // MARK: - Initializer
    
    init(authenticationContainerViewController: AuthenticationContainerViewController) {
        
        self.authenticationContainerViewController = authenticationContainerViewController
        
        super.init()
        
        self.authenticationContainerViewController.buttonDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    // MARK: - Actions
    
    func authenticationButtonPressed() {
        // TODO: Attempt to create a user
    }
}
