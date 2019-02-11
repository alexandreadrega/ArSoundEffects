//
//  ViewController.swift
//  Video1.0
//
//  Created by Alexandre Adrega on 02/10/2018.
//  Copyright © 2018 Alexandre Adrega. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var airplane: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Instantiate the audio source
        
        
        
        //moveAirplane()
        //airplane = SCNScene(named: "art.scnassets/ship.scn")?.rootNode.childNode(withName: "ship", recursively: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    ///Create and move airplane
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Create and instantiate the airplane
        guard let airplane = SCNScene(named: "art.scnassets/ship.scn")?.rootNode.childNode(withName: "ship", recursively: true) else { return }
        
        // Position airplane
        airplane.position = SCNVector3(x: 20, y: 0, z: -2)
        
        // Add airplane in scene
        sceneView.scene.rootNode.addChildNode(airplane)
        
        // Add audio in node**
        airplane.addAudio(audio: "AudioAviao.mp3")

        // move airplane
        let planeAnimation = SCNAction.sequence([SCNAction.move(to: SCNVector3(x: -20, y: 0, z: -2), duration: TimeInterval(3)) , SCNAction.fadeOut(duration: 0.1), SCNAction.removeFromParentNode()])
        
        airplane.runAction(planeAnimation)
        
    }
}


//----------------------------------------------------------

