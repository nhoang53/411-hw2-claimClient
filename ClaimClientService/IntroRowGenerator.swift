//
//  IntroRowGenerator.swift
//  ClaimClientService
//

import UIKit

class IntroRowGenerator {
    var lblName : String!
    
    init(n : String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        
        let lbl = UILabel()
        lbl.text = lblName
        lbl.textColor = UIColor.white
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        
        let val = UITextField()
        val.text = "Please Enter Claim Information"
//        val.backgroundColor = UIColor.lightGray
        val.textColor = UIColor.blue
        val.font = UIFont(name: "Aloha", size: 15)
        val.isUserInteractionEnabled = false
        stackView.addArrangedSubview(val)
        
        //lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        //val.setContentHuggingPriority(.defaultLow, for: .horizontal)
        //lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        //val.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return stackView
    }
}

