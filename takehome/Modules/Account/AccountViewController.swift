//
//  AccountViewController.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
import SwiftUI

class AccountViewController: UIHostingController<AccountView> {
    
    private let viewModel = AccountViewModel()
    
    required init?(coder aDecoder: NSCoder){
        viewModel.fetchData()
        super.init(coder: aDecoder, rootView: AccountView())
    }
    
}
