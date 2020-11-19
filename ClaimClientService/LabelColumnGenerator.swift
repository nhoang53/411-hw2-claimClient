//
//  LabelColumnGenerator.swift
//  ClaimClientService
//

import UIKit

class LabelColumnGeneartor {
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        //stackView.alignment = .fill
        //
        var lbl = UILabel()
        lbl.text = "Claim Title"
        lbl.backgroundColor = UIColor.yellow
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        
        lbl = UILabel()
        lbl.text = "Date"
        lbl.backgroundColor = UIColor.yellow
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        
        return stackView
    }
}

