//
//  MainComposeVCD + ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 29.05.2023.
//

import UIKit
import MessageUI

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    //TODO: Change appID !!!
    #warning("CHANGE APP ID")
    @objc func rateButtonTapped() {
        let appleID = "1287000522"
        guard let url = URL(string: "itms-apps://itunes.apple.com/app/id\(appleID)?mt=8&action=write-review") else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func sendEmailAboutABug() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([Helpers.Strings.EmailReport.email])
            mail.setMessageBody(Helpers.Strings.EmailReport.messageBody, isHTML: true)
            mail.setSubject(Helpers.Strings.EmailReport.subject)
            
            present(mail, animated: true)
        } else {
            print("Error: Sending emails is not enabled in settings")
            
            let ac = UIAlertController(title: "Error", message: "Enable email sending in settings", preferredStyle: .alert)
            let settingAction = UIAlertAction(title: "Settings", style: .default) { action in
                UIApplication.shared.open(URL(string: "App-prefs:ACCOUNT_SETTINGS")!, options: [:], completionHandler: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            ac.addAction(settingAction)
            ac.addAction(cancelAction)
            
            ac.preferredAction = settingAction
            
            present(ac, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
}
