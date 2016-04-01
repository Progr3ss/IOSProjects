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
    
	@IBOutlet weak var userQuestion: UILabel!
    @IBOutlet weak var userAnswer: UITextField!
//    @IBOutlet weak var inputTF:MateralTextField!
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var time: UILabel!
	
	var test2 = " "
//     var mDataArray : NSMutableArray = []
     var toDoItems = [ToDoItem]()
     var mListIdeas : NSMutableArray = []
     var tempColorArray : NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
		userQuestion.text = test2
//		print("test2 MainIdear\(test2)")
        userAnswer.delegate = self
    }



    

}

extension MainIdeas: UITableViewDataSource
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! IdeaCell
        
        
//        cell.userInput.text = toDoItems[indexPath.row]
        
        let item = toDoItems[indexPath.row]
        cell.backgroundColor = tempColorArray[indexPath.row] as? UIColor
//        cell.textLabel?.text = item.text
        cell.userInputLabel?.text = item.text
//		cell

        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("row \(mDataArray.count)")
        return toDoItems.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
}



//Functions
extension MainIdeas {
    
  
@IBAction func startButton(sender: AnyObject) {
        
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MainIdeas.timerAction), userInfo: nil, repeats: true)
    }
    
    func timerAction(){
        counter -= 1
        time.text = "\(counter)"
        
        if counter == 0 {
            
            performSegueWithIdentifier("DivergentSegue", sender: nil)

        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DivergentSegue" {
            print("Divergent")
            
            let divergentView = segue.destinationViewController as! Divergent
//            divergentView.mDataArray = mDataArray
//            divergentView.tempColorArray = tempColorArray
            divergentView.self.toDoItems = self.toDoItems
            divergentView.tempColorArray = tempColorArray
            print("In MainIdea toDoItems \(self.toDoItems) MainIdea color \(tempColorArray)")
            
            
            
            
        }
    }
    
}



extension MainIdeas: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        if (!textField.text!.isEmpty) {
            
            self.toDoItems.append(ToDoItem(text: textField.text!))
            textField.text = ""
            textField.textColor = UIColor.whiteColor()
            tableView.hidden = false
            
            let randomIndex = Int(arc4random_uniform(UInt32(colorsArray.count)))
            tempColorArray.addObject(colorsArray[randomIndex] as UIColor)
            
            let mindexPath = NSIndexPath(forRow:self.toDoItems.count-1, inSection: 0)
            //            let mindexPath = NSIndexPath(forRow:0, inSection: 0)
            tableView.insertRowsAtIndexPaths([mindexPath], withRowAnimation: UITableViewRowAnimation.Top)
            tableView.scrollToRowAtIndexPath(mindexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
            
            //            mListIdeas += mindexPath
            self.tableView.reloadData()
        }
        return true
    }
}





//extension MainIdeas: UITableViewDelegate, TableViewCellDelegate {
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        print("Did Select Row ")
//        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//            if segue.identifier == "DivergentSegue" {
//                let destinationController = segue.destinationViewController as! Divergent
//                destinationController.self.toDoItems = self.toDoItems
//                destinationController.tempColorArray = tempColorArray
//                
//            }
//        }
//    }
//    
//    func toDoItemDeleted(toDoItem: ToDoItem) {
//        let index = (toDoItems as NSArray).indexOfObject(toDoItem)
//        if index == NSNotFound { return }
//        
//        // could removeAtIndex in the loop but keep it here for when indexOfObject works
//        toDoItems.removeAtIndex(index)
//        
//        // use the UITableView to animate the removal of this row
//        tableView.beginUpdates()
//        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
//        tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
//        tableView.endUpdates()
//    }
//
//    
//}













