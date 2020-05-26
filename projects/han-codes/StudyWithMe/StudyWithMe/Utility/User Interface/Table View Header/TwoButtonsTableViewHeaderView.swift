//
//  TwoButtonsTableViewHeaderView.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/26/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit
import Reusable
import PureLayout

class TwoButtonsTableViewHeaderView: UITableViewHeaderFooterView, Reusable {

    // MARK: - Properties
    
    var stackView = UIStackView()
    var leadingLabel = UILabel()
    var trailingButton = UIButton()
    var leadingContainerView = UIView()
    var trailingContainerView = UIView()
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
                
        setUpLeadingContainerView()
        setUpTrailingContainerView()
        setUpStackView()
    }
    
    private func setUpLeadingContainerView() {
                
        
        leadingContainerView.addSubview(leadingLabel)
        
        leadingLabel.autoAlignAxis(.vertical, toSameAxisOf: leadingContainerView)
        leadingLabel.autoPinEdge(.leading, to: .leading, of: leadingContainerView, withOffset: 10)
    }
    
    private func setUpTrailingContainerView() {
        
        trailingButton.setTitle("Test2", for: .normal)
                
        trailingContainerView.addSubview(trailingButton)
        
        trailingButton.autoAlignAxis(.vertical, toSameAxisOf: trailingContainerView)
        trailingButton.autoPinEdge(.trailing, to: .trailing, of: trailingContainerView, withOffset: 10)
    }
    
    private func setUpStackView() {
        
        stackView.backgroundColor = .systemPink
        stackView = UIStackView(arrangedSubviews: [leadingContainerView, trailingContainerView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()
    }
    
    func load(leadingLabelText: String, trailingButtonTitle: String) {
        
        leadingLabel.text = leadingLabelText
        trailingButton.setTitle(trailingButtonTitle, for: .normal)
    }
}
