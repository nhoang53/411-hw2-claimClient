//
//  ValueColumnGenerator.swift
//  ClaimClientService
//

import UIKit

class ValueColumnGenerator {
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        //stackView.alignment = .fill
        //
        var lbl = UITextField()
        lbl.text = "Claim Title"
        lbl.backgroundColor = UIColor.lightGray
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        lbl = UITextField()
        
        lbl.text = "Date"
        lbl.backgroundColor = UIColor.lightGray
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        lbl = UITextField()
        
        return stackView
    }
}

