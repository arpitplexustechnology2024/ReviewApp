//
//  ViewController.swift
//  ReviewApp
//
//  Created by Arpit iOS Dev. on 30/05/24.
//

import UIKit
import StoreKit

var BaseURL = ""
var AppName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnShareAppTapped(_ sender: UIButton) {
        print("Tapped Share", AppName ?? "")
        guard let appName = AppName else { return }
        self.share(items: [appName, URL.init(string: BaseURL) as Any])
    }
    
    @IBAction func btnReviewAppTapped(_ sender: UIButton) {
        rateUs()
    }
    
    func rateUs() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            print(" - - - - - - Rating view in not present - - - -")
        }
    }
    
    func share(items : [Any]) {
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        self.present(activityController, animated: true, completion: nil)
    }

}

