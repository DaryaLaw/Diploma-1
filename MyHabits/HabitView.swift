//
//  CreateEditHabitsView.swift
//  MyHabits
//
//  Created by Darya on 01.09.2022.
//

import UIKit

class HabitView: UIView {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "НАЗВАНИЕ"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "ЦВЕТ"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private(set) lazy var selectColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .habitLightestGray
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "ВРЕМЯ"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private(set) lazy var timeDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
//        datePicker.datePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var everydayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.text = "Каждый день в ()"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        activateView()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setupView()
        activateView()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(colorLabel)
        addSubview(selectColorButton)
        addSubview(timeLabel)
        addSubview(timeDatePicker)
        addSubview(everydayLabel)
        addSubview(deleteButton)
    }
    
        private func activateView() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 75),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            nameTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 7),
            nameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 22),
            
            colorLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorLabel.widthAnchor.constraint(equalToConstant: 40),
            colorLabel.heightAnchor.constraint(equalToConstant: 18),
            
            selectColorButton.topAnchor.constraint(equalTo: self.colorLabel.bottomAnchor, constant: 7),
            selectColorButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            selectColorButton.widthAnchor.constraint(equalToConstant: 30),
            selectColorButton.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: self.selectColorButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timeLabel.widthAnchor.constraint(equalToConstant: 60),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            
            everydayLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 7),
            everydayLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            everydayLabel.widthAnchor.constraint(equalToConstant: 200),
            everydayLabel.heightAnchor.constraint(equalToConstant: 22),
            
            timeDatePicker.topAnchor.constraint(equalTo: self.everydayLabel.bottomAnchor, constant: 15),
            timeDatePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: self.timeDatePicker.bottomAnchor, constant: 219),
            deleteButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            deleteButton.widthAnchor.constraint(equalToConstant: 220)
            
            ])
        }
}
