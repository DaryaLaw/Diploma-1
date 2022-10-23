//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Darya on 01.09.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    private var habitColor: UIColor = .clear
    
    private var addOrEditHabit: String
    private var habitView: HabitView? {
        if let view = self.view as? HabitView {
            return view
        }
        return nil
    }
    
    init(addOrEditHabit: String) {
        self.addOrEditHabit = addOrEditHabit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = HabitView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        habitView?.deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        configureColorButton()
    }
    
    private func configureView() {
        switch addOrEditHabit {
        case "add":
            setupNavigationBar("Создать")
            habitView?.deleteButton.isHidden = true
        case "edit":
            setupNavigationBar("Править")
        default:
            print("error configure view")
        }
    }
    
    private func setupNavigationBar(_ title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .habitViolet
        navigationItem.titleView?.tintColor = .systemGray2
        navigationItem.leftBarButtonItem?.title = "Отменить"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = createEditBarButton(#selector(saveHabit))
        
    }
    
    @objc func saveHabit() {
        guard let text = habitView?.nameTextField.text else {return}
        guard let date = habitView?.timeDatePicker.date else {return}
        let newHabit = Habit(name: text, date: date, color: habitColor)
        HabitsStore.shared.habits.append(newHabit)
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.popViewController(animated: true)
    }
    
    private func createEditBarButton(_ action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.habitViolet, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    @objc func didTapDeleteButton() {
//        self.deleteButton(animated: true)
//        self.navigationController?.popViewController(animated: true)
        
        let alertController = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку () ?", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let secondAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Do not accept")
        }

        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
    
    private func configureColorButton() {
        habitView?.selectColorButton.addTarget(self, action: #selector(actionColorButton), for: .touchUpInside)
    }
    @objc func actionColorButton() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true)
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.habitColor = color
        habitView?.selectColorButton.backgroundColor = color 
    }
}
