//
//  Ch02_3_Image.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_3_Image: View {
    var body: some View {
        //        Example01()
        //        Example02()
        //        Example03()
        //        Example04()
        //        Example05()
        //        Example06()
        //        Example07()
        //        Example08()
        //        Example09()
        Example10()
        
    }
}

private extension Ch02_3_Image {
    // MARK: Example 01
    
    /// 프레임 수식어만으로는 이미지의 크기가 변화하지 않습니다.
    struct Example01: View {
        var body: some View {
            HStack {
                //        let imageView = UIImageView()
                //        imageView.image = UIImage(named: "SwiftUI")
                Image("SwiftUI")
                    .background(Color.red)
                Image("SwiftUI")
                    .background(Color.yellow)
                    .frame(width: 50, height: 50)
                Image("SwiftUI")
                    .background(Color.green)
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    // MARK: Example 02
    
    /// resizable 수식어는 부모 뷰가 제공하는 공간에 맞게 이미지 크기를 조정합니다.
    /// 비율과 크기는 콘텐츠 모드에 따라 달라질 수 있습니다.
    struct Example02: View {
        var body: some View {
            VStack(spacing: 80) {
                HStack {
                    //                    Error
                    //                    Image("SwiftUI")
                    //                        .frame(width: 50, height: 50)
                    //                        .resizable()
                    
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                HStack {
                    //                    Image(systemName: "house")
                    Image("SwiftUI")
                        .resizable(capInsets: .init(top: 0, leading: 90, bottom: 0, trailing: 0))
                        .background(Color.red)
                        .frame(width: 150, height: 150)
                    
                    Image("SwiftUI")
                        .resizable(resizingMode: .tile)
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
    
    // MARK: Example 03
    
    /// scaledToFit, scaledToFill 수식어를 이용해 콘텐츠 모드를 변경할 수 있습니다.
    struct Example03: View {
        var body: some View {
            HStack(spacing: 30) {
                
                //기본값 scaletofill
                //비율과 관계없이 가득채우도록 늘어남
                Image("SwiftUI").resizable()
                    .frame(width: 100, height: 150)
                    .background(Color.red)
                
                //원본비율유지 최대크기늘어남
                //최대크기는 너비와 높이중 작은값
                Image("SwiftUI").resizable()
                    .scaledToFit() //aspect fit
                    .frame(width: 50, height: 150)
                    .background(Color.red)
                
                //원본비율유지 최대크기늘어남
                //최대크기는 너비와 높이중 큰값
                Image("SwiftUI").resizable()
                    .scaledToFill() //aspect fill
                    .frame(width: 100, height: 200)
                    .clipped() //cliptobounds
                    .background(Color.red)
            }
        }
    }
    
    // MARK: Example 04
    
    /// aspectRatio를 통해 세부적인 비율 조정이 가능합니다.
    struct Example04: View {
        var body: some View {
            HStack(spacing: 30) {
                Image("SwiftUI").resizable()
                    .aspectRatio(CGSize(width: 1.6, height: 1), contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .background(Color.red)
                
                Image("SwiftUI").resizable()
                    .aspectRatio(0.7, contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .background(Color.red)
            }
        }
    }
    
    // MARK: Example 05
    
    /// clipShape - 지정한 Shape의 모습으로 이미지 잘라내기
    struct Example05: View {
        var body: some View {
            HStack(spacing: 20) {
                Image("SwiftUI").clipShape(Circle())
                    .background(Color.red)
                
                Image("SwiftUI").clipShape(
                    Rectangle().inset(by: 10)
                )
                .background(Color.red)
                
                Image("SwiftUI").clipShape(
                    //타원
                    Ellipse().path(in: CGRect(x: 10, y: 30, width: 70, height: 100))
                )
                .background(Color.red)
            }
        }
    }
    
    // MARK: Example 06
    
    /// original / template 렌더링 모드를 지정해 줄 수 있습니다.
    struct Example06: View {
        var body: some View {
            HStack {
                Image(systemName: "star.circle")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.yellow)
                
                Image(systemName: "star.circle")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.yellow)
            }
            .foregroundColor(.red)
        }
    }
    
    // MARK: Example 07
    
    /// SF Symbol은 Image(systemName:) 생성자를 사용합니다.
    struct Example07: View {
        var body: some View {
            HStack(spacing: 20) {
                Image(systemName: "star.circle")
                Image(systemName: "star.circle.fill")
            }
        }
    }
    
    // MARK: Example 08
    
    /// imageScale을 이용하면 크기를 변경할 수 있습니다.
    struct Example08: View {
        var body: some View {
            HStack(spacing: 30) {
                Image(systemName: "book.fill").imageScale(.small)
                    .foregroundColor(.red)
                Image(systemName: "book.fill").imageScale(.medium)
                    .foregroundColor(.green)
                Image(systemName: "book.fill").imageScale(.large)
                    .foregroundColor(.blue)
            }
        }
    }
    
    // MARK: Example 09
    
    /// font를 이용해 심벌의 크기를 조절 가능합니다.
    struct Example09: View {
        var body: some View {
            HStack(spacing: 30) {
                Image(systemName: "speaker.3").font(.body)
                Image(systemName: "speaker.3").font(.title)
                Image(systemName: "speaker.3").font(.system(size: 40))
                Image(systemName: "speaker.3").imageScale(.large).font(.system(size: 40))
            }
        }
    }
    
    // MARK: Example 10
    
    /// fontWeight를 이용해 심벌의 굵기를 조절 가능합니다.
    struct Example10: View {
        var body: some View {
            HStack(spacing: 30) {
                Image(systemName: "arrow.up").font(Font.title.weight(.black))
                Image(systemName: "arrow.left").font(Font.title.weight(.semibold))
                Image(systemName: "arrow.down").font(Font.title.weight(.light))
                Image(systemName: "arrow.right").font(Font.title.weight(.ultraLight))
            }
        }
    }
}


// MARK: - Previews

struct Ch02_3_Image_Previews: PreviewProvider {
    static var previews: some View {
        Ch02_3_Image()
            .previewDisplayName("Sweet SwiftUI")
    }
}
