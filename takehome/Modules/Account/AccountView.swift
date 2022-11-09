//
//  AccountView.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import SwiftUI

struct AccountView: View {
    
    var account: Account = Account(
        uri: "https://api.calendly.com/users/ef1ddf97-4678-4acd-bd2c-6c0546852fa2",
        name: "Test User",
        avatarUrl: nil,
        schedulingUrl: "https://calendly.com/test_user",
        createdAt: Date.dateFrom("2022-09-02T19:49:55.236158Z")!,
        updatedAt: Date.dateFrom("2022-11-05T23:43:12.243979Z")!,
        timezone: "America/Los_Angeles",
        email: "test@gmail.com")
    
    
    var body: some View {
        Form {
            userInfoView
            Section(header: Text("User info")) {
                FormInfoRow(title: "Email:", value: account.email)
                FormInfoRow(title: "Timezone:", value: account.timezone)
            }
        }
    }
    
    var userInfoView: some View {
        return VStack(alignment: .leading, spacing: 5) {
            Image(uiImage: UIImage.letterImage(from: account.name))
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.gray.opacity(0.7))
                .frame(width: 70, height: 70)
                .overlay(
                    RoundedRectangle(cornerRadius: 70 / 2)
                        .stroke(.purple.opacity(0.7), lineWidth: 2)
                    )
                .padding(.bottom, 5)
            
            Text(account.name)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.primary)
            
            
            Link(destination: URL(string: account.schedulingUrl)!) {
                HStack(alignment: .center, spacing: 3) {
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 13))
                    Text(account.schedulingUrl.deletingPrefix("https://"))
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                }
            }

        }
    }
}

struct FormInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

extension Date {
    static func dateFrom(_ string: String) -> Date? {
        Date.iso8601FractionalSecondsFormatter.date(from: string)
    }
}
