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
    
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    
    
     var mDataArray : NSMutableArray = []
     var tempColorArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Divergent mData \(mDataArray)")

        // Do any additional setup after loading the view.
    }

    
}



extension Divergent: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DivergentCell
        
        cell.userInput.text = mDataArray[indexPath.row] as? String

        cell.colorView.backgroundColor = tempColorArray[indexPath.row] as? UIColor

        return cell
    }

}

extension Divergent: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Did Select Row")
        
    }

}



