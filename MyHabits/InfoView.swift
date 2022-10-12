//
//  InfoView.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class InfoView: UIView {
    
    private(set) lazy var infoTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 17)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        activateView()
        backgroundColor = .white
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setupView()
        activateView()
        backgroundColor = .white
    }
    
    private func setupView() {
        addSubview(infoTextView)
    }
    
    private func activateView() {
        NSLayoutConstraint.activate([
            infoTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            infoTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            infoTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            infoTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
}
