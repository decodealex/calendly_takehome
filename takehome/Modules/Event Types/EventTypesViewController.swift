//
//  EventTypesViewController.swift
//  takehome
//
//

import UIKit

class EventTypesViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)
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
        tableView.backgroundColor = .systemBackground

        tableView.separatorStyle = .none
        tableView.allowsSelection = false 

        tableView.register(EventTypeTableViewCell.self)

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc private func handleRefresh() {
        viewModel.fetchData(userInitiated: true)
    }
    
    @objc private func presentSafariView(with url: String) {
        
    }
}

extension EventTypesViewController: UITableViewDataSource {
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let account = viewModel.getAccount() else { return nil }
        let header = EventTypesHeaderView()
        header.setupWith(account)
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTypeTableViewCell = tableView.dequeueReusableCell(indexPath)
        cell.setupWith(viewModel.event(for: indexPath))
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let name = viewModel.getAccount()?.name else { return }
        let offsetY = scrollView.contentOffset.y
        title = offsetY > (-80) ? name : "Event Type"
    }

}

extension EventTypesViewController: UITableViewDelegate {
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension EventTypesViewController: Refreshable {
    //MARK: - Refreshable
    func refresh() {
        tableView.reloadData()
    }
}

extension EventTypesViewController: EventTypesViewModelDelegate {
    //MARK: - EventTypesViewModelDelegate
    func refreshEnded() {
        tableView.refreshControl?.endRefreshing()
    }
    
    func displayError() {
        
    }
    
    func openLink(_ link: URL) {
        presentSafariVC(with: link)
    }
}

extension EventTypesViewController: EventTypeTableViewCellDelegate {
    //MARK: - EventTypeTableViewCellDelegate
    func didTapBookingPageButton(_ sender: EventTypeTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: sender) else { return }
        viewModel.didTapBookingPageButton(at: indexPath)
    }
}

extension EventTypesViewController: EventTypesHeaderViewDelegate {
    //MARK: - EventTypesHeaderViewDelegate
    func didTapLink() {
        viewModel.didTapHeaderLink()
    }
}

protocol Refreshable { func refresh() }
