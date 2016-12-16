//
//  ParticlesMemorySizeTests.swift
//  SaltShaker
//
//  Created by Matt Manzi on 12/15/16.
//
//

import XCTest
@testable import SaltShaker

class ParticlesCreateTimeTests: XCTestCase {
    
    var partsStartRect: CGRect!
    
    var particlesImage: UIImage!
    var particlesImage2: UIImage!
    
    var particles: [UIImageView?] = [nil, nil, nil, nil, nil, nil]
    
    var particles1, particles2, particles3, particles4, particles5, particles6: UIImageView!
    var particles1b, particles2b, particles3b, particles4b, particles5b, particles6b: UIImageView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        partsStartRect = CGRect(x: 300 - 70, y: 1400 - 320, width: 140, height: 85)
        particlesImage = UIImage(named: "Particles")
        particlesImage2 = UIImage(named: "ParticlesFlipped")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        partsStartRect = nil
        particlesImage = nil
        particlesImage2 = nil
        super.tearDown()
    }
    
    func testTimeToCreateParticlesIndividually() {
        
        self.measure {
            
            self.particles1 = UIImageView(image: self.particlesImage)
            self.particles1.frame = self.partsStartRect
            
            self.particles2 = UIImageView(image: self.particlesImage2)
            self.particles2.frame = self.partsStartRect
            
            self.particles3 = UIImageView(image: self.particlesImage)
            self.particles3.frame = self.partsStartRect
            
            self.particles4 = UIImageView(image: self.particlesImage2)
            self.particles4.frame = self.partsStartRect
            
            self.particles5 = UIImageView(image: self.particlesImage)
            self.particles5.frame = self.partsStartRect
            
            self.particles6 = UIImageView(image: self.particlesImage2)
            self.particles6.frame = self.partsStartRect
            
            self.particles1b = UIImageView(image: self.particlesImage)
            self.particles1b.frame = self.partsStartRect
            
            self.particles2b = UIImageView(image: self.particlesImage2)
            self.particles2b.frame = self.partsStartRect
            
            self.particles3b = UIImageView(image: self.particlesImage)
            self.particles3b.frame = self.partsStartRect
            
            self.particles4b = UIImageView(image: self.particlesImage2)
            self.particles4b.frame = self.partsStartRect
            
            self.particles5b = UIImageView(image: self.particlesImage)
            self.particles5b.frame = self.partsStartRect
            
            self.particles6b = UIImageView(image: self.particlesImage2)
            self.particles6b.frame = self.partsStartRect
            
//            view.addSubview(particles1)
//            view.addSubview(particles2)
//            view.addSubview(particles3)
//            view.addSubview(particles4)
//            view.addSubview(particles5)
//            view.addSubview(particles6)
//            
//            view.addSubview(particles1b)
//            view.addSubview(particles2b)
//            view.addSubview(particles3b)
//            view.addSubview(particles4b)
//            view.addSubview(particles5b)
//            view.addSubview(particles6b)
            
        }
        
    }
    
    func testTimeToCreateParticlesWithArray() {
        
        self.measure {
            
            for i in 0..<self.particles.count {
                
                if i % 2 == 0 {
                    self.particles[i] = UIImageView(image: self.particlesImage)
                } else {
                    self.particles[i] = UIImageView(image: self.particlesImage2)
                }
                
                self.particles[i]?.frame = self.partsStartRect
                
                if self.particles[i] != nil {
//                    view.addSubview(particle)
                }
                
            }

            
        }
        
    }
    
}
