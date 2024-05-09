//
//  ShakerViewController.swift
//  SaltShaker
//
//  Created by Matthew Manzi on 12/13/16.
//
//

import UIKit
import AVFoundation

class ShakerViewController: UIViewController {
    
    // Instantiation-time variables (shaker specific)
    var shakerName: String = "saltShaker"
    var particlesName: String = "Particles"
    var soundName: String = "salt_shake4"
    
    // View variables
    let SCREEN_SIZE: CGSize = UIScreen.main.bounds.size
    var screenXCenter: CGFloat!
    var imgXPos: CGFloat!
    var isLargeScreen = false
    var doneButton: UIButton!
    
    // Universal shaker variables
    var shakerImage: UIImage!
    
    var particlesImage: UIImage!
    var particlesImage2: UIImage!
    
    var shouldAnimate = false
    
    // Audio variables
    let DEFAULT_AUDIO_DURATION: TimeInterval = 0.6
    var shakeSound: URL?
    var audioPlayer: AVAudioPlayer?
    var audioDuration: TimeInterval!
    
    // Main shaker variables
    var shakerView: UIImageView!
    
    var particles1, particles2, particles3, particles4, particles5, particles6: UIImageView!
    var particles1b, particles2b, particles3b, particles4b, particles5b, particles6b: UIImageView!
    
    var startRect: CGRect!
    var endRect: CGRect!
    
    var partsStartRect: CGRect!
    var partsEndRect: CGRect!
    
    // Secondary shaker variables
    var shakerView2: UIImageView!
    
    var particles1Lrg, particles2Lrg, particles3Lrg, particles4Lrg, particles5Lrg, particles6Lrg: UIImageView!
    var particles1bLrg, particles2bLrg, particles3bLrg, particles4bLrg, particles5bLrg, particles6bLrg: UIImageView!
    
    var startRectLarge1: CGRect!
    var startRectLarge2: CGRect!
    var endRectLarge1: CGRect!
    var endRectLarge2: CGRect!
    
    var partsStartRectLarge1: CGRect!
    var partsStartRectLarge2: CGRect!
    var partsEndRectLarge1: CGRect!
    var partsEndRectLarge2: CGRect!
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func makeDoneButton() {
        
        doneButton = UIButton(type: UIButtonType.system)
        doneButton.frame = CGRect(x: 0, y: view.bounds.height - 40, width: view.bounds.width, height: 40)
        doneButton.setTitle("Close", for: UIControlState())
        doneButton.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        doneButton.backgroundColor = UIColor(white: 215/255, alpha: 0.5)
        doneButton.addTarget(self, action: #selector(leaveScreen), for: .touchUpInside)
        
        view.addSubview(doneButton)
        
    }
    
    func setUpShakersForNormalScreen() {
        
        shakerView = UIImageView(image: shakerImage)

        shakerView.frame = startRect
        
        self.view.addSubview(shakerView)
        
    }
    
    func setUpShakersForLargeScreen() {
        
        shakerView = UIImageView(image: shakerImage)
        
        shakerView2 = UIImageView(image: shakerImage)
        shakerView.frame = startRectLarge1
        shakerView2.frame = startRectLarge2
        
        self.view.addSubview(shakerView)
        self.view.addSubview(shakerView2)
        
    }
    
    func setUpParticlesForNormalScreen() {
        
        // Rects for normal screen
        partsStartRect = CGRect(x: screenXCenter - 70, y: view.bounds.height - 320, width: 140, height: 85)
        partsEndRect = CGRect(x: screenXCenter - 70, y: view.bounds.height, width: 140, height: 85)
        
        // Set up all of the particles' parameters for a normal screen
        particles1 = UIImageView(image: particlesImage)
        particles1.frame = partsStartRect
        
        particles2 = UIImageView(image: particlesImage2)
        particles2.frame = partsStartRect
        
        particles3 = UIImageView(image: particlesImage)
        particles3.frame = partsStartRect
        
        particles4 = UIImageView(image: particlesImage2)
        particles4.frame = partsStartRect
        
        particles5 = UIImageView(image: particlesImage)
        particles5.frame = partsStartRect
        
        particles6 = UIImageView(image: particlesImage2)
        particles6.frame = partsStartRect
        
        particles1b = UIImageView(image: particlesImage)
        particles1b.frame = partsStartRect
        
        particles2b = UIImageView(image: particlesImage2)
        particles2b.frame = partsStartRect
        
        particles3b = UIImageView(image: particlesImage)
        particles3b.frame = partsStartRect
        
        particles4b = UIImageView(image: particlesImage2)
        particles4b.frame = partsStartRect
        
        particles5b = UIImageView(image: particlesImage)
        particles5b.frame = partsStartRect
        
        particles6b = UIImageView(image: particlesImage2)
        particles6b.frame = partsStartRect
        
        view.addSubview(particles1)
        view.addSubview(particles2)
        view.addSubview(particles3)
        view.addSubview(particles4)
        view.addSubview(particles5)
        view.addSubview(particles6)
        
        view.addSubview(particles1b)
        view.addSubview(particles2b)
        view.addSubview(particles3b)
        view.addSubview(particles4b)
        view.addSubview(particles5b)
        view.addSubview(particles6b)
        
    }
    
    func setUpParticlesForLargeScreen() {
        
        // Rects for large screen
        partsStartRectLarge1 = CGRect(x: 90, y: 300, width: 140, height: 85)
        partsStartRectLarge2 = CGRect(x: SCREEN_SIZE.width - 230, y: 300, width: 140, height: 85)
        partsEndRectLarge1 = CGRect(x: 90, y: SCREEN_SIZE.height, width: 140, height: 85)
        partsEndRectLarge2 = CGRect(x: SCREEN_SIZE.width - 200, y: SCREEN_SIZE.height, width: 140, height: 85)
        
        // Set up all of the particles' parameters for a large screen (left side shaker)
        particles1 = UIImageView(image: particlesImage)
        particles1.frame = partsStartRectLarge1
        
        particles2 = UIImageView(image: particlesImage2)
        particles2.frame = partsStartRectLarge1
        
        particles3 = UIImageView(image: particlesImage)
        particles3.frame = partsStartRectLarge1
        
        particles4 = UIImageView(image: particlesImage2)
        particles4.frame = partsStartRectLarge1
        
        particles5 = UIImageView(image: particlesImage)
        particles5.frame = partsStartRectLarge1
        
        particles6 = UIImageView(image: particlesImage2)
        particles6.frame = partsStartRectLarge1
        
        particles1b = UIImageView(image: particlesImage)
        particles1b.frame = partsStartRectLarge1
        
        particles2b = UIImageView(image: particlesImage2)
        particles2b.frame = partsStartRectLarge1
        
        particles3b = UIImageView(image: particlesImage)
        particles3b.frame = partsStartRectLarge1
        
        particles4b = UIImageView(image: particlesImage2)
        particles4b.frame = partsStartRectLarge1
        
        particles5b = UIImageView(image: particlesImage)
        particles5b.frame = partsStartRectLarge1
        
        particles6b = UIImageView(image: particlesImage2)
        particles6b.frame = partsStartRectLarge1
        
        view.addSubview(particles1)
        view.addSubview(particles2)
        view.addSubview(particles3)
        view.addSubview(particles4)
        view.addSubview(particles5)
        view.addSubview(particles6)
        
        view.addSubview(particles1b)
        view.addSubview(particles2b)
        view.addSubview(particles3b)
        view.addSubview(particles4b)
        view.addSubview(particles5b)
        view.addSubview(particles6b)
        
        // Set up all of the particles' parameters for a large screen (right side shaker)
        particles1Lrg = UIImageView(image: particlesImage)
        particles1Lrg.frame = partsStartRectLarge2
        
        particles2Lrg = UIImageView(image: particlesImage2)
        particles2Lrg.frame = partsStartRectLarge2
        
        particles3Lrg = UIImageView(image: particlesImage)
        particles3Lrg.frame = partsStartRectLarge2
        
        particles4Lrg = UIImageView(image: particlesImage2)
        particles4Lrg.frame = partsStartRectLarge2
        
        particles5Lrg = UIImageView(image: particlesImage)
        particles5Lrg.frame = partsStartRectLarge2
        
        particles6Lrg = UIImageView(image: particlesImage2)
        particles6Lrg.frame = partsStartRectLarge2
        
        particles1bLrg = UIImageView(image: particlesImage)
        particles1bLrg.frame = partsStartRectLarge2
        
        particles2bLrg = UIImageView(image: particlesImage2)
        particles2bLrg.frame = partsStartRectLarge2
        
        particles3bLrg = UIImageView(image: particlesImage)
        particles3bLrg.frame = partsStartRectLarge2
        
        particles4bLrg = UIImageView(image: particlesImage2)
        particles4bLrg.frame = partsStartRectLarge2
        
        particles5bLrg = UIImageView(image: particlesImage)
        particles5bLrg.frame = partsStartRectLarge2
        
        particles6bLrg = UIImageView(image: particlesImage2)
        particles6bLrg.frame = partsStartRectLarge2
        
        view.addSubview(particles1Lrg)
        view.addSubview(particles2Lrg)
        view.addSubview(particles3Lrg)
        view.addSubview(particles4Lrg)
        view.addSubview(particles5Lrg)
        view.addSubview(particles6Lrg)
        
        view.addSubview(particles1bLrg)
        view.addSubview(particles2bLrg)
        view.addSubview(particles3bLrg)
        view.addSubview(particles4bLrg)
        view.addSubview(particles5bLrg)
        view.addSubview(particles6bLrg)
        
    }
    
    func setUpAudioPlayer(filename: String) {
        
        // Load file
        guard let soundPath = Bundle.main.path(forResource: filename, ofType: "wav") else {
            
            let alertVc = UIAlertController(title: "Heads Up", message: "It's not your device. Sorry, something went wrong loading the sound so there won't be an audio.", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertVc, animated: true, completion: nil)
            
            audioDuration = DEFAULT_AUDIO_DURATION
            
            return
            
        }
        shakeSound = URL(fileURLWithPath: soundPath)
        
        // Prepare player
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: shakeSound!, fileTypeHint: nil)
            
            if let player = audioPlayer {
                audioDuration = player.duration
                player.prepareToPlay()
            } else {
                audioDuration = DEFAULT_AUDIO_DURATION
            }
            
        } catch {
            
            let alertVc = UIAlertController(title: "Heads Up", message: "It's not your device. Sorry, something went wrong loading the sound so there won't be an audio.", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertVc, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize shaker-specific variables
        shakerImage = UIImage(named: shakerName)
        particlesImage = UIImage(named: particlesName)
        particlesImage2 = UIImage(named: "\(particlesName)Flipped")
        
        // Size variables
        screenXCenter = SCREEN_SIZE.width/2
        imgXPos = (screenXCenter - (320/2))
        isLargeScreen = SCREEN_SIZE.width > 500
        
        // Set up the initial view
        self.view.backgroundColor = UIColor(red: 0.0, green: 184/255, blue: 235/255, alpha: 1.0)
        makeDoneButton()
        
        // Set up the shaker(s)
        if isLargeScreen {
            
            startRectLarge1 = CGRect(x: 0.0, y: 0.0, width: 320.0, height: 434.9)
            startRectLarge2 = CGRect(x: (SCREEN_SIZE.width - 320.0), y: 0.0, width: 320.0, height: 434.9)
            endRectLarge1 = CGRect(x: 0.0, y: 170.0, width: 320.0, height: 434.9)
            endRectLarge2 = CGRect(x: (SCREEN_SIZE.width - 320.0), y: 170.0, width: 320.0, height: 434.9)
            
            setUpParticlesForLargeScreen()
            setUpShakersForLargeScreen()
            
            
        } else {
            
            startRect = CGRect(x: imgXPos, y: 0.0, width: 320.0, height: 434.9)
            endRect = CGRect(x: imgXPos, y: 170.0, width: 320.0, height: 434.9)
            
            setUpParticlesForNormalScreen()
            setUpShakersForNormalScreen()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpAudioPlayer(filename: soundName)
        
    }
    
    func animateForNormalScreen() {
        
        UIView.animateKeyframes(withDuration: audioDuration, delay: 0.0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0/60, relativeDuration: 10/60, animations: { _ in
                self.shakerView.frame = self.endRect
            })
            UIView.addKeyframe(withRelativeStartTime: 10/60, relativeDuration: 20/60, animations: { _ in
                self.shakerView.frame = self.startRect
            })
            
            UIView.addKeyframe(withRelativeStartTime: 9/60, relativeDuration: 19/60, animations: { _ in
                // Particle layer one
                self.particles1.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 12/60, relativeDuration: 18/60, animations: { _ in
                // Particle layer two
                self.particles2.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 15/60, relativeDuration: 22/60, animations: { _ in
                // Particle layer three
                self.particles3.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 18/60, relativeDuration: 20/60, animations: { _ in
                // Particle layer four
                self.particles4.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 21/60, relativeDuration: 15/60, animations: { _ in
                // Particle layer five
                self.particles5.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 24/60, relativeDuration: 17/60, animations: { _ in
                // Particle layer six
                self.particles6.frame = self.partsEndRect
            })
            
            self.shouldAnimate = false
            
            UIView.addKeyframe(withRelativeStartTime: 30/60, relativeDuration: 10/60, animations: { _ in
                self.shakerView.frame = self.endRect
            })
            UIView.addKeyframe(withRelativeStartTime: 40/60, relativeDuration: 20/60, animations: { _ in
                self.shakerView.frame = self.startRect
            })
            
            UIView.addKeyframe(withRelativeStartTime: 39/60, relativeDuration: 19/60, animations: { _ in
                // Particle layer one
                self.particles1b.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 42/60, relativeDuration: 18/60, animations: { _ in
                // Particle layer two
                self.particles2b.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 45/60, relativeDuration: 22/60, animations: { _ in
                // Particle layer three
                self.particles3b.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 48/60, relativeDuration: 20/60, animations: { _ in
                // Particle layer four
                self.particles4b.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 51/60, relativeDuration: 15/60, animations: { _ in
                // Particle layer five
                self.particles5b.frame = self.partsEndRect
            })
            UIView.addKeyframe(withRelativeStartTime: 54/60, relativeDuration: 17/60, animations: { _ in
                // Particle layer six
                self.particles6b.frame = self.partsEndRect
            })
            
        }, completion: { (completed: Bool) in
            
            self.particles1.frame = self.partsStartRect
            self.particles2.frame = self.partsStartRect
            self.particles3.frame = self.partsStartRect
            self.particles4.frame = self.partsStartRect
            self.particles5.frame = self.partsStartRect
            self.particles6.frame = self.partsStartRect
            
            self.particles1b.frame = self.partsStartRect
            self.particles2b.frame = self.partsStartRect
            self.particles3b.frame = self.partsStartRect
            self.particles4b.frame = self.partsStartRect
            self.particles5b.frame = self.partsStartRect
            self.particles6b.frame = self.partsStartRect
            
            return
        })
        
    }
    
    func animateForLargeScreen() {
        
        UIView.animateKeyframes(withDuration: audioDuration, delay: 0.0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0/60, relativeDuration: 10/60, animations: { _ in
                self.shakerView.frame = self.endRectLarge1
                self.shakerView2.frame = self.endRectLarge2
            })
            UIView.addKeyframe(withRelativeStartTime: 10/60, relativeDuration: 20/60, animations: { _ in
                self.shakerView.frame = self.startRectLarge1
                self.shakerView2.frame = self.startRectLarge2
            })
            
            UIView.addKeyframe(withRelativeStartTime: 9/60, relativeDuration: 19/60, animations: { _ in
                // Particle layer one
                self.particles1.frame = self.partsEndRectLarge1
                self.particles1Lrg.frame = self.partsEndRectLarge2
                
                self.particles1.alpha = 0.2
                self.particles1Lrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 12/60, relativeDuration: 18/60, animations: { _ in
                // Particle layer two
                self.particles2.frame = self.partsEndRectLarge1
                self.particles2Lrg.frame = self.partsEndRectLarge2
                
                self.particles2.alpha = 0.2
                self.particles2Lrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 15/60, relativeDuration: 22/60, animations: { _ in
                // Particle layer three
                self.particles3.frame = self.partsEndRectLarge1
                self.particles3Lrg.frame = self.partsEndRectLarge2
                
                self.particles3.alpha = 0.2
                self.particles3Lrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 18/60, relativeDuration: 20/60, animations: { _ in
                // Particle layer four
                self.particles4.frame = self.partsEndRectLarge1
                self.particles4Lrg.frame = self.partsEndRectLarge2
                
                self.particles4.alpha = 0.2
                self.particles4Lrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 21/60, relativeDuration: 15/60, animations: { _ in
                // Particle layer five
                self.particles5.frame = self.partsEndRectLarge1
                self.particles5Lrg.frame = self.partsEndRectLarge2
                
                self.particles5.alpha = 0.2
                self.particles5Lrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 24/60, relativeDuration: 17/60, animations: { _ in
                // Particle layer six
                self.particles6.frame = self.partsEndRectLarge1
                self.particles6Lrg.frame = self.partsEndRectLarge2
                
                self.particles6.alpha = 0.2
                self.particles6Lrg.alpha = 0.2
            })
            
            self.shouldAnimate = false
            
            UIView.addKeyframe(withRelativeStartTime: 30/60, relativeDuration: 10/60, animations: { _ in
                self.shakerView.frame = self.endRectLarge1
                self.shakerView2.frame = self.endRectLarge2
            })
            UIView.addKeyframe(withRelativeStartTime: 40/60, relativeDuration: 20/60, animations: { _ in
                self.shakerView.frame = self.startRectLarge1
                self.shakerView2.frame = self.startRectLarge2
            })
            
            UIView.addKeyframe(withRelativeStartTime: 9/60, relativeDuration: 19/60, animations: { _ in
                // Particle layer one
                self.particles1b.frame = self.partsEndRectLarge1
                self.particles1bLrg.frame = self.partsEndRectLarge2
                
                self.particles1b.alpha = 0.2
                self.particles1bLrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 12/60, relativeDuration: 18/60, animations: { _ in
                // Particle layer two
                self.particles2b.frame = self.partsEndRectLarge1
                self.particles2bLrg.frame = self.partsEndRectLarge2
                
                self.particles2b.alpha = 0.2
                self.particles2bLrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 15/60, relativeDuration: 22/60, animations: { _ in
                // Particle layer three
                self.particles3b.frame = self.partsEndRectLarge1
                self.particles3bLrg.frame = self.partsEndRectLarge2
                
                self.particles3b.alpha = 0.2
                self.particles3bLrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 18/60, relativeDuration: 20/60, animations: { _ in
                // Particle layer four
                self.particles4b.frame = self.partsEndRectLarge1
                self.particles4bLrg.frame = self.partsEndRectLarge2
                
                self.particles4b.alpha = 0.2
                self.particles4bLrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 21/60, relativeDuration: 15/60, animations: { _ in
                // Particle layer five
                self.particles5b.frame = self.partsEndRectLarge1
                self.particles5bLrg.frame = self.partsEndRectLarge2
                
                self.particles5b.alpha = 0.2
                self.particles5bLrg.alpha = 0.2
            })
            UIView.addKeyframe(withRelativeStartTime: 24/60, relativeDuration: 17/60, animations: { _ in
                // Particle layer six
                self.particles6b.frame = self.partsEndRectLarge1
                self.particles6bLrg.frame = self.partsEndRectLarge2
                
                self.particles6b.alpha = 0.2
                self.particles6bLrg.alpha = 0.2
            })
            
        }, completion: { (completed: Bool) in
            
            // Reset position
            self.particles1.frame = self.partsStartRectLarge1
            self.particles2.frame = self.partsStartRectLarge1
            self.particles3.frame = self.partsStartRectLarge1
            self.particles4.frame = self.partsStartRectLarge1
            self.particles5.frame = self.partsStartRectLarge1
            self.particles6.frame = self.partsStartRectLarge1
            
            self.particles1b.frame = self.partsStartRectLarge1
            self.particles2b.frame = self.partsStartRectLarge1
            self.particles3b.frame = self.partsStartRectLarge1
            self.particles4b.frame = self.partsStartRectLarge1
            self.particles5b.frame = self.partsStartRectLarge1
            self.particles6b.frame = self.partsStartRectLarge1
            
            self.particles1Lrg.frame = self.partsStartRectLarge2
            self.particles2Lrg.frame = self.partsStartRectLarge2
            self.particles3Lrg.frame = self.partsStartRectLarge2
            self.particles4Lrg.frame = self.partsStartRectLarge2
            self.particles5Lrg.frame = self.partsStartRectLarge2
            self.particles6Lrg.frame = self.partsStartRectLarge2
            
            self.particles1bLrg.frame = self.partsStartRectLarge2
            self.particles2bLrg.frame = self.partsStartRectLarge2
            self.particles3bLrg.frame = self.partsStartRectLarge2
            self.particles4bLrg.frame = self.partsStartRectLarge2
            self.particles5bLrg.frame = self.partsStartRectLarge2
            self.particles6bLrg.frame = self.partsStartRectLarge2
            
            // Alpha levels back to normal
            self.particles1.alpha = 1.0
            self.particles2.alpha = 1.0
            self.particles3.alpha = 1.0
            self.particles4.alpha = 1.0
            self.particles5.alpha = 1.0
            self.particles6.alpha = 1.0
            
            self.particles1b.alpha = 1.0
            self.particles2b.alpha = 1.0
            self.particles3b.alpha = 1.0
            self.particles4b.alpha = 1.0
            self.particles5b.alpha = 1.0
            self.particles6b.alpha = 1.0
            
            self.particles1Lrg.alpha = 1.0
            self.particles2Lrg.alpha = 1.0
            self.particles3Lrg.alpha = 1.0
            self.particles4Lrg.alpha = 1.0
            self.particles5Lrg.alpha = 1.0
            self.particles6Lrg.alpha = 1.0
            
            self.particles1bLrg.alpha = 1.0
            self.particles2bLrg.alpha = 1.0
            self.particles3bLrg.alpha = 1.0
            self.particles4bLrg.alpha = 1.0
            self.particles5bLrg.alpha = 1.0
            self.particles6bLrg.alpha = 1.0
            
            return
        })
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        // Code for playing sound
        if let player = audioPlayer {
            player.play()
        }
        
        shouldAnimate = true
        
        while shouldAnimate {
            
            if isLargeScreen {
                animateForLargeScreen()
            } else {
                animateForNormalScreen()
            }
            
        }
    }
    
    func leaveScreen() {
        
        if let player = audioPlayer {
            player.stop()
        }
        dismiss(animated: true, completion: nil)
        
    }
    
}
