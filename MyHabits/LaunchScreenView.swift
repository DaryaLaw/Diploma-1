//
//  LaunchScreen.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class LaunchScreenView: UIView {

    private lazy var launchScreenImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 27
        imageView.image = UIImage(named: "AppIcon-1024px")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var launchScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "MyHabits"
        label.textAlignment = .center
        label.textColor = .habitViolet
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
       addSubview(launchScreenImageView)
        addSubview(launchScreenLabel)
    }
    
        private func activateView() {
        NSLayoutConstraint.activate([
            launchScreenImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            launchScreenImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            launchScreenImageView.heightAnchor.constraint(equalToConstant: 120),
            launchScreenImageView.widthAnchor.constraint(equalToConstant: 120),
                
            launchScreenLabel.topAnchor.constraint(equalTo: self.launchScreenImageView.bottomAnchor, constant: 246),
            launchScreenLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            launchScreenLabel.widthAnchor.constraint(equalToConstant: 90)
            ])
        }
}
