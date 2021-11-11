//
//  CustomContainers.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 19/9/21.
//

/*GRIDS

 */
import SwiftUI

// MARK: 1 GridStack
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach( 0 ..< self.rows) { row in
                HStack {
                    ForEach( 0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    //MARK: 2 view builders
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}



struct CustomContainers: View {
    //MARK: 3 Grid
    let gridItemAdaptative = [GridItem(.adaptive(minimum: 70))]
    let gridItemFixed = [GridItem(.fixed(10)),GridItem(.fixed(10)),GridItem(.fixed(10))]
    let gridItemFlexible = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    let gridItemArray: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    
    var body: some View {
        ScrollView {
            Section {
                VStack {
                    // 1
                    GridStack(rows: 4, columns: 4) { row, col in
                        HStack{
                            Image(systemName: "\(row * 4 + col).circle")
                                .foregroundColor(amarillo)
                                .padding()
                        }
                    }
                    // 2
                    GridStack(rows: 6, columns: 6) { row, col in
                        Image(systemName: "\(row * 6 + col).square")
                            .foregroundColor(verde)
                            .padding(5)
                    }
                    // 3
                    
                    LazyVGrid(columns: gridItemAdaptative, alignment: .center, spacing: 5) {
                        ForEach( 0 ..< 24 ) { grid in
                            Image(systemName: "\(grid).circle.fill")
                                .foregroundColor(granate)
                        }
                    }
                    
                    LazyVGrid(columns: gridItemFixed, alignment: .center, spacing: 10) {
                        ForEach( 0 ..< 6) { grid in
                            Image(systemName: "\(grid).square.fill")
                                .foregroundColor(naranja)
                        }
                    }
                    LazyVGrid(columns: gridItemFlexible, alignment: .leading, spacing: 5) {
                        ForEach( 0 ..< 12) { grid in
                            Image(systemName: "arrow.forward")
                                .foregroundColor(rojizo)
                                .padding(5)
                        }
                    }
                    LazyVGrid(columns: gridItemArray, alignment: .trailing, spacing: 10) {
                        ForEach( 0 ..< 3){ grid in
                            Image(systemName: "strikethrough")
                                .foregroundColor(amarillo)
                                .padding()
                        }
                    }
                    
                    LazyHGrid(rows: gridItemAdaptative, alignment: .bottom, spacing: 20) {
                        ForEach( 0 ..< 1) { grid in
                            Image(systemName: "\(grid).circle")
                                .foregroundColor(verde)
                            
                        }
                    }
                }
                Section {
                    LazyVStack(content: {
                        ForEach(1...10, id: \.self) { count in
                            Image(systemName: "\(count).circle.fill")
                                .foregroundColor(granate)
                        }
                    })
                    
                    LazyHStack(content: {
                        ForEach(1...9, id: \.self) { count in
                            HStack {
                                Text("\(Image(systemName: "multiply"))\(count)")
                            }
                            .font(.system(size: CGFloat(count * 10)))
                        }
                    })
                }
            }
        }
    }
}


struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainers()
    }
}
