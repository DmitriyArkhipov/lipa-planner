//
//  TrainListSkeleton.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 14.12.2021.
//

import SwiftUI
import SkeletonUI

struct TrainListSkeleton<Content: View>: View {
    let loading: Bool
    @ViewBuilder var contentView: Content
    
    var body: some View {
        Group() {
            if self.loading {
                LazyVStack {
                    TrainListSkeletonItem()
                        .padding([.leading, .trailing], 14.0)
                        .padding([.bottom], 10.0)
                    TrainListSkeletonItem()
                        .padding([.leading, .trailing], 14.0)
                        .padding([.bottom], 10.0)
                    TrainListSkeletonItem()
                        .padding([.leading, .trailing], 14.0)
                        .padding([.bottom], 10.0)
                    TrainListSkeletonItem()
                        .padding([.leading, .trailing], 14.0)
                        .padding([.bottom], 10.0)
                    TrainListSkeletonItem()
                }
            } else {
                contentView
            }
        }.transition(.slide).animation(.easeInOut)
    }
}

struct TrainListSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        TrainListSkeleton(
            loading: true
        ){
            LazyVStack {
                Text("Загружено")
            }
        }.preferredColorScheme(.dark)
    }
}
