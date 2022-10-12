//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var infoView: InfoView {
        self.view as! InfoView
    }
    
    override func loadView() {
        super.loadView()
        self.view = InfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addInfo()
    }
    

    func addInfo() {
        if let rtfPath = Bundle.main.url(forResource: "Information", withExtension: "rtf") {
                do {
                    let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                    self.infoView.infoTextView.attributedText = attributedStringWithRtf
                } catch let error {
                    print("Got an error \(error)")
                }
            }
        }
}
