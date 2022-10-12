//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var color: UIColor = .white
    
    private(set) lazy var habitNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = color
        label.text = "Название привычки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var timeToDoHabitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.text = "Каждый день в 17:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemGray2
        label.text = "Счетчик: 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("V", for: .selected)
        button.setTitleColor(.white, for: .selected)
        button.clipsToBounds = true
        //button.addTarget(self, action: action, for: .touchUpInside)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = CGColor(red: 41.0/255.0, green: 109.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        button.bounds = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.backgroundColor = color
        button.layer.cornerRadius = 18
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func checkHabit() {
        checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        activateViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        addSubview(habitNameLabel)
        addSubview(timeToDoHabitLabel)
        addSubview(countLabel)
        addSubview(checkButton)
    }
    
    func activateViews() {
        NSLayoutConstraint.activate([
            habitNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitNameLabel.widthAnchor.constraint(equalToConstant: 220),
            habitNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            timeToDoHabitLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 4),
            timeToDoHabitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            timeToDoHabitLabel.heightAnchor.constraint(equalToConstant: 18),
            timeToDoHabitLabel.widthAnchor.constraint(equalToConstant: 150),
            
            countLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 30),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            countLabel.widthAnchor.constraint(equalToConstant: 188),
            
            checkButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 46),
            checkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            checkButton.heightAnchor.constraint(equalToConstant: 36),
            checkButton.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
}
