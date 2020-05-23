//
//  BaseXibViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/22/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation

class BaseXibViewController: BaseViewController {
    
    var xibName: String {
        
        return String(describing: type(of: self))
    }
    
    init() {
        
        super.init(nibName: String(describing: type(of: self)), bundle: .main)
    }
    
    init(nibName: String) {
        
        super.init(nibName: nibName, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) { initWithCoderFatalError() }
}

func initWithCoderFatalError(file: StaticString = #file, line: UInt = #line) -> Never {
    
    fatalError("This class is not designed to be used in a Storyboard.", file: file, line: line)
}
