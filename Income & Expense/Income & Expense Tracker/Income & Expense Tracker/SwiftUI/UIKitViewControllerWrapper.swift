//
//  UIKitViewControllerWrapper.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-07.
//

import SwiftUI

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    let wrappedViewController: UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return wrappedViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
