# Contributing Guidelines

Thank you for your interest in contributing to Advanced System Maintenance Suite!

## How to Contribute

1. **Fork the repository** and create your branch from `main`.
2. **Describe your changes** clearly in your pull request (PR).
3. **Follow the coding style**:
   - For batch files: use clear comments, English for all interface/user messages, and modularize code (one tool = one script).
   - For PowerShell: use PascalCase for functions, camelCase for variables, and keep UI/logic separated.
4. **Test your changes** on Windows 10/11 before submitting a PR.
5. **Do not break existing features**. If you change a core script, ensure all menus and launchers still work.
6. **Add documentation** for new tools or features in the README or as inline comments.
7. **Do not include sensitive or personal data** in your contributions.

## Adding a New Tool

- Place new batch scripts in `advanced-tools/`.
- Use English for all user-facing text.
- Add a comment header with your name and the date if you wish.
- Update the main menu or relevant submenu to include your tool.

## Improving the GUI

- Edit `ASMS-GUI.ps1` for PowerShell GUI improvements.
- Test the GUI after any change (especially after converting to `.exe`).
- Keep About/Author info up to date if you add yourself as a contributor.

## Bug Reports & Feature Requests

- Use GitHub Issues for bugs or feature suggestions.
- Provide as much detail as possible (OS version, error message, steps to reproduce).

## Code of Conduct

- Be respectful and constructive in all communications.
- No hate speech, spam, or off-topic discussions.

## License

By contributing, you agree that your code will be released under the same license as this project.

---

Happy coding!
