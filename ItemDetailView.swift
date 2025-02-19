//
//  ItemDetailView.swift
//  NavigationDemo
//
//  Created by Brody on 8/22/24.
//

import SwiftUI

struct ItemDetailView: View {
  @State var quantityRemaining = Int.random(in: 1...10)
  let itemName: String
  
  var body: some View {
    VStack {
      Text("\(itemName)")
        .font(.title)
        .padding()
      Spacer()
      Image(systemName: "photo")
        .font(.system(size: 200))
        .padding()
      Text("Quantity Remaining: \(quantityRemaining)")
      Spacer()
      Button {
        if quantityRemaining > 0 {
          quantityRemaining -= 1
        }
      } label: {
        Text("Add one to your cart")
      }
      Spacer()
    }
    // .background() runs the view below in the background
    .background(
        // The navigation link is not active until the quantity is 0
        NavigationLink(destination: Text("You bought all the \(itemName)!"),
                       isActive: .constant(quantityRemaining == 0),
                       label: { EmptyView() })
    )
  }
}
#Preview {
    ItemDetailView(itemName: "Test Item")
}
