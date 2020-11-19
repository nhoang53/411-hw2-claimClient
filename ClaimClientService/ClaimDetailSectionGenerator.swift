//
//  ClaimDetailSectionGenerator.swift
//  ClaimClientService
//

import UIKit

class ClaimDetailSectionGenerator {
/*    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        let lGenerator = LabelColumnGeneartor()
        let lView = lGenerator.generate()
        stackView.addArrangedSubview(lView)
        let cGenerator = ValueColumnGenerator()
        let vView = cGenerator.generate()
        stackView.addArrangedSubview(vView)
        lView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        vView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }  */
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
//        stackView.spacing = UIStackView.spacingUseSystem
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        //
        
        var vGenerator : FieldValueViewGenerator!
        var sView : UIStackView!
        
        var introGenerator : IntroRowGenerator!
        introGenerator = IntroRowGenerator(n:"Intro")
        sView = introGenerator.generate()
        stackView.addArrangedSubview(sView)
        
        vGenerator = FieldValueViewGenerator(n:"Claim Title:")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        
        vGenerator = FieldValueViewGenerator(n:"Date:")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        return stackView
    }
}

class buttonSectionGenerator {
    
    func generate() -> UIStackView {
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 5
        bStackView.translatesAutoresizingMaskIntoConstraints = false
        bStackView.isLayoutMarginsRelativeArrangement = true
        bStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let btn = UIButton()
        btn.setTitle(" Add ", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.systemBlue.cgColor
//        btn.layer.backgroundColor = UIColor.systemGreen.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bStackView.addArrangedSubview(btn)

        return bStackView
    }
}

// display status message
class ClaimStatusMessageGenerator {
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        //
        var vGenerator : StatusMessageGenerator!
        var sView : UIStackView!
        
        vGenerator = StatusMessageGenerator(n:"Status: ")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        return stackView
    }
}

// display status message
class SpacingRowGenerator {
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        var vGenerator : EmptyRowGenerator!
        var sView : UIStackView!
        
        vGenerator = EmptyRowGenerator(n:"empty")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        return stackView
    }
}

// this class create screen
class ClaimDetailScreenGenerator {
    
    var root : UIView!
    var detailSecView : UIStackView!
    var buttonSecView : UIStackView!
    var vals : [UITextField]!   // text field for Title and Date
    var lbls : [UILabel]!
    var addBtn : UIButton!
    var introRow : UIStackView!
    var statusSecView : UIStackView!
    var spacingRow1 : UIStackView!
    var spacingRow2 : UIStackView!
    
    init(v : UIView) {
        root = v
//        root.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        root.insetsLayoutMarginsFromSafeArea = true
//        root.preservesSuperviewLayoutMargins = true
//        root.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)
    }

    func setViewReference() {
        vals = [UITextField]()
        lbls = [UILabel]()
        
        // title and date
        for sv in detailSecView.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        print("UITextField references created.")
        
        // Make UITextField readonly
        for v in vals {
            v.isUserInteractionEnabled = true
        }
        
        // add spacing row before add button
        for sv in spacingRow1.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    ve.isUserInteractionEnabled = false
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        
        // create button
        for sv in buttonSecView.arrangedSubviews {
            let btn = sv as! UIButton
            if btn.titleLabel?.text == " Add " {
                addBtn = btn
            }
            buttonSecView.spacing = 5
        }
        
        // create status message
        for sv in statusSecView.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    ve.isUserInteractionEnabled = false // read-only
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        
        // add spacing row after add button
        for sv in spacingRow2.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    ve.isUserInteractionEnabled = false // read-only
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
    }
    
    func setDetailSecConstraints() {
        for i in 0...lbls.count-5 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[0].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in 0...lbls.count-5 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[0].trailingAnchor)
            constr.isActive = true
        }
        //
        for i in 1...vals.count-5 {
            //vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
        detailSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = detailSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
        let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setSpacingRow1Constraints() {
        for i in lbls.count-5...lbls.count-4{
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[1].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in lbls.count-5...lbls.count-4 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[1].trailingAnchor)
            constr.isActive = true
        }

        spacingRow1.translatesAutoresizingMaskIntoConstraints = false
        let tCont = spacingRow1.topAnchor.constraint(equalTo: detailSecView.bottomAnchor)
        let lCont = spacingRow1.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = spacingRow1.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setButtonSecConstraints() {
        buttonSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = buttonSecView.topAnchor.constraint(equalTo: spacingRow1.bottomAnchor)
        let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tpConst.isActive = true
        trConst.isActive = true
    }
    
    func setSpacingRow2Constraints() {
        for i in lbls.count-4...lbls.count-3{
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[1].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in lbls.count-4...lbls.count-3 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[1].trailingAnchor)
            constr.isActive = true
        }

        spacingRow2.translatesAutoresizingMaskIntoConstraints = false
        let tCont = spacingRow2.topAnchor.constraint(equalTo: buttonSecView.bottomAnchor)
        let lCont = spacingRow2.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = spacingRow2.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setStatusMessageConstraints() {
        for i in lbls.count-3...lbls.count-2 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[1].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in lbls.count-3...lbls.count-2 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[1].trailingAnchor)
            constr.isActive = true
        }

        statusSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = statusSecView.topAnchor.constraint(equalTo: spacingRow2.bottomAnchor)
        let lCont = statusSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = statusSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    // this will
    func generate() {
        //
        detailSecView = ClaimDetailSectionGenerator().generate()
        print("Detail section was created. ")
        spacingRow1 = SpacingRowGenerator().generate()
        print("Spacing row 1 was created. ")
        buttonSecView = buttonSectionGenerator().generate()
        print("Button section was created. ")
        spacingRow2 = SpacingRowGenerator().generate()
        print("Spacing row 2 was created. ")
        statusSecView = ClaimStatusMessageGenerator().generate()
        print("Status message section was created. ")
        root.addSubview(detailSecView)
        root.addSubview(spacingRow1)
        root.addSubview(buttonSecView)
        root.addSubview(spacingRow2)
        root.addSubview(statusSecView)

        //
        setViewReference()
        print("setViewReference() called.")
        
        // set constraints for detailSecView
        setDetailSecConstraints()
        print("setDetailSecConstraints() called.")
        
        // set constraints for spacing row 1
        setSpacingRow1Constraints()
        print("setSpacingRow1Constraints() called.")
        
        // set constraints for buttonSecView
        setButtonSecConstraints()
        print("setButtonSecConstraints() called.")
        
        // set constraints for spacing row 2
        setSpacingRow2Constraints()
        print("setSpacingRow2Constraints() called.")
        
        setStatusMessageConstraints()
        print("setStatusMessageConstraints() called.")
    }
}

