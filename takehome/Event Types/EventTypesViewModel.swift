//
//  EventTypesViewModel.swift
//  takehome
//
//

import Foundation

protocol EventTypesViewModelDelegate: AnyObject {
    func refreshEnded()
    func displayError()
    func openLink(_ link: URL)
}

@MainActor
class EventTypesViewModel {
    
    var refreshable: Refreshable?
    
    private var accountRepo: AccountRepositoryProtocol
    private var eventTypesRepo: EventTypeRepositoryProtocol
    weak var delegate: EventTypesViewModelDelegate?
    
    private var account: Account?
    private var eventTypes: [EventType] = []
    
    private var displayError: Bool = false {
        didSet {
            guard displayError else { return }
            delegate?.displayError()
        }
    }
    
    var rowCount: Int {
        return eventTypes.count
    }

    func fetchData(userInitiated: Bool = false) {
        defer { delegate?.refreshEnded() }
        
        Task {
            do {
                if account == nil { account = try await accountRepo.getAccount() }
                eventTypes = try await eventTypesRepo
                    .getEventTypes(account?.uri ?? "")
                    .sorted(by: { $0.active && !$1.active })
                refreshable?.refresh()
                displayError = false
            } catch {
                displayError = true
            }
        }
    }

    func name(for indexPath: IndexPath) -> String {
        guard eventTypes.count > indexPath.row else { return "" }
        return eventTypes[indexPath.row].name
    }
    
    func event(for indexPath: IndexPath) -> EventType {
        return eventTypes[indexPath.row]
    }

    func color(for indexPath: IndexPath) -> String? {
        guard eventTypes.count > indexPath.row else { return nil }
        return eventTypes[indexPath.row].color
    }
    
    func getAccount() -> Account? {
        return account
    }
    
    func didTapBookingPageButton(at indexPath: IndexPath) {
        let link = eventTypes[indexPath.row].schedulingUrl
        guard let url = URL(string: link) else { return }
        delegate?.openLink(url)
    }
    
    
    func didTapHeaderLink() {
        guard let link = account?.schedulingUrl, let url = URL(string: link) else { return }
        delegate?.openLink(url)
    }

    init(_ accountRepo: AccountRepositoryProtocol = AccountRepository(),
         _ eventTypesRepo: EventTypeRepositoryProtocol = EventTypeRepository()) {
        self.accountRepo = accountRepo
        self.eventTypesRepo = eventTypesRepo
    }
}
