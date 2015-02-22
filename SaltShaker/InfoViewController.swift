//
//  InfoViewController.swift
//  SaltShaker
//
//  Created by Matteo Manzi on 1/10/15.
//  Copyright (c) 2015 Virginia Manzi. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
	
	func leaveInfoScreen(sender: UIButton) {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	func attributedText() -> NSAttributedString {
		
		let string = "Salt Shaker\n\nConcept and Design\nWill Douglas\n\nCoding and Creation\nMatthew Manzi" as NSString
		let result = NSMutableAttributedString(string: string)
		
		let shadow = NSShadow()
		shadow.shadowColor = UIColor.darkGrayColor()
		shadow.shadowOffset = CGSize(width: 1.5, height: 1.5)
		let titleAttributes = [
			NSForegroundColorAttributeName: UIColor(red: 1.0, green: 130/255, blue: 0.0, alpha: 1.0),
			NSShadowAttributeName: shadow
		]
		result.setAttributes(titleAttributes, range: string.rangeOfString("Salt Shaker"))
		result.addAttribute(NSFontAttributeName, value: UIFont(name: "Bauhaus93", size: 54.0)!, range: string.rangeOfString("Salt Shaker"))
		
		let headerAttributes = [
			NSFontAttributeName: UIFont.boldSystemFontOfSize(22),
			NSForegroundColorAttributeName: UIColor.darkTextColor(),
		]
		
		result.setAttributes(headerAttributes, range: string.rangeOfString("Concept and Design"))
		result.setAttributes(headerAttributes, range: string.rangeOfString("Coding and Creation"))
		
		return NSAttributedString(attributedString: result)
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor(red: 0, green: 184/255, blue: 235/255, alpha: 1)
		
		let acknowledgements = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
		acknowledgements.center = view.center
		acknowledgements.textAlignment = NSTextAlignment.Center
		acknowledgements.numberOfLines = 8
		acknowledgements.font = UIFont.systemFontOfSize(17)
		acknowledgements.textColor = UIColor.blackColor()
		acknowledgements.attributedText = attributedText()
		
		view.addSubview(acknowledgements)
		
		
		let doneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
		doneButton.frame = CGRect(x: 0, y: view.bounds.height - 60, width: view.bounds.width, height: 60)
		doneButton.setTitle("Close", forState: .Normal)
		doneButton.titleLabel!.font = UIFont.systemFontOfSize(20)
		doneButton.backgroundColor = UIColor(white: 215/255, alpha: 0.5)
		doneButton.addTarget(self, action: "leaveInfoScreen:", forControlEvents: .TouchUpInside)
		
		view.addSubview(doneButton)
		
		
    }

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
	}

}
