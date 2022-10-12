//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.rowHeight = UITableView.automaticDimension
        //        tableView.estimatedRowHeight = 44
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        //        tableView.tableHeaderView = UITableViewHeaderFooterView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let habitsViewController = HabitsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        activateView()
        //        view.backgroundColor = .magenta
        //        self.title = habitsViewController.Habit
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(sendToInfoVC(sender:)))
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Сегодня", style: .done, target: self, action: Selector?)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Название привычки"
        navigationController?.navigationBar.tintColor = .habitViolet
        navigationItem.titleView?.tintColor = .systemGray2
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = createEditBarButton(#selector(goToHabitViewController))
    }
    
    private func createEditBarButton(_ action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setTitle("Править", for: .normal)
        button.setTitleColor(.habitViolet, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    private func setupView() {
        view.addSubview(tableView)
    }
    
    private func activateView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    @objc func goToHabitViewController() {
        let didTapButton = HabitViewController(addOrEditHabit: "edit")
        self.navigationController?.pushViewController(didTapButton, animated: true)
        }
    }

extension HabitDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "АКТИВНОСТЬ"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        cell.textLabel?.text = HabitsStore.shared.dates[indexPath.row].description
//        Даты с момента установки приложения с разницей в один день.
//        public var dates: [Date] {
//            guard let startDate = userDefaults.object(forKey: "start_date") as? Date else {
//                return []
//            }
//            return Date.dates(from: startDate, to: .init())
//        }
        
        return cell
    }
}
    


