//
//  IphoneView.swift
//  AppShot
//
//  Created by Licardo on 2020/7/19.
//  Copyright © 2020 Licardo. All rights reserved.
//

import SwiftUI

struct IphoneView: View {
    @State private var image: NSImage? = nil
    @State private var screenSizeIndex = 0
    @State private var deviceIndex = 0
    @State private var deviceOffsetX: CGFloat = 0
    @State private var deviceOffsetY: CGFloat = 0
    @State private var deviceRotate: Double = 0
    @State private var mainTitle = "Main Title"
    @State private var mainTitleFont: CGFloat = 30
    @State private var mainTitleColor = Color.white
    @State private var mainTitleOffsetX: CGFloat = 0
    @State private var mainTitleOffsetY: CGFloat = 0
    @State private var subTitle = "Sub Title"
    @State private var subTitleFont: CGFloat = 20
    @State private var subTitleColor = Color.white
    @State private var subTitleOffsetX: CGFloat = 0
    @State private var subTitleOffsetY: CGFloat = 0
    @State private var bgColor = Color(.systemTeal)
    @State private var bgImage: NSImage? = nil
    
    var width: CGFloat {
        screenSizeIndex == 0 ? Size.iphone6_5.width : Size.iphone5_5.width
    }
    var height: CGFloat {
        screenSizeIndex == 0 ? Size.iphone6_5.height : Size.iphone5_5.height
    }
    
    var body: some View {
        HStack {
            InputImageView(deviceType: .iPhone, image: $image, screenSizeIndex: $screenSizeIndex, deviceIndex: $deviceIndex, deviceOffsetX: $deviceOffsetX, deviceOffsetY: $deviceOffsetY, deviceRotate: $deviceRotate, mainTitle: $mainTitle, mainTitleFont: $mainTitleFont, mainTitleColor: $mainTitleColor, mainTitleOffsetX: $mainTitleOffsetX, mainTitleOffsetY:  $mainTitleOffsetY, subTitle: $subTitle, subTitleFont: $subTitleFont, subTitleColor: $subTitleColor, subTitleOffsetX:  $subTitleOffsetX, subTitleOffsetY:  $subTitleOffsetY, bgColor: $bgColor, bgImage: $bgImage)
                .frame(width: width / 4, height: height / 4)
                .padding(.horizontal)
            
            Spacer()
            Divider()
            
            
            EditMenuView(deviceType: .iPhone, screenSizeIndex: $screenSizeIndex, deviceIndex: $deviceIndex, deviceOffsetX: $deviceOffsetX, deviceOffsetY: $deviceOffsetY, deviceRotate: $deviceRotate, mainTitle: $mainTitle, mainTitleFont: $mainTitleFont, mainTitleColor: $mainTitleColor, mainTitleOffsetX: $mainTitleOffsetX, mainTitleOffsetY:  $mainTitleOffsetY, subTitle: $subTitle, subTitleFont: $subTitleFont, subTitleColor: $subTitleColor, subTitleOffsetX:  $subTitleOffsetX, subTitleOffsetY:  $subTitleOffsetY, bgColor: $bgColor, bgImage: $bgImage)
        }
        .frame(minWidth: width / 4 + 320, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)
        .navigationTitle("iPhone")
        .toolbar {
            ToolbarItem {
                Button {
                    self.saveToFile()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                    Text("Export")
                }
            }
        }
    }
    
    private func saveToFile() {
        let image = InputImageView(deviceType: .iPhone, image: $image, screenSizeIndex: $screenSizeIndex, deviceIndex: $deviceIndex, deviceOffsetX: $deviceOffsetX, deviceOffsetY: $deviceOffsetY, deviceRotate: $deviceRotate, mainTitle: $mainTitle, mainTitleFont: $mainTitleFont, mainTitleColor: $mainTitleColor, mainTitleOffsetX: $mainTitleOffsetX, mainTitleOffsetY:  $mainTitleOffsetY, subTitle: $subTitle, subTitleFont: $subTitleFont, subTitleColor: $subTitleColor, subTitleOffsetX:  $subTitleOffsetX, subTitleOffsetY:  $subTitleOffsetY, bgColor: $bgColor, bgImage: $bgImage).asImage(width: width, height: height, format: .png)
        NSSavePanel.saveImage(image, completion: { _ in })
    }
}

struct IphoneView_Previews: PreviewProvider {
    static var previews: some View {
        IphoneView()
    }
}
