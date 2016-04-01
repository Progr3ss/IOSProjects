//
//  PromptUser.swift
//  essence
//
//  Created by martin chibwe on 3/29/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class PromptUser: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var randomQuotes: UILabel!
	@IBOutlet weak var userQuestion: UITextField!

	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.userQuestion.delegate = self
        // Do any additional setup after loading the view.
    }




    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		
		if segue.identifier == "showMain" {
			
			let mainSegue = segue.destinationViewController as! MainIdeas
			
			var a = " "
			print("mainSegue \(userQuestion.text)")
			mainSegue.test2 = userQuestion.text!
			print("test \(mainSegue.test2 )")
		}
		
		
    }
	
	
	

	
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		textField.resignFirstResponder()
		
		if (!textField.text!.isEmpty) {
			
			self.userQuestion.text = textField.text!
			textField.textColor = UIColor.whiteColor()

			print("userQuestion \(self.userQuestion)")
			performSegueWithIdentifier("showMain", sender: self)


		}


		return true
	}
	
	
	
	



}
