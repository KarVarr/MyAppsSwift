//
//  VisionSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 07.04.2024.
//

import Foundation
import VisionKit
import AVFoundation

extension ScanVC: DataScannerViewControllerDelegate {
    func configureVisionKitSVC() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {return}
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
            videoPreviewLayer.session = captureSession
            videoPreviewLayer.videoGravity = .resizeAspectFill
            videoPreviewLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2)
            view.layer.addSublayer(videoPreviewLayer)
            captureSession.startRunning()
        } catch {
            print("Error setting up camera: \(error)")
        }
    }
    
    
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        guard case .text(let text) = item else { return }
        
        let parts = text.transcript.components(separatedBy: " ")
        if parts.count == 4 {
            let result = "\(parts[1])\(parts[2])"
            print("Result article : \(result)")
            resultLabel.label.text = result
        } else {
            print("Error: Not such code")
            resultLabel.label.text = "Error: Invalid code format"
        }
    }
}
