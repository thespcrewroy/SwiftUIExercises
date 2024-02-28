//
//  ContentView.swift
//  candidates
//
//  Created by Swapnil Roy on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    
    let candidateNames = ["Jeb Bush", "Ben Carson", "Lincoln Chafee", "Chris Christie", "Hillary Clinton", "Ted Cruz", "Carly Fiorina", "Jim Gilmore", "Lindsey Graham", "Bobby Jindal", "John Kasich", "Lawrence Lessig", "Martin O'Malley", "George Pataki", "Rand Paul", "Rick Perry", "Marco Rubio", "Bernie Sanders", "Rick Santorum", "Donald Trump", "Scott Walker", "Jim Webb"]
    
    
    let candidatePix = ["bush", "carson", "chafee", "christie", "clinton", "cruz", "fiorina", "gilmore", "graham", "jindal", "kasich", "lessig", "omalley", "pataki", "paul", "perry", "rubio", "sanders", "santorum", "trump", "walker", "webb"]
    
    let candidateInfo = ["Supposedly, the smart Bush brother", "Former Bran surgeon, or something like that", "A senator from Rhode Island. Whatever!", "Former Governor of New Jersey who seems kind of mean", "We all know who Hillary is", "He looks way more honest with a beard. Almost lost a Texas senate ract to Beto", "Former Tech executive who wanted to be president", "American politician, diplomat and former attorney who was the 68th Governor of Virginia from 1998 to 2002 and Chairman of the Republican National Committee in 2001", "A Republican senator from North Carolina who didn't like Trump until he became president.", "Former Governor of Louisiana", "Former governor of Ohio", "an American academic, attorney, and political activist. He is the Roy L. Furman Professor of Law at Harvard Law School and the former director of the Edmond J. Safra Center for Ethics at Harvard University.", "A former mayor of Baltimore and governor of Maryland. A character in the TV show The Wire was based on him", "an American lawyer and Republican politician who served as the 53rd Governor of New York.", "This politicion was tackled by his next door neighbor who was angry about brush being left on his property. Broke his ribs and messed him up pretty good", "Former Governor or Texas. People suspect that he may be all that bright", "Florida Senator. I'm not sure what else to say other than that his parents were born in Cuba", "This guy could well have been president. We all know Bernie", " A member of the Republican Party, he served as a United States Senator from Pennsylvania from 1995 to 2007 and was the Senate's third-ranking Republican from 2001 to 2007.", "Words fail me", "the 44th Governor of Wisconsin from 2011 to 2019.", "Former Naval officer and proficient boxer who later became senator. Among other accomplishments he lost a boxing match to Oliver North at the Naval Academy"]
    
    var body: some View {
        NavigationView {
            List(0 ..< self.candidateNames.count) { item in
                NavigationLink(destination: VStack {
                    Image(candidatePix[item])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text(self.candidateNames[item])
                        .font(.largeTitle)
                    
                    Text(self.candidateInfo[item])
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                }) {
                    HStack {
                        Text(self.candidateNames[item])
                            .font(.caption)
                        Spacer()
                        Image(self.candidatePix[item])
                    }
                }
            }
            .navigationTitle("Candidates")
            .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
