//
//  Title: CardService.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Service to fetch card models.
//

import Foundation

/**
    Service to fetch card models.
*/
struct CardService {
    /**
        Function to fetch card models.
     
        @throws An error of type `Error`.
        @return An array of `CardModel` with user data.
    */
    func fetchCardModels() async throws -> [CardModel] { // fetchCardModels
        let users = MockData.users // get the mock data
        return users.map({ // map the user mock data to card models
            CardModel(user:$0) // return the card model with the user data
        }) /// map
    } /// fetchCardModels
} /// CardService
