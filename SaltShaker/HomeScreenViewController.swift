//
//  HomeScreenViewController.swift
//  SaltShaker
//
//  Created by Matteo Manzi on 2/3/15.
//  Copyright (c) 2015 Virginia Manzi. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

	let VC = ViewController()
	let VC2 = ViewController2()
	let iVC = InfoViewController()
	
	var saltButton: UIButton!
	var pepperButton: UIButton!
	var infoButton: UIButton!
	
	let normalButtonImage = UIImage(named: "blankButtonNormal")
	let highlightedButtonImage = UIImage(named: "blankButtonHighlighted")
	
	let buttonSize = CGSize(width: 140, height: 45)
	
	var logoImageView: UIImageView!
	let logoImage = UIImage(named: "LogoImage")
	
	override func prefersStatusBarHidden() -> Bool {

		return true
	}
	
	func createSaltButton() {
		
		let saltButtonPoint = CGPoint(x: view.center.x, y: view.center.y - 20)
		
		saltButton = UIButton(type: UIButtonType.Custom)
		saltButton.frame.size = buttonSize
		saltButton.center = saltButtonPoint
		saltButton.setBackgroundImage(normalButtonImage, forState: .Normal)
		saltButton.setBackgroundImage(highlightedButtonImage, forState: .Highlighted)
		saltButton.setTitle("Salt Shaker", forState: .Normal)
		saltButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		saltButton.setTitleShadowColor(UIColor.darkGrayColor(), forState: .Normal)
		
		view.addSubview(saltButton)
		
		saltButton.addTarget(self, action: #selector(openSaltViewController), forControlEvents: .TouchUpInside)
		
	}
	
	func createPepperButton() {
		
		let pepperButtonPoint = CGPoint(x: view.center.x, y: view.center.y + 60)
		
		pepperButton = UIButton(type: UIButtonType.Custom)
		pepperButton.frame.size = buttonSize
		pepperButton.center = pepperButtonPoint
		pepperButton.setBackgroundImage(normalButtonImage, forState: .Normal)
		pepperButton.setBackgroundImage(highlightedButtonImage, forState: .Highlighted)
		pepperButton.setTitle("Pepper Shaker", forState: .Normal)
		pepperButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		pepperButton.setTitleShadowColor(UIColor.darkGrayColor(), forState: .Normal)
	
		view.addSubview(pepperButton)
		
		pepperButton.addTarget(self, action: #selector(openPepperViewController), forControlEvents: .TouchUpInside)
		
	}
	
	func createInfoButton() {
		
		let infoButtonPoint = CGPoint(x: view.center.x, y: view.center.y + 140)
		
		infoButton = UIButton(type: UIButtonType.Custom)
		infoButton.frame.size = CGSize(width: 70, height: 45)
		infoButton.center = infoButtonPoint
		infoButton.setBackgroundImage(normalButtonImage, forState: .Normal)
		infoButton.setBackgroundImage(highlightedButtonImage, forState: .Highlighted)
		infoButton.setTitle("Credits", forState: .Normal)
		infoButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		infoButton.setTitleShadowColor(UIColor.darkGrayColor(), forState: .Normal)
		
		view.addSubview(infoButton)
		
		infoButton.addTarget(self, action: #selector(openInfoViewController), forControlEvents: .TouchUpInside)
		
	}
	
	func openSaltViewController(sender: UIButton) {
		
		presentViewController(VC, animated: true, completion: nil)
		
	}
	
	func openPepperViewController(sender: UIButton) {
		
		presentViewController(VC2, animated: true, completion: nil)
		
	}
	
	func openInfoViewController(sender: UIButton) {
		
		presentViewController(iVC, animated: true, completion: nil)
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = UIColor(red: 0.0, green: 184/255, blue: 235/255, alpha: 1.0)
		
		logoImageView = UIImageView(image: logoImage)
		logoImageView.frame.size = CGSize(width: view.bounds.width, height: view.bounds.width / 2)
		
		view.addSubview(logoImageView)
		
		createSaltButton()
		createPepperButton()
		createInfoButton()
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}
