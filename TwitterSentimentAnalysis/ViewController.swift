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
    }
    
    @IBAction func predictButtonPressed(_ sender: UIButton) {
        
        if let searchText = textField.text {
            swifter.searchTweet(using: searchText ,lang: "en", count: 100, success: { (results, metadata) in
                var tweets = [TweetSentimentClassifierInput]()
                
                for i in 0..<100 {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                do {
                    let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                    
                    var sentimentScore = 0
                    
                    for prediction in predictions {
                        let sentiment = prediction.label
                        
                        if sentiment == "Pos" {
                            sentimentScore += 1
                        }
                        else if sentiment == "Neg" {
                            sentimentScore -= 1
                        }
                    }
                    
                    if sentimentScore > 20 {
                        self.emojiLabel.text = "🥰"
                    } else if sentimentScore > 10 {
                        self.emojiLabel.text = "😀"
                    } else if sentimentScore > 0 {
                        self.emojiLabel.text = "😌"
                    } else if sentimentScore > -10 {
                        self.emojiLabel.text = "😐"
                    } else if sentimentScore > -20 {
                        self.emojiLabel.text = "😡"
                    } else {
                        self.emojiLabel.text = "🤬"
                    }
                } catch {
                    print("There was an error, \(error)")
                }
                
                
            }) { (error) in
                print("There was an error with the API request \(error)")
            }
            
        }
        
        
    }
    

}
