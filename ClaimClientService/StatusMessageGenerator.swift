//
//  StatusMessageGenerator.swift
//  ClaimClientService

import UIKit

class StatusMessageGenerator {
    var lblName : String!
    
    init(n : String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 0
        
        let lbl = UILabel()
        lbl.text = lblName
        lbl.backgroundColor = UIColor.systemGreen
        lbl.textColor = UIColor.white
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        
        let val = UITextField()
        val.text = "<Click add button to add new Claim>"
        val.backgroundColor = UIColor.systemGreen
        val.textColor = UIColor.white
        stackView.addArrangedSubview(val)
        
        //lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        //val.setContentHuggingPriority(.defaultLow, for: .horizontal)
        //lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        //val.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return stackView
    }
}


