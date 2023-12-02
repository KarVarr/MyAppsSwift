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
        
        descriptionTextView.textView.text = Helper.Strings.AddNewTaskVC.textViewPlaceholder.trimmingCharacters(in: .whitespacesAndNewlines)
        descriptionTextView.textView.backgroundColor = Helper.Colors.palePink
        descriptionTextView.textView.textColor = Helper.Colors.placeholder
        descriptionTextView.textView.font = Helper.Fonts.ChalkboardSERegular(with: 18)
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == Helper.Strings.AddNewTaskVC.textViewPlaceholder {
            descriptionTextView.textView.text = ""
            descriptionTextView.textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            descriptionTextView.textView.text = Helper.Strings.AddNewTaskVC.textViewPlaceholder
            descriptionTextView.textView.textColor = Helper.Colors.placeholder
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 140
    }
    
}

