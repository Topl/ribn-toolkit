# ribn_toolkit

<p align="center">
  <img src="https://user-images.githubusercontent.com/13727615/167431215-d0bf9e8f-8b89-4b4e-88b6-825cbe5bcdc6.png" width="200" />
</p>

<p align="center">
  Ribn Toolkit is a widget/component library for the <a name="Ribn link" href="https://github.com/Topl/ribn">Ribn codebase</a>. Ribn Toolkit is built using <a name="Widgetbook" href="https://www.widgetbook.io/">Widgetbook<a/>, an open source, custom widget library for Flutter. When deployed on a Topl domain, it will enable faster design review for UI development as it allows UI/UX designers to interact with widgets real time. The design stucture of the library is as follows:   
</p>
  
<br>
  
![atomic-design-organisms](https://user-images.githubusercontent.com/13727615/167439479-58db2186-9329-4a17-8980-c04615bb9886.png)
  
<br>

- **Atoms**<br>
The basic building blocks of the UI. These atoms include basic HTML elements like form labels, inputs, buttons, and others that can’t be broken down any further without ceasing to be functional.
  
- **Molecules**<br>
Molecules are relatively simple groups of UI elements functioning together as a unit. For example, a form label, search input, and button can join together to create a search form molecule. When combined, these abstract atoms suddenly have purpose.
  
- **Organisms**<br>
Organisms are relatively complex UI components composed of groups of molecules and/or atoms and/or other organisms. These organisms form distinct sections of an interface. An example here would be the RibnAppBar, an AppBar which contains an input dropdown and popout menu button.
  
<br>

## Getting Started
You can run the app locally by changing into the project directory and entering the command below:<br>
 `flutter run -d chrome --web-renderer html`
  
 **N.B. The reason we run the project with this specific command is because the Ribn project uses the html web renderer. Starting Ribn Toolkit without this command will produce UI inconsistencies when widgets from this library are imported into Ribn.**
  
