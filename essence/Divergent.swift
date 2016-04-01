//
//  Divergent.swift
//  essence
//
//  Created by martin chibwe on 3/20/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class Divergent: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var colorView: UIView!
    

    var toDoItems = [ToDoItem]()
    var tempColorArray: NSMutableArray = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Divergent Color \(tempColorArray) and Divergent toDoItems \(toDoItems)")
        tableView.registerClass(DivergentCell.self, forCellReuseIdentifier: "cell")

    }
	
//	prepar

    
}



extension Divergent: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(" count \(toDoItems.count)")
		
        return toDoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DivergentCell

        let item = toDoItems[indexPath.row]
        cell.textLabel?.text = item.text
        cell.textLabel?.numberOfLines = 0

        cell.backgroundColor = tempColorArray[indexPath.row] as? UIColor

        cell.delegate = self
        cell.toDoItem = item
		
		
        
        return cell
    }
    
 

}

extension Divergent: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        print("print("Did Select Row \(indexPath)")")
	
	
		
		if toDoItems.count == 1{
			performSegueWithIdentifier("reflection", sender: nil)
		}
		
		
		
		
    }
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "Reflection" {
			
			let reflectionView = segue.destinationViewController as! Reflection
			
//			reflectionView.
		}
		
		
		
	}
	
	
	
}


extension Divergent: TableViewCellDelegate {
    
    func toDoItemDeleted(toDoItem: ToDoItem) {
        let index = (toDoItems as NSArray).indexOfObject(toDoItem)
        if index == NSNotFound { return }
        
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        toDoItems.removeAtIndex(index)
        
        // use the UITableView to animate the removal of this row
        tableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        tableView.endUpdates()
    }
	
	
}




