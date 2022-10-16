//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: "ProgressCell")
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: "HabitCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .habitLightestGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        activateView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        let rightButton = createRightBarButton(#selector(goToHabitViewController))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func createRightBarButton(_ action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .habitViolet
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: action, for: .touchUpInside)
        button.bounds = CGRect(x: 0, y: 0, width: 25, height: 25)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    private func setupView() {
        view.addSubview(collectionView)
    }
    
    private func activateView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func goToHabitViewController() {
        let didTapButton = HabitViewController(addOrEditHabit: "add")
        self.navigationController?.pushViewController(didTapButton, animated: true)
    }
    
//    @objc func checkHabit(habit: Habit) {
//        habit.isAlreadyTakenToday = true
//        let text = habit.name
//        let bool = habit.isAlreadyTakenToday
//        print("\(text)  --- \(bool)")
//        }
    
}

// MARK: Заполнение коллекции данными

extension HabitsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return HabitsStore.shared.habits.count
        default:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionIndex = indexPath.section
        switch sectionIndex {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCell", for: indexPath) as? ProgressCollectionViewCell {
                cell.layer.cornerRadius = 10
                cell.progressView.progress = HabitsStore.shared.todayProgress
                cell.percentLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitCell", for: indexPath) as? HabitCollectionViewCell {
                cell.layer.cornerRadius = 10
                cell.habitNameLabel.text = HabitsStore.shared.habits[indexPath.item].name
                cell.timeToDoHabitLabel.text = HabitsStore.shared.habits[indexPath.item].dateString
                cell.color = HabitsStore.shared.habits[indexPath.item].color
                let habit = HabitsStore.shared.habits[indexPath.item]
//                cell.checkButton.addTarget(self, action: #selector(checkHabit(habit: habit)), for: .touchUpInside)
                return cell
            }
        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
}
    
    // MARK: Размеры и днйствия с ячейками коллекции
    
    extension HabitsViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch indexPath.section {
            case 0: return CGSize(width: self.view.frame.width - 32, height: 60)
            case 1: return CGSize(width: self.view.frame.width - 32, height: 130)
            default: return CGSize(width: self.view.frame.width - 32, height: 60)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            switch indexPath.section {
            case 1:
                let viewController = HabitDetailsViewController()
                navigationController?.navigationBar.prefersLargeTitles = false
                navigationController?.pushViewController(viewController, animated: true)
            default:
                print("error section")
            }
            
        }
        
        func collectionView(_ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumInteritemSpacingForSectionAt section: Int
        ) -> CGFloat {
          return 12
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)
        }
        
    }
