//
//  ViewController.swift
//  ClaimClientService

import UIKit

class ViewController: UIViewController {
    
    func refreshScreen(cObj : Claim) {
//        vals[0].text = cObj.title
//        vals[1].text = cObj.date
//        vals[2].text = cObj.message
        
        if cObj.message == "Successfully add new Claim" {
            claimTextField.text = ""
            claimTextField.layer.borderWidth = 2
            claimTextField.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1.0).cgColor
            
            dateTextField.text = ""
            dateTextField.layer.borderWidth = 2
            dateTextField.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1.0).cgColor
            
            statusClaimLable.text = cObj.message
            statusClaimLable.textColor = UIColor.white
            statusClaimLable.backgroundColor = UIColor.systemBlue
        } else {
            claimTextField.text = ""
            claimTextField.layer.borderWidth = 2
            claimTextField.layer.borderColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0).cgColor
            
            dateTextField.text = ""
            dateTextField.layer.borderWidth = 2
            dateTextField.layer.borderColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0).cgColor
            
            statusClaimLable.text = cObj.message
            statusClaimLable.textColor = UIColor.white
            statusClaimLable.backgroundColor = UIColor.systemRed
        }
    }

    var lbls = [UILabel]()
    var vals = [UITextField]()
    var addBtn : UIButton!
    var cService : ClaimService!    // need this for DetailViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. Prepare data
//        cService = ClaimService(vc : self)
//        cService.getAll()
        
    }
    
//    var cService = ClaimService(vc : ViewController)
    
    @IBOutlet weak var claimTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var statusClaimLable: UILabel!
    
    
    @IBAction func resetClaim(_ sender: UITextField) {
        claimTextField.text = ""
    }
    
    @IBAction func resetDate(_ sender: UITextField) {
        dateTextField.text = ""
    }
    
    @IBAction func addClaim(_ sender: UIButton) {
        if (claimTextField.text != "" || dateTextField.text != "") {
            var newClaim = Claim()
            newClaim.title = claimTextField.text!
            newClaim.date = dateTextField.text!
            
            cService = ClaimService(vc : self)  // initial
            cService.addClaim(cObj: newClaim)
//            statusClaimLable.text = "Good"
        } else {
            var failClaim = Claim()
            failClaim.message = "Fail to create new Claim"
            refreshScreen(cObj: failClaim)
        }
        
    }
    
    //    @objc func goNextClaim(sender: UIButton) {
//        //
//        refreshScreen(cObj: cService.getNext())
////        refreshScreen(cObj: cService.add())
//
//    }
//    
//    @objc func goAddClaim(sender: UIButton) {
//        //
////        var detailScreen : ClaimDetailScreenGenerator!
////        var newTitle : String? = detailScreen.vals[0].text
////        var newDate : String? = detailScreen.vals[1].text
////        print("Title 2: \(newTitle)")
////        print("Date 2: \(newDate)")
//
////        var newTitle = vals[0].text
////        var newDate = vals[1].text
////        print("Title: " + newTitle!)
////        print("Date: " + newDate!)
//
//        print(vals.count)
//        print(sender)
//
//
//
////        let newTitle : String = "new title"
////        let newDate : String = "11/16/2020"
////        print(newTitle)
////        print(newDate)
////        cService.cObj.title = newTitle
////        cService.cObj.date = newDate
////        refreshScreen(cObj: cService.getNext())
////        refreshScreen(cObj: cService.add(newTitle: newTitle, newDate: newDate))
//        refreshScreen(cObj: cService.add())
//
//    }
        
}

