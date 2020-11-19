//
//  ViewController.swift
//  ClaimClientService

import UIKit

class ViewController: UIViewController {
    
    func refreshScreen(cObj : Claim) {
        vals[0].text = cObj.title
        vals[1].text = cObj.date
        vals[2].text = cObj.message
    }

    var lbls = [UILabel]()
    var vals = [UITextField]()
    var addBtn : UIButton!
    var cService : ClaimService!

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

