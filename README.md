
## Getting Started

This project is a demo for state management in flutter. <br>
We have 2 parts: the first one is about using Provider, the second part uses BLoC pattern.

## Presentation slide
https://github.com/sungphamdinh/flutter_state_management_demo/blob/master/flutter_architecture_v1.key

## How to run
1. Install Environment
IDE: Android studio or Visual Studio Code https://flutter.dev/docs/get-started/editor <br>
Flutter and Dart SDK: https://flutter.dev/docs/get-started/install/macos

2. Clone source <br>
git clone https://github.com/sungphamdinh/flutter_state_management_demo.git

3. Run "flutter pub get" to download all dependancies.

4. Run the project.

# Folder structure

lib/ <br>
  bloc_demo/ => for BloC pattern demo <br>
      - blocs/ => define bloc objects <br>
      - screens/ => UI code for using BLoC <br>
  data/ => data layer, actual implement the CRUD of data <br>
  models/ => define data models <br>
  provider_demo/ => for Provider demo <br>
       - providers/ => define the provider of todo list <br>
       - screens/ => UI code for using Provider <br>
  repositories/ => abstract class to provide interface for data layer <br>
  


