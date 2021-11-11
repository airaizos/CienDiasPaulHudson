//
//  RatingView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 9/11/21.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
            
        }
    }
    
    
    func image(for number: Int) -> Image {
        /*
         If the number that was passed in is greater than the current rating, return the off image if it was set, otherwise return the on image.
         If the number that was passed in is equal to or less than the current rating, return the on image.
         */
        
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
