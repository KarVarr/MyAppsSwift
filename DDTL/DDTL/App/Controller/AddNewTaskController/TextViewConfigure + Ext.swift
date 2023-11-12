//
//  TextViewConfigure + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 12.11.2023.
//

import UIKit

extension AddNewTaskViewController: UITextViewDelegate {
    
    func textViewConfigure() {
        descriptionTextView.textView.delegate = self
        
        let placeholder = "Describe your idea in detail here..."
        
        descriptionTextView.textView.text = placeholder
        descriptionTextView.textView.backgroundColor = Helper.Colors.palePink
        descriptionTextView.textView.textColor = Helper.Colors.placeholder
        descriptionTextView.textView.font = UIFont.systemFont(ofSize: 18)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Describe your idea in detail here..." {
            descriptionTextView.textView.text = ""
            descriptionTextView.textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            descriptionTextView.textView.text = "Describe your idea in detail here..."
            descriptionTextView.textView.textColor = Helper.Colors.placeholder
        }
    }
    
}

