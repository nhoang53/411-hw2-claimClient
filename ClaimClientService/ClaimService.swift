//
//  ClaimService.swift
//  ClaimClientService
//

import Foundation

struct Claim : Codable {
    var title : String
    var date : String
    var message : String
    
    init() {
        title = ""
        date = ""
        message = "<Status Message>"
    }
}

class ClaimService {

    init(vc : ViewController) {
        viewController = vc
    }
    
    var viewController : ViewController
    var claimList : [Claim] = [Claim]()
    var currentIndex : Int = 0
    var cObj = Claim()

//    func getNext() -> Claim {
//        currentIndex = currentIndex + 1
//        return claimList[currentIndex]
//    }
//
//    func isLastEntry() -> Bool {
//        if currentIndex == claimList.count - 1 {
//            return true
//        } else {
//            return false
//        }
//
//    }
    
    // archive callback
    func addClaim(cObj : Claim) {
        var newClaim = Claim()
        newClaim = cObj
        
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(newClaim)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is: \(respStr!)")
                
                newClaim.message = "Successfully add new Claim"
                print("reset Claim: \(newClaim)")
                // get out of task
                OperationQueue.main.addOperation {
                    self.viewController.refreshScreen(cObj: newClaim)
                }
            }
            else if let respError = error {
                print("Server Error : \(respError)")
                newClaim.message = "Server Error, cannot add new Claim"
                // get out of task
                OperationQueue.main.addOperation {
                    self.viewController.refreshScreen(cObj: newClaim)
                }
            }
        }
        task.resume()
    }
    
//    func getAll() {
//        //var ClaimList = [Claim]()
//        print("About to send HTTP request to server")
//        let requestUrl = "http://localhost:8020/ClaimService/getAll"
//        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
//        let task = URLSession.shared.dataTask(with: request){
//            (data, response, error) in
//            if let respData = data {
//                // data is of Data type
//                //et respStr = String(data: respData, encoding: .utf8)
//                //print("The response data is \(respStr!)")
//                self.claimList = try! JSONDecoder().decode([Claim].self, from: respData)
//                print("The Claim List : \(self.claimList)")
//                //
//                OperationQueue.main.addOperation {
//                    self.viewController.refreshScreen(cObj: self.claimList[self.currentIndex])
//                }
//            }
//        }
//        task.resume()
//    }
}
