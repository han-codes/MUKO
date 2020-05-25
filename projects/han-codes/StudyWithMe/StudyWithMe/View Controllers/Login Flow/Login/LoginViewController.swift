//
//  LoginViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/22/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit

protocol LogInDelegate: class {
    
    func loggedIn()
}

class LoginViewController: BaseXibViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var invalidCredentialsLabel: UILabel!
    
    // MARK: - Properties
    
    let authenticationContainerViewController: AuthenticationContainerViewController
    weak var delegate: LogInDelegate?
    
    // MARK: - Initialization
    
    init(authenticationContainerViewController: AuthenticationContainerViewController) {
        
        self.authenticationContainerViewController = authenticationContainerViewController
        delegate = authenticationContainerViewController
        
        super.init()
        
        self.authenticationContainerViewController.buttonDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setUpUI()
    }
    
    // MARK: - Setup
    
    private func setUpUI() {
        
        setUpInvalidCredentialsLabel()
    }
    
    private func setUpInvalidCredentialsLabel() {
        
        invalidCredentialsLabel.isHidden = true
        invalidCredentialsLabel.text = Constants.Authentication.Login.Error.invalidCredsText
    }
}

// MARK: - AuthenticationButtonDelegate Callback

extension LoginViewController: AuthenticationButtonDelegate {
    
    func authenticationButtonPressed() {
        
        // TODO: Attempt to log user in
        // When successful, delegate?.loggedIn()
        presentNotYetImplementedAlert()
    }
}
