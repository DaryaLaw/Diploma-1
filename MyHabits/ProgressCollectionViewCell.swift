//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
        
    private lazy var encouragingTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Все получится!"
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .left
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .right
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = .habitViolet
        progressView.trackTintColor = .systemGray2
        progressView.layer.cornerRadius = 8
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    //Прогресс выполнения добавленных привычек. Привычка считается выполненной, если пользователь добавлял время больше 5 раз.
    //Возвращает значение от 0 до 1.
//    public var todayProgress: Float {
//        guard habits.isEmpty == false else {
//            return 0
//        }
//        let takenTodayHabits = habits.filter { $0.isAlreadyTakenToday }
//        return Float(takenTodayHabits.count) / Float(habits.count)
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        activateView()
        backgroundColor = .white
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        activateView()
        backgroundColor = .white
    }

    private func setupView() {
        addSubview(encouragingTextLabel)
        addSubview(percentLabel)
        addSubview(progressView)
    }
    
    private func activateView() {
        NSLayoutConstraint.activate([
            encouragingTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            encouragingTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            encouragingTextLabel.heightAnchor.constraint(equalToConstant: 18),
            encouragingTextLabel.widthAnchor.constraint(equalToConstant: 216),
            
            percentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            percentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            percentLabel.heightAnchor.constraint(equalToConstant: 18),
            percentLabel.widthAnchor.constraint(equalToConstant: 95),
            
            progressView.topAnchor.constraint(equalTo: encouragingTextLabel.bottomAnchor, constant: 10),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 320),
            progressView.heightAnchor.constraint(equalToConstant: 7)
            ])
    }
}
