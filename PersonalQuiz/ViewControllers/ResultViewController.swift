//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Ilia D on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!

    // MARK: - Properties
    var answers: [Answer]!

    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        resultLabel.text = "Вы - \(findCurrentAnimalFrom(answers).rawValue)"
        resultDescriptionLabel.text = findCurrentAnimalFrom(answers).definition
    }

    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    // MARK: - Deinitialization
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}


// MARK: - Current Animal
extension ResultViewController {
    private func findCurrentAnimalFrom(_ answers: [Answer]) -> Animal {
        var countAnswers = [
            "Cat": 0,
            "Dog": 0,
            "Rabbit": 0,
            "Turtle": 0
        ]

        for answer in answers {
            if answer.animal == .cat {
                countAnswers["Cat"]? += 1
            } else if answer.animal == .dog {
                countAnswers["Dog"]? += 1
            } else if answer.animal == .rabbit {
                countAnswers["Rabbit"]? += 1
            } else if answer.animal == .turtle {
                countAnswers["Turtle"]? += 1
            }
        }

        let result = String(countAnswers.sorted{ $0.1 > $1.1 }.first?.key ?? "")
        let currentAnimal: Animal

        switch result {
        case "Cat":
            currentAnimal = .cat
        case "Dog":
            currentAnimal = .dog
        case "Rabbit":
            currentAnimal = .rabbit
        default:
            currentAnimal = .turtle
        }

        return currentAnimal
    }
}
