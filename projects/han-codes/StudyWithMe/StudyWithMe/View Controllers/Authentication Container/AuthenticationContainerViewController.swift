//
//  AuthenticationContainerViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/21/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit
import SwiftyAttributes

protocol AuthenticationDelegate: class {
    
    func authentication(from controller: UIViewController)
}

protocol AuthenticationButtonDelegate: class {
    
    func authenticationButtonPressed()
}

class AuthenticationContainerViewController: BaseViewController, LogInDelegate {
    
    // MARK: - Auth State
    
    enum AuthenticationState {
        
        case signUp
        case login
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var childContainerView: UIView!
    @IBOutlet weak var continueAsGuestButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var signInSignUpButton: UIButton!
    
    // MARK: - Properties
    
    weak var delegate: AuthenticationDelegate?
    weak var buttonDelegate: AuthenticationButtonDelegate?
    
    var currentState: AuthenticationState {
        didSet {
            load(state: currentState)
        }
    }
    
    // MARK: - Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        self.currentState = UserDefaults.hasLoggedIn ? .login : .signUp
        
        super.init(nibName: nibNameOrNil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                        
        registerKeyboardNotifications()
        load(state: currentState)
    }
    
    // MARK: - State Handling
    
    private func load(state: AuthenticationState) {
        
        removeAllChildren()
        
        switch state {
            
        case .login:
            loadLogin()
        case .signUp:
            loadSignUp()
        }
    }
    
    private func loadLogin() {
        // TODO: - Login Screen Setup
        transition(to: LoginViewController(authenticationContainerViewController: self))
    }
    
    private func loadSignUp() {
        // TODO: - Sign Up Screen Setup
        presentNotYetImplementedAlert()
    }
    
    private func setUpSignInSignUpButton(for state: AuthenticationState) {
        
        let questionText = state == .signUp ? "Already have an account?" : "Not Registered?"
        let buttonText = "SIGN \(state == .signUp ? "IN" : "UP")"
                
        let attributedRegisteredString = "\(questionText) ".withAttributes([
            .textColor(.gray)
        ])
        
        // TODO: Use custom theme color
        
        attributedRegisteredString.append(buttonText.withAttribute(.textColor(.blue)))
        
        signInSignUpButton.setAttributedTitle(attributedRegisteredString, for: .normal)
    }
    
    private func setUpSubmitButton(for state: AuthenticationState) {
        
        switch state {
            
        case .login:
            submitButton.setTitle(Constants.Authentication.Login.submitButtonText, for: .normal)
        case .signUp:
            submitButton.setTitle(Constants.Authentication.Registration.submitButtonText, for: .normal)
        }
    }
    
    // MARK: - LogInDelegate Callback
    
    func loggedIn() {
        
        // TODO: Save user that has logged in to keychain
        // Display next screen
        presentNotYetImplementedAlert()
    }
}

extension AuthenticationContainerViewController {
    
    private func transition(to viewController: UIViewController) {
        
        func changeViewAlpha(to alpha: CGFloat) {
            
            viewController.view.alpha = alpha
            submitButton.titleLabel?.alpha = alpha
            signInSignUpButton.titleLabel?.alpha = alpha
        }
        
        changeViewAlpha(to: 0)
        
        addChild(viewController, to: childContainerView)
        setUpSignInSignUpButton(for: currentState)
        setUpSubmitButton(for: currentState)
        
        UIView.animate(withDuration: 0.4) {
            
            changeViewAlpha(to: 1)
        }
    }
    
    @IBAction func signInSignUpButtonPressed(_ sender: Any) {
        
        switch currentState {
            
        case .signUp:
            currentState = .login
        case .login:
            currentState = .signUp
        }
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        buttonDelegate?.authenticationButtonPressed()
    }
}
