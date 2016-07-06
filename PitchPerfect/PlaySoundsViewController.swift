//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Sergio Marrero Fernandez on 05/07/16.
//  Copyright © 2016 Sergio Marrero Fernandez. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var revertButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("Play sound button pressed")
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    
    @IBAction func stopSoundForButton(sender: UIButton) {
        print("Stop audio button pressed")
        
        stopAudio()
    }
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("PlaySoundViewController loaded")
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
