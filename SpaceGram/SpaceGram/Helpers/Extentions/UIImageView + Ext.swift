//
//  UIImageView + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit


//extension UIImageView {
//  func enableZoom() {
//    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
//    isUserInteractionEnabled = true
//    addGestureRecognizer(pinchGesture)
//  }
//
//  @objc
//  private func startZooming(_ sender: UIPinchGestureRecognizer) {
//    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
//    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
//    sender.view?.transform = scale
//    sender.scale = 1
//  }
//}


extension UIImageView {
    
    private var originalTransform: CGAffineTransform {
        return CGAffineTransform.identity
    }


    
    func enableZoomRotationPan() {
        isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        addGestureRecognizer(rotationGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        addGestureRecognizer(panGesture)
        
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapGesture)
    }
    
  
    
    @objc private func handleRotation(_ gesture: UIRotationGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        if gesture.state == .changed || gesture.state == .ended {
            view.transform = view.transform.rotated(by: gesture.rotation)
            gesture.rotation = 0
        } else if gesture.state == .ended {
            view.transform = .identity
        }
    }
    
    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        if gesture.state == .changed || gesture.state == .ended {
            view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1.0
        } else if gesture.state == .ended {
            
        }
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        if gesture.state == .changed || gesture.state == .ended {
            let translation = gesture.translation(in: view.superview)
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            gesture.setTranslation(.zero, in: view.superview)
        } else if gesture.state == .ended {
            
        }
    }

    
    @objc private func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view else { return }

        if gesture.state == .ended {
            let currentTransform = view.transform

            UIView.animate(withDuration: 0.3) {
                if currentTransform == self.originalTransform {
                    view.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                } else {
                    view.transform = self.originalTransform
                }
            }
        }
    }

    private func resetTransform(_ view: UIView) {
        UIView.animate(withDuration: 0.3) {
            view.transform = .identity
        }
    }
}

