//
//  TestButton.swift
//  essence
//
//  Created by martin chibwe on 3/20/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class TestButton: UIViewController ,UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//    @IBOutlet weak var testButtonDirection: UIButton!

    @IBAction func testButtonDirection(sender: AnyObject) {
        
        let left = UISwipeGestureRecognizer(target: self, action: "handleS:")
        
        
        
//        func handelG(Gest:)
//
//        if(sender.direction == .Left){
//            print("left")
//        }
    }
    
    func handleS(send: UISwipeGestureRecognizer){
        if send.direction == .Left {
            print("Left")
        }
    }

}


//extension TestButton: UIGestureRecognizerDelegate{
//    
//   
//    
//    func handleSwipes(sender:UISwipeGestureRecognizer) {
//        
//        if(sender.direction == .Left){
//            print("Left ")
//        }
//        if(sender.direction == .Right){
//            print("Right ")
//        }
//        
//        
//    }
//    
//    
//    
//
//}
