//
//  GroupsViewController.swift
//  GB.CreateApp.Homework1
//
//  Created by Анастасия Рябова on 30.06.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [Group] = []
    private let fileCache = FileCache()

    override func viewDidLoad() {
        super.viewDidLoad()
        models = fileCache.fetchGroups()
        tableView.reloadData()
        title = "Groups"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        tableView.register(GroupCell.self, forCellReuseIdentifier: "GroupCell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        getGroups()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }
    
    func getGroups() {
        networkService.getGroups { [weak self] result in
            switch result {
            case .success(let groups):
                self?.models = groups
                self?.fileCache.addGroups(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchGroups() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    
    @objc private func update() {
        networkService.getGroups { [weak self] result in
            switch result {
            case .success(let groups):
                self?.models = groups
                self?.fileCache.addGroups(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchGroups() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
        
}

extension GroupsViewController {
    func showAlert() {
        let date = DateHelper.getDate(date: fileCache.fetchGroupDate())
        let alert = UIAlertController(title: "Не удалось получить данные",
                                      message: "Данные актуальны на \(date)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
