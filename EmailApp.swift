//
//  Email.swift
//  Energy
//
//  Created by Alex Kozin on 05.09.2023.
//  Copyright © 2023 El Machine. All rights reserved.
//

#if canImport(UIKit)
import UIKit

struct EmailApp {

    let name: String
    let schema: String

    var url: URL {
        URL(string: schema + ":")!
    }

    static 
    let all = [
        EmailApp(name: "Mail", schema: "message"),
        EmailApp(name: "Sparrow", schema: "sparrow"),
        EmailApp(name: "Gmail", schema: "googlegmail"),
        EmailApp(name: "Dispatch", schema: "x-dispatch"),
        EmailApp(name: "Spark", schema: "readdle-spark"),
        EmailApp(name: "Airmail", schema: "airmail"),
        EmailApp(name: "Microsoft Outlook", schema: "ms-outlook"),
        EmailApp(name: "Yahoo Mail", schema: "ymail"),
        EmailApp(name: "Fastmail", schema: "fastmail"),
        EmailApp(name: "ProtonMail", schema: "protonmail"),
        EmailApp(name: "Yandex", schema: "yandexmail"),
        EmailApp(name: "Mail.ru", schema: "mailrumail"),
    ]

    static 
    func open() {
        let app = UIApplication.shared

        let available = all.filter {
            app.canOpenURL($0.url)
        }

        switch available.count {
            
            case 1:
                open(app: available.first!)
            
            case 1...:

                let actionSheet = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
                available.forEach { emailApp in

                    actionSheet + (emailApp.name, { action in
                        open(app: emailApp)
                    })

                }

                actionSheet + ("Отмена", .destructive)
                actionSheet.presentOnVisible()

            default:
                break

        }

    }

    private 
    static
    func open(app: EmailApp) {
        UIApplication.shared.open(app.url)
    }

}

#endif
