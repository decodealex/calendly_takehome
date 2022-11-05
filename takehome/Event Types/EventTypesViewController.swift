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
        viewModel.viewLoaded()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.pinEdgesToParent()

        tableView.separatorStyle = .none

        tableView.register(EventTypeTableViewCell.self)

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension EventTypesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTypeTableViewCell = tableView.dequeueReusableCell(indexPath)
        cell.nameLabel.text = viewModel.name(for: indexPath)
        cell.colorView.backgroundColor = viewModel.color(for: indexPath)?.color ?? .clear
        return cell
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
