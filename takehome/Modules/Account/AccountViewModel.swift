//
//  AccountViewModel.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

@MainActor
class AccountViewModel {
    
    private var accountRepo: AccountRepositoryProtocol
    
    private var account: Account?
    
    func fetchData() {
        Task { account = try await accountRepo.getAccount() }
    }
    
    func getAccount() -> Account? {
        return account
    }
    
    init(_ accountRepo: AccountRepositoryProtocol = AccountRepository()) {
        self.accountRepo = accountRepo
    }
}
