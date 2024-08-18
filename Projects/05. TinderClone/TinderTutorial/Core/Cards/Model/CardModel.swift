//
//  Title: CardModel.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Model for a card.
//

import Foundation

/**
    A data structure representing a card model.
*/
struct CardModel { // struct to represent a card model
    let user: User // user data
} /// CardModel

/**
    Extension to make the card model identifiable and hashable.
*/
extension CardModel: Identifiable, Hashable {
    var id: String { // id
        return user.id // return the user id
    } /// id
} /// Identifiable
