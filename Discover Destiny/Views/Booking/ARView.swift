//
//  ARView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-17.
//

import SwiftUI
import RealityKit
import CoreMotion

struct ARView: View {
    var body: some View {
        Model3DView()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ARView()
}

struct Model3DView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> RealityKit.ARView {
        let arView = RealityKit.ARView(frame: .zero)
        arView.environment.background = .color(.white)
        
        let sceneAnchor = AnchorEntity(world: .zero)
        
        do {
            let modelEntity = try Entity.loadModel(named: "hotel_room")
            modelEntity.scale = SIMD3<Float>(repeating: 0.01)
            let bounds = modelEntity.visualBounds(relativeTo: nil)
            modelEntity.position = -bounds.center
            
            sceneAnchor.addChild(modelEntity)
            context.coordinator.modelEntity = modelEntity
        } catch {
        }
        
        arView.scene.anchors.append(sceneAnchor)
        context.coordinator.startMotionTracking()
        
        return arView
    }
    
    func updateUIView(_ uiView: RealityKit.ARView, context: Context) {}
    
    static func dismantleUIView(_ uiView: RealityKit.ARView, coordinator: Coordinator) {
        coordinator.stopMotionTracking()
    }
    
    
    class Coordinator {
        let motionManager = CMMotionManager()
        var modelEntity: Entity?
        
        func startMotionTracking() {
            guard motionManager.isDeviceMotionAvailable else { return }
            
            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, _ in
                guard let self = self,
                      let motion = motion,
                      let model = self.modelEntity else { return }
                
                let attitude = motion.attitude
                let rotation = simd_quatf(ix: Float(attitude.quaternion.x),
                                          iy: Float(attitude.quaternion.y),
                                          iz: Float(attitude.quaternion.z),
                                          r: Float(attitude.quaternion.w))
                
                model.orientation = rotation
            }
        }
        
        func stopMotionTracking() {
            motionManager.stopDeviceMotionUpdates()
        }
    }
}
