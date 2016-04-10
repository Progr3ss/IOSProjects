//
//  Convergent.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class Convergent: UIViewController {
	
	

	@IBOutlet weak var tableView: UITableView!
	
	var toDoItems = [ToDoItems]()
	var mColorArray: NSMutableArray =  []
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.registerClass(DivergentCell.self, forCellReuseIdentifier: "cell")
		tableView.backgroundColor = UIColor.blueColor()
		
		print("toDoItems \(toDoItems)")
		print("Color \(mColorArray)")

        // Do any additional setup after loading the view.
    }

}
extension Convergent: UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		print("Num items \(toDoItems.count)")
		if toDoItems.count == 1 {
			performSegueWithIdentifier("reflectionSegue", sender: nil)
		}
		
		return toDoItems.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DivergentCell
		
		let item = toDoItems[indexPath.row]
		cell.textLabel?.text = item.text
		cell.textLabel?.numberOfLines = 0
		
		cell.backgroundColor = mColorArray[indexPath.row] as? UIColor
		
		cell.delegate = self
		cell.toDoItem = item
		return cell
	}
	

	
}
extension Convergent: UITableViewDelegate{
	
//	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//		
//		if toDoItems.count == 1 {
//			performSegueWithIdentifier("reflectionSegue", sender: nil)
//		}
//	}

	
}

extension Convergent {
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "reflectionSegue" {
			print("in segue")
		
			if let reflection = segue.destinationViewController as? Reflection {
				reflection.self.toDoItems = self.toDoItems
				
				
				print("in reflection segue \(reflection.toDoItems)")
				
			}
			
//		 reflectionView.self.toDoItems = self.toDoItems
			
		
		}
	}
}

extension Convergent: TableViewCellDelegate {
	
	func toDoItemDeleted(toDoItem: ToDoItems) {
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

