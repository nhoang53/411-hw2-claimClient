//
//  detailViewController.swift
//  ClaimClientService
//
// Joseph Hoang

import UIKit

// edit main.storyboard to load Custom class = this class

class DetailViewController : ViewController {

    override func refreshScreen(cObj: Claim) {
//        var newcObj : Claim
//        newcObj = cObj
//        newcObj.message = "Something wrong. Please try again"
        
        detailScreenGenerator.vals[1].text = ""
        detailScreenGenerator.vals[2].text = ""
        
        if cObj.message == "Successfully add new Claim" {
            detailScreenGenerator.vals[4].text = "Claim(\(cObj.title)) added successfully"
            detailScreenGenerator.vals[4].textColor = UIColor.white
            detailScreenGenerator.vals[4].backgroundColor = UIColor.systemBlue
            detailScreenGenerator.lbls[4].backgroundColor = UIColor.systemBlue
            detailScreenGenerator.addBtn.backgroundColor = UIColor.systemBlue
        } else {
            detailScreenGenerator.vals[4].text = "Failed to created Claim(\(cObj.title))"
            detailScreenGenerator.vals[4].textColor = UIColor.white
            detailScreenGenerator.vals[4].backgroundColor = UIColor.systemRed
            detailScreenGenerator.lbls[4].backgroundColor = UIColor.systemRed
            detailScreenGenerator.addBtn.backgroundColor = UIColor.systemRed
            detailScreenGenerator.addBtn.layer.borderColor = UIColor.systemRed.cgColor
        }
        
        // Enable/Disable the button
//        detailScreenGenerator.addBtn.isEnabled = !cService.isLastEntry()
        // Change the brightness if needed
        if detailScreenGenerator.addBtn.isEnabled {
            detailScreenGenerator.addBtn.backgroundColor = detailScreenGenerator.addBtn.backgroundColor?.withAlphaComponent(1.0)
        } else {
            detailScreenGenerator.addBtn.backgroundColor = detailScreenGenerator.addBtn.backgroundColor?.withAlphaComponent(0.3)
        }
    }

    var detailScreenGenerator : ClaimDetailScreenGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create screen
        detailScreenGenerator = ClaimDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        // 2. Prepare data
        cService = ClaimService(vc : self)
//        cService.getAll()
        
        // 3. Set the event handling
//        print("vals count: \(detailScreenGenerator.vals.count)")
        
        let nBtn = detailScreenGenerator.addBtn
        nBtn?.addTarget(self, action: #selector(goAddClaim(sender:)), for: .touchUpInside)
    }
    
    @objc func goAddClaim(sender: UIButton) {
        var newClaim = Claim()
        newClaim.title = detailScreenGenerator.vals[1].text!
        newClaim.date = detailScreenGenerator.vals[2].text!
        cService.addClaim(cObj: newClaim)
        
    }
}

