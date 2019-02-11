//
//  AddAudio.swift
//  ArSoundEffects
//
//  Created by Alexandre Adrega on 04/10/2018.
//  Copyright © 2018 Alexandre Adrega. All rights reserved.
//

import ARKit

extension SCNNode {
    
    /// Add audio**
    func addAudio(audio: String)  {
        
        /// Source for audio playback
        guard let audioSource = SCNAudioSource(fileNamed: audio) else {
            debugPrint("file "+audio+" not found")
            return
        }
        
        // As an environmental sound layer, audio should play indefinitely
        audioSource.loops = true
        
        // Decode the audio from disk ahead of time to prevent a delay in playback
        audioSource.load()
        
        // Create a player from the source and add it to `objectNode`
        self.addAudioPlayer(SCNAudioPlayer(source: audioSource))
        
    }
    
}
