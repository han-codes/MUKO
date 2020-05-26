//
//  GlobalProgressHUD.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation
import MBProgressHUD

class GlobalProgressHUD {
    
    // MARK: - Properties
    
    static private var hudCount: Int = 0
    
    static private let window: UIWindow = {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window else {
            fatalError("Failed to find delegate window")
        }
        
        return window
    }()
    
    static private let hud: MBProgressHUD = {
        
        let globalHUD = MBProgressHUD(view: window)
        
        return globalHUD
    }()
    
    // MARK: - Show & Hide
    
    static func show(loadingText: String? = nil) {
        
        window.addSubview(hud)
        
        hudCount += 1
        hud.label.text = loadingText
        hud.show(animated: true)
    }
    
    static func hide(all: Bool = false) {
        guard hudCount > 0 else { return }
        
        hudCount -= 1
        if all || hudCount == 0 {
            hud.hide(animated: true)
        }
    }
}

