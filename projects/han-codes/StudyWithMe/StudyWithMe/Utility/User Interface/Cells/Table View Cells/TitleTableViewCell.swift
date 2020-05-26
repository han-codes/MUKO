//
//  TitleTableViewCell.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit
import Reusable

class TitleTableViewCell: UITableViewCell, NibReusable {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setUpUI()
    }
    
    // MARK: - Setup
    
    private func setUpUI() {
        
        selectionStyle = .none
    }
    
    func load(string: String) {
        
        titleLabel.text = string
    }
}
