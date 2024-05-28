//
//  ProfileView.swift
//  Profile
//
//  Created by Ivan on 10.04.2024.
//

import SwiftUI
import AppUI
import Platform

struct IntroView<ViewModel: IntroScreenViewModelProtocol>: View {
    
  @StateObject var viewModel: ViewModel
    
  @State var showWalktroughScreens: Bool = false
  @State var currentIndex: Int = 0
  @State var showRegistrationView: Bool = false
  @Binding var onBoardingisShowed: Bool
  
  var body: some View {
    
    NavigationView {
      ZStack {
        if showRegistrationView {
          ZStack {
            viewModel.openRegistration()
          }
        } else {
          ZStack {
            
            IntroScreen()
            
            WalkTroughScreens()

            NavBar()
          }
          .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.85, blendDuration: 0.8), value: showWalktroughScreens)
          .transition(.move(edge: .leading))
        }
      }
      .background(Color.init(.tertiarySystemBackground))
      .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.85, blendDuration: 0.8), value: showRegistrationView)
    }
  }
  
  @ViewBuilder
  func WalkTroughScreens() -> some View {
    let isLast = currentIndex == intros.count
    GeometryReader {
      let size = $0.size
      
      ZStack {
        ForEach(intros.indices, id: \.self) { intro in
          ScreenView(size: size, index: intro)
        }
        
        FinalView(size: size, index: intros.count)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(alignment: .bottom) {
        ZStack {
          Image(systemName: "chevron.right")
            .font(.system(size: 20, weight: .semibold))
            .frame(width: 55, height: 55)
            .scaleEffect(!isLast ? 1 : 0.0001)
            .opacity(!isLast ? 1 : 0)
          HStack {
            Text("Зарегистрироваться")
              .font(.system(size: 16, weight: .semibold))
          }
          .scaleEffect(isLast ? 1 : 0.0001)
          .frame(height: isLast ? nil : 0)
          .opacity(isLast ? 1 : 0)
        }
        .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
        .foregroundColor(.white)
        .background {
          RoundedRectangle(cornerRadius: 30, style:  isLast ? .continuous : .circular)
            .fill(.green)
        }
        .onTapGesture {
          if currentIndex == intros.count {
            showRegistrationView = true
          } else {
            currentIndex += 1
          }
        }
        .offset(y: isLast ? -40 : -60)
        .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
      }
      .offset(y: showWalktroughScreens ? 0 : size.height)
    }
  }
  
  @ViewBuilder
  func ScreenView(size: CGSize, index: Int) -> some View {
    let intro = intros[index]
    
    VStack(spacing: 10) {
      Image(intro.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 250, alignment: .top)
        .padding(.horizontal, 20)
        .offset(x: -size.width * CGFloat(currentIndex - index))
        .animation(
          .interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5)
          .delay(currentIndex == index ? 0 : 0.2)
          .delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
      
      Text(intro.title)
        .font(.system(size: 25, weight: .bold))
        .multilineTextAlignment(.center)
        .offset(x: -size.width * CGFloat(currentIndex - index))
        .animation(
          .interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5)
          .delay(currentIndex == index ? 0.2 : 0)
          .delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
      
      Text(intro.subtitle)
        .font(.system(size: 14))
        .multilineTextAlignment(.center)
        .padding(.horizontal,30)
        .offset(x: -size.width * CGFloat(currentIndex - index))
        .animation(
          .interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5)
          .delay(0.1)
          .delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
    }
  }
  
  @ViewBuilder
  func FinalView(size: CGSize, index: Int) -> some View {
    VStack(spacing: 10) {
     AppUIAsset.Assets.account.swiftUIImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 250, alignment: .top)
        .padding(.horizontal, 20)
        .offset(x: -size.width * CGFloat(currentIndex - index))
        .animation(
          .interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5)
          .delay(0.1)
          .delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
      
      Text("Учетная запись")
        .font(.system(size: 25, weight: .bold))
        .multilineTextAlignment(.center)
        .offset(x: -size.width * CGFloat(currentIndex - index))
        .animation(
          .interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5)
          .delay(currentIndex == index ? 0.2 : 0)
          .delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
      
      Text("Создайте учетную запись и получите возможность сохранения истории ваших анализов, с возможностью повторной обработки. Ваши данные надежно защищены и никуда не передаются.")
        .font(.system(size: 14))
        .multilineTextAlignment(.center)
        .padding(.horizontal,30)
        .offset(x: -size.width * CGFloat(currentIndex - index))
        .animation(
          .interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5)
          .delay(currentIndex == index ? 0 : 0.2)
          .delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
      
    }
    .offset(y: -30)
  }

  @ViewBuilder
  func NavBar() -> some View {
    let isLast = currentIndex == intros.count

    HStack {
      if showRegistrationView {
          NavigationLink(destination: VStack{}) {
          Image(systemName: "chevron.left")
            .font(.system(size: 16, weight: .regular))
            .onTapGesture {
              onBoardingisShowed.toggle()
            }
        }
      } else {
        Button {
          if currentIndex > 0 {
            currentIndex -= 1
          } else {
            showWalktroughScreens.toggle()
          }
        } label: {
          Image(systemName: "chevron.left")
            .font(.system(size: 16, weight: .regular))
        }
      }
      
      Spacer()
      
      Button("Пропустить") {
        currentIndex = intros.count
      }
      .font(.system(size: 16, weight: .regular))
      .opacity(isLast ? 0 : 1)
      .animation(.easeInOut, value: isLast)
    }
    .padding(.horizontal, 15)
    .padding(.vertical)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .offset(y: showWalktroughScreens ? 0 : -120)
  }
  
  @ViewBuilder
  func IntroScreen() -> some View {
    GeometryReader {
      let size = $0.size
      
      VStack(spacing: 10) {
        AppUIAsset.Assets.forest.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: size.width, height: size.height / 2)
        Text("Добро пожаловать")
          .font(.system(size: 27, weight: .bold))
          .padding(.top, 55)
        Text("Встречайте TSA Mobile - современный и легкий в использовании помощник в анализе временных рядов!")
          .multilineTextAlignment(.center)
          .padding(.top, 10)
          .padding(.horizontal, 25)
        Text("Приступим!")
          .font(.system(size: 16, weight: .semibold))
          .padding(.horizontal, 40)
          .padding(.vertical, 14)
          .foregroundColor(.white)
          .background {
            Capsule()
              .fill(Color.black)
          }
          .onTapGesture {
            showWalktroughScreens.toggle()
          }
          .padding(.top, 40)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .offset(y: showWalktroughScreens ? -size.height : 0)
    }
    .ignoresSafeArea()
  }
}
