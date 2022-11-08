//
//  EventTypesViewController.swift
//  takehome
//
//

import UIKit

class EventTypesViewController: UIViewController {

    private let tableView = UITableView()
    private let viewModel = EventTypesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.refreshable = self
        viewModel.delegate = self
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchData()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.pinEdgesToParent()

        tableView.separatorStyle = .none

        tableView.register(EventTypeTableViewCell2.self)

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc private func handleRefresh() {
        viewModel.fetchData(userInitiated: true)
    }
}

extension EventTypesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTypeTableViewCell2 = tableView.dequeueReusableCell(indexPath)
        cell.setupWith(viewModel.event(for: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

}

extension EventTypesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

protocol Refreshable { func refresh() }

extension EventTypesViewController: Refreshable {
    func refresh() {
        tableView.reloadData()
    }
}

extension EventTypesViewController: EventTypesViewModelDelegate {
    func refreshEnded() {
        tableView.refreshControl?.endRefreshing()
    }
    
    func displayError() {
        
    }
}
