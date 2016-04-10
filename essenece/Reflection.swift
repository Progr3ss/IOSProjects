//
//  Reflection.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class Reflection: UIViewController {
	
	

	@IBOutlet weak var bodyReflection: UITextField!
	@IBOutlet weak var userIdeaReflection: UILabel!
	
	var toDoItems = [ToDoItems]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		print("Reflection \(toDoItems)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension Reflection {
	
	@IBAction func doneWasPressed(sender: AnyObject) {
		transferToListDismiss()
		
	}
	
	
	@IBAction func cancelWasPressed(sender: AnyObject) {
		transferToListDismiss()
	}
	
	func transferToListDismiss(){
		performSegueWithIdentifier("timelineSegue", sender: nil)
//		self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
	}
}