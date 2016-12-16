//
//  HomeScreenViewController.swift
//  SaltShaker
//
//  Created by Matthew Manzi on 2/3/15.
//  Copyright (c) 2016 Matthew Manzi. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
	
	var saltButton: UIButton!
	var pepperButton: UIButton!
	var infoButton: UIButton!
	
	let normalButtonImage = UIImage(named: "blankButtonNormal")
	let highlightedButtonImage = UIImage(named: "blankButtonHighlighted")
	
	let buttonSize = CGSize(width: 140, height: 45)
	
	var logoImageView: UIImageView!
	let logoImage = UIImage(named: "LogoImage")
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
	func createSaltButton() {
		
		let saltButtonPoint = CGPoint(x: view.center.x, y: view.center.y - 20)
		
		saltButton = UIButton(type: UIButtonType.custom)
		saltButton.frame.size = buttonSize
		saltButton.center = saltButtonPoint
		saltButton.setBackgroundImage(normalButtonImage, for: UIControlState())
		saltButton.setBackgroundImage(highlightedButtonImage, for: .highlighted)
		saltButton.setTitle("Salt Shaker", for: UIControlState())
		saltButton.setTitleColor(UIColor.white, for: UIControlState())
		saltButton.setTitleShadowColor(UIColor.darkGray, for: UIControlState())
		
		view.addSubview(saltButton)
		
		saltButton.addTarget(self, action: #selector(openSaltViewController), for: .touchUpInside)
		
	}
	
	func createPepperButton() {
		
		let pepperButtonPoint = CGPoint(x: view.center.x, y: view.center.y + 60)
		
		pepperButton = UIButton(type: UIButtonType.custom)
		pepperButton.frame.size = buttonSize
		pepperButton.center = pepperButtonPoint
		pepperButton.setBackgroundImage(normalButtonImage, for: UIControlState())
		pepperButton.setBackgroundImage(highlightedButtonImage, for: .highlighted)
		pepperButton.setTitle("Pepper Shaker", for: UIControlState())
		pepperButton.setTitleColor(UIColor.white, for: UIControlState())
		pepperButton.setTitleShadowColor(UIColor.darkGray, for: UIControlState())
	
		view.addSubview(pepperButton)
		
		pepperButton.addTarget(self, action: #selector(openPepperViewController), for: .touchUpInside)
		
	}
	
	func createInfoButton() {
		
		let infoButtonPoint = CGPoint(x: view.center.x, y: view.center.y + 140)
		
		infoButton = UIButton(type: UIButtonType.custom)
		infoButton.frame.size = CGSize(width: 70, height: 45)
		infoButton.center = infoButtonPoint
		infoButton.setBackgroundImage(normalButtonImage, for: UIControlState())
		infoButton.setBackgroundImage(highlightedButtonImage, for: .highlighted)
		infoButton.setTitle("Credits", for: UIControlState())
		infoButton.setTitleColor(UIColor.white, for: UIControlState())
		infoButton.setTitleShadowColor(UIColor.darkGray, for: UIControlState())
		
		view.addSubview(infoButton)
		
		infoButton.addTarget(self, action: #selector(openInfoViewController), for: .touchUpInside)
		
	}
	
	func openSaltViewController() {
		
        let saltVc = ShakerViewController()
        saltVc.shakerName = "saltShaker v2"
        saltVc.particlesName = "Particles"
        saltVc.soundName = "salt_shake4"
        
		present(saltVc, animated: true, completion: nil)
		
	}
	
	func openPepperViewController() {
		
        let pepperVc = ShakerViewController()
        pepperVc.shakerName = "pepperShaker"
        pepperVc.particlesName = "PepperParticles"
        pepperVc.soundName = "pepper_shake2"
        
		present(pepperVc, animated: true, completion: nil)
		
	}
	
	func openInfoViewController() {

        let infoVc = InfoViewController()
		present(infoVc, animated: true, completion: nil)
		
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

}
