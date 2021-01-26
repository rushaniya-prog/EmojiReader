//
//  NewEmojiTableViewController.swift
//  Emoji
//
//  Created by Рушания on 17.01.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    var emoji = Emoji(emoji: "", name: "", description: "", isFavourite: false)

    @IBOutlet weak var EmojiTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var DescriptionTextField: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateUI ()
        upDateSaveButtonState ()
    }
    private func upDateSaveButtonState () {
        let emojiText = EmojiTextField.text ?? ""
        let nameText = NameTextField.text ?? ""
        let descriptionText = DescriptionTextField.text ?? ""
        SaveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func upDateUI () {
        EmojiTextField.text = emoji.emoji
        NameTextField.text = emoji.name
        DescriptionTextField.text = emoji.description
    }
    @IBAction func TextChanged(_ sender: UITextField) {
        upDateSaveButtonState ()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "SaveSegue" else {return}
        let emoji = EmojiTextField.text ?? ""
        let name = NameTextField.text ?? ""
        let description = DescriptionTextField.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavourite: self.emoji.isFavourite)
    }
}
