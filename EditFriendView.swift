//
//  EditFriendView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct EditFriendView: View {
    var friend: Friend
    @State private var newName: String
    @State private var newBirthday: Date
    @Environment(\.dismiss) private var dismiss // new
    init(friend: Friend) { // new
        self.friend = friend // new
        _newName = State(initialValue: friend.name) // new
        _newBirthday = State(initialValue: friend.birthday) // new
    } // new
    
    var body: some View {
        Form {
            TextField("Name", text: $newName)
            DatePicker("Birthday", selection: $newBirthday, displayedComponents: .date)
        }
        .navigationTitle("Edit Friend") // new
        .navigationBarTitleDisplayMode(.inline) // new
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                        dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) { // new
                    Button("Save") { // new
                            friend.name = newName // new
                                friend.birthday = newBirthday // new
                        dismiss() // new
                    } // new
                } // new
        }

    }
}

#Preview {
    NavigationStack { // new
        EditFriendView(friend: Friend(name: "Test", birthday: Date.now))
    } // new
}
