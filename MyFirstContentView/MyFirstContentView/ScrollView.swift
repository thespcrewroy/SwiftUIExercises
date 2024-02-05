//
//  ScrollView.swift
//  MyFirstContentView
//
//  Created by NMI Class on 2/5/24.
//

import SwiftUI

struct ScrollViewer: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: true) {
            HStack {
                Group {
                    Card (
                        thetitle: "Grand Canyon",
                        theimage: "grandcanyon"
                    )
                    Divider()
                    Card (
                        thetitle: "Grand Canyon",
                        theimage: "grandcanyon"
                    )
                    Divider()
                    Card (
                        thetitle: "Grand Canyon",
                        theimage: "grandcanyon"
                    )
                    Divider()
                    Card (
                        thetitle: "Grand Canyon",
                        theimage: "grandcanyon"
                    )
                }
            }
        }
    }
}

#Preview {
    ScrollViewer()
}
