//
//  SplashPage.swift
//  MELIStore
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreCore
import MELIStoreDesignSystem

struct SplashView: View {

    @Environment(\.theme)
    private var theme: ThemeManager
    
    @EnvironmentObject
    private var router: Router
    
    @State
    private var observableObject = SplashObservableObject()
    
    var body: some View {
        ZStack(alignment: .center) {
            theme.current.primaryColor.ignoresSafeArea()
            
            ImageAtom(image: AppImages.splash)
                .scaledToFit()
                .padding(.horizontal, DSSpacing.spacing26)
        }
        .onAppear {
            Task { await observableObject.start() }
        }
        .onChange(of: observableObject.route) { _ , newRoute in
            guard let newRoute else { return }
            router.replace(newDestination: newRoute)
        }
    }
}
