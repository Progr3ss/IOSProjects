//
//  MainIdeas.swift
//  essence
//
//  Created by martin chibwe on 3/7/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class MainIdeas: UIViewController {
    
    var counter = 10
    var timer = NSTimer()
    
    @IBOutlet weak var userAnswer: UITextField!
//    @IBOutlet weak var inputTF:MateralTextField!
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var time: UILabel!
     var mDataArray : NSMutableArray = []
     var mListIdeas : NSMutableArray = []
     var tempColorArray : NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        userAnswer.delegate = self
//        tableView.estimatedRowHeight = 55.0
//        tableView.rowHeight = UITableViewAutomaticDimension
        print("mData \(mDataArray)")

        // Do any additional setup after loading the view.
    }



    

}

extension MainIdeas: UITableViewDataSource
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! IdeaCell
        
        cell.userInputLabel.text = mDataArray[indexPath.row] as? String
        cell.userInputLabel.textColor = UIColor.whiteColor()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "handleSwipes:")
        cell.swipeButton.addGestureRecognizer(leftSwipe)
        cell.swipeButton.backgroundColor = UIColor.clearColor()
        cell.swipeButton.tag = indexPath.row
        cell.contentView.addSubview(cell.swipeButton)
        
        cell.imageColor.layer.cornerRadius = 2
        if (indexPath.row == mDataArray.count-1){
            cell.imageColor.backgroundColor = (tempColorArray[indexPath.row] as! UIColor)
        }
        
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("row \(mDataArray.count)")
        return mDataArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
}

//extension MainIdeas: UITableViewDelegate {
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        
//        
//    }
//}

extension MainIdeas: UIGestureRecognizerDelegate {
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .Left) {
            
            print("Swipe L");
        }
        
        
        
        if (sender.direction == .Up) {
            
            print("Swipe Up");
        }
//        if (sender.direction == .Left) {
//            
//            print("Swipe L");
//        }
        
        if (sender.direction == .Down) {
            
            print("Swipe Up");
        }
        
        if (sender.direction == .Right) {
            
            print("Swipe R");
            
//            if let button = sender.view as? UIButton {
//                
//                let mindexPath = NSIndexPath(forRow: button.tag, inSection: 0  )
//                tableView.beginUpdates()
//                mDataArray.removeObjectAtIndex(button.tag)
//                tempColorArray.removeObjectAtIndex(button.tag)
//                tableView.deleteRowsAtIndexPaths([mindexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//                tableView.endUpdates()
//                tableView.reloadData()
//            }
        }
    }
}


//Functions
extension MainIdeas {
    
//    @IBOutlet weak var timers: UILabel!
///@IBOutlet/    var counter = 10
//    var timer = NSTimer()
    
//    /@IBOutlet weak var timer: ULable!
    
    
    
@IBAction func startButton(sender: AnyObject) {
        
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerAction", userInfo: nil, repeats: true)
    }
    
    func timerAction(){
        --counter
        time.text = "\(counter)"
        
        if counter == 0 {
//            prepareForSegue(Div, sender: <#T##AnyObject?#>)
        }
    }
    
}




extension MainIdeas: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        if (!textField.text!.isEmpty) {
            
            
            mDataArray.addObject(textField.text!)
            
            textField.text = ""
            textField.textColor = UIColor.whiteColor()
            tableView.hidden = false
            
            let randomIndex = Int(arc4random_uniform(UInt32(colorsArray.count)))
            tempColorArray.addObject(colorsArray[randomIndex] as UIColor)
            
            //            print("textField \(mDataArray.count-1)")
            let mindexPath = NSIndexPath(forRow:mDataArray.count-1, inSection: 0)
            //            let mindexPath = NSIndexPath(forRow:0, inSection: 0)
            tableView.insertRowsAtIndexPaths([mindexPath], withRowAnimation: UITableViewRowAnimation.Top)
            
            tableView.scrollToRowAtIndexPath(mindexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
            
//            mListIdeas += mindexPath
            
            print("mindexPaht \(mDataArray)")
            self.tableView.reloadData()
        }
        return true
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "DivergentSegue" {
//            let destinationController = segue.destinationViewController as! Divergent
//            destinationController.mDataArray = mDataArray
//        }
//    }
//    
//    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
//        
//      if identifier == "DivergentSegue"{
//        
//        
//    }
}

extension MainIdeas: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Did Select Row ")
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "DivergentSegue" {
                let destinationController = segue.destinationViewController as! Divergent
                destinationController.mDataArray = mDataArray
            }
        }
        
        
    }
}













