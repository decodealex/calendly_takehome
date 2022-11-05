//
//  EventTypesViewModel.swift
//  takehome
//
//

import Foundation

@MainActor
class EventTypesViewModel {
    
    var refreshable: Refreshable?
    
    private var accountRepo: AccountRepositoryProtocol
    private var eventTypesRepo: EventTypeRepositoryProtocol
    
    private var account: Account?
    private var eventTypes: [EventType] = []
    
    private var displayError: Bool = false
    
    var rowCount: Int {
        return eventTypes.count
    }

    func viewLoaded() {
        Task {
            do {
                account = try await accountRepo.getAccount()
                eventTypes = try await eventTypesRepo.getEventTypes(account?.uri ?? "")
                refreshable?.refresh()
                displayError = false
            }
            catch {
                displayError = true
            }
        }
    }

    func name(for indexPath: IndexPath) -> String {
        guard eventTypes.count > indexPath.row else { return "" }
        return eventTypes[indexPath.row].name
    }

    func color(for indexPath: IndexPath) -> String? {
        guard eventTypes.count > indexPath.row else { return nil }
        return eventTypes[indexPath.row].color
    }

    init(_ accountRepo: AccountRepositoryProtocol = AccountRepository(),
         _ eventTypesRepo: EventTypeRepositoryProtocol = EventTypeRepository()) {
        self.accountRepo = accountRepo
        self.eventTypesRepo = eventTypesRepo
    }
}
