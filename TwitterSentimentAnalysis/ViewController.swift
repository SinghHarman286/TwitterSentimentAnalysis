//
//  ViewController.swift
//  TwitterSentimentAnalysis
//
//  Created by Harman Singh on 04/09/20.
//  Copyright © 2020 Harman Singh. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emojiLabel: UILabel!
    
    
    let sentimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: "3VfvsXJhphwfnhZPQUq7fj96B", consumerSecret: "xmHviANxHdByzJbGrIYdeWXPZLE1xYQdGGxSaquo9q02vrhMJG")
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        swifter.searchTweet(using: "@Apple",lang: "en", count: 100, success: { (results, metadata) in
            var tweets = [String]()
            
            for i in 0..<100 {
                if let tweet = results[i]["full_text"].string {
                    print("MAN!! the tweet shoudld be \(tweet)")
                    tweets.append(tweet)
                }
            }
            
            print(tweets)
        }) { (error) in
            print("There was an error with the API request \(error)")
        }
        
    }
    
    @IBAction func predictButtonPressed(_ sender: UIButton) {
    }
    

}
