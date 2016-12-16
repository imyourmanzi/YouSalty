//
//  InfoViewController.swift
//  SaltShaker
//
//  Created by Matthew Manzi on 1/10/15.
//  Copyright (c) 2016 Matthew Manzi. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
	
	func attributedText() -> NSAttributedString {
		
		let string = "Salt Shaker\n\nConcept and Design\nWill Douglas\n\nCoding and Creation\nMatthew Manzi" as NSString
		let result = NSMutableAttributedString(string: string as String)
		
		let shadow = NSShadow()
		shadow.shadowColor = UIColor.darkGray
		shadow.shadowOffset = CGSize(width: 1.5, height: 1.5)
		let titleAttributes = [
			NSForegroundColorAttributeName: UIColor(red: 1.0, green: 130/255, blue: 0.0, alpha: 1.0),
			NSShadowAttributeName: shadow
		]
		result.setAttributes(titleAttributes, range: string.range(of: "Salt Shaker"))
		result.addAttribute(NSFontAttributeName, value: UIFont(name: "Bauhaus93", size: 54.0)!, range: string.range(of: "Salt Shaker"))
		
		let headerAttributes = [
			NSFontAttributeName: UIFont.boldSystemFont(ofSize: 22),
			NSForegroundColorAttributeName: UIColor.darkText,
		]
		
		result.setAttributes(headerAttributes, range: string.range(of: "Concept and Design"))
		result.setAttributes(headerAttributes, range: string.range(of: "Coding and Creation"))
		
		return NSAttributedString(attributedString: result)
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor(red: 0, green: 184/255, blue: 235/255, alpha: 1)
		
		let acknowledgements = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
		acknowledgements.center = view.center
		acknowledgements.textAlignment = NSTextAlignment.center
		acknowledgements.numberOfLines = 8
		acknowledgements.font = UIFont.systemFont(ofSize: 17)
		acknowledgements.textColor = UIColor.black
		acknowledgements.attributedText = attributedText()
		
		view.addSubview(acknowledgements)
		
		let doneButton = UIButton(type: UIButtonType.system)
		doneButton.frame = CGRect(x: 0, y: view.bounds.height - 60, width: view.bounds.width, height: 60)
		doneButton.setTitle("Close", for: UIControlState())
		doneButton.titleLabel!.font = UIFont.systemFont(ofSize: 20)
		doneButton.backgroundColor = UIColor(white: 215/255, alpha: 0.5)
		doneButton.addTarget(self, action: #selector(leaveInfoScreen), for: .touchUpInside)
		
		view.addSubview(doneButton)
		
    }

    func leaveInfoScreen() {
        dismiss(animated: true, completion: nil)
    }
    
}
