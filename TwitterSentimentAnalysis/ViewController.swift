//
//  ViewController.swift
//  TwitterSentimentAnalysis
//
//  Created by Harman Singh on 04/09/20.
//  Copyright © 2020 Harman Singh. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emojiLabel: UILabel!
    
    let swifter = Swifter(consumerKey: "3VfvsXJhphwfnhZPQUq7fj96B", consumerSecret: "xmHviANxHdByzJbGrIYdeWXPZLE1xYQdGGxSaquo9q02vrhMJG")
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swifter.searchTweet(using: "@Apple",lang: "en", count: 100, success: { (results, metadata) in
            print(results)
        }) { (error) in
            print("There was an error with the API request \(error)")
        }
        
//        swifter.searchTweet(using: <#T##String#>, geocode: <#T##String?#>, lang: <#T##String?#>, locale: <#T##String?#>, resultType: <#T##String?#>, count: <#T##Int?#>, until: <#T##String?#>, sinceID: <#T##String?#>, maxID: <#T##String?#>, includeEntities: <#T##Bool?#>, callback: <#T##String?#>, success: <#T##((JSON, JSON) -> Void)?##((JSON, JSON) -> Void)?##(JSON, JSON) -> Void#>, failure: <#T##Swifter.FailureHandler##Swifter.FailureHandler##(Error) -> Void#>)
    }

    @IBAction func predictButtonPressed(_ sender: UIButton) {
    }
    

}

