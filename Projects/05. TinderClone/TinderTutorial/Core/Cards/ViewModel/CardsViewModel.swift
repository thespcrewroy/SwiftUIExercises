//
//  Title: CardsViewModel.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: View model for the card stack view.
//
//  Variable Type Descriptions:
//  - MainActor: An actor that runs on the main thread.
//  - ObservableObject: A class that can be observed by a view and notifies the view when the object changes.
//  - Published: A property wrapper that publishes the changes of the property.
//  - CardModel: A data structure representing a card model.
//

import Foundation

/**
    A view model for the card stack view.

    @param cardModels: The card models.
    @param buttonSwipeAction: The swipe action for the buttons.
    @param service: The card service.
*/
@MainActor
class CardsViewModel: ObservableObject { // class to handle the card view model
    
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    private let service: CardService
    
    /**
        Initializes the view model with the card service.
     
        @param service: The card service.
    */
    init(service: CardService) { // initializer
        self.service = service // set the service
        Task { // run the task
            await fetchCardModels() // fetch the card models
        } /// Task
    } /// init
    
    /**
        Function to fetch card models.
    */
    func fetchCardModels() async {
        do { // do
            self.cardModels = try await service.fetchCardModels() // fetch the card models
        } catch { // catch
            print("DEBUG: Failed to fetch cards with error: \(error)") // print error
        } /// catch
    } /// fetchCardModels
    
    /**
        Function to handle removing the card after swiping.
     
        @param action: The swipe action.
    */
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { // guard
            $0.id == card.id // if the card id parameter is eqial to the card id in the data structure
        }) else { // or if the card id is not found in the data structure
            return // return (exit the function)
        } /// guard
        cardModels.remove(at: index) // remove the card from the data structure
    } /// removeCard
} /// CardsViewModel
