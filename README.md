<<<<<<< HEAD
# scavenger_hunt

A new Flutter project.
=======
# ScavengerHunt
Scavenger Hunt App Scavenger Hunt App is a mobile application built with Flutter that allows users to participate in scavenger hunts by completing various tasks and challenges.
>>>>>>> 9761b0331cfb62bd8b19a45a25c4d969de29fa7d
<body>


## File Structure

The project comprises various files organized to handle different aspects of the application:

1. **main.dart**: Serves as the application's entry point, initializing Firebase services, and managing user authentication states.
2. **firebase_option.dart**: Contains platform-specific Firebase configurations and options essential for Firebase services.
3. **authscreen.dart**: Controls user authentication processes, including sign-in, sign-up functionalities, form validation, and image selection.
4. **home.dart**: Manages user authentication and state changes, directing users to the appropriate screen based on their authentication status.
5. **dummydata.dart**: Provides placeholder data, including a list of scavenger hunt tasks, for testing and demonstration.
6. **task.dart**: Defines the `Task` class to encapsulate task information like title and description.
7. **imageinput.dart**: Enables users to capture images using the device's camera and manages selected image files for upload.
8. **taskwidget.dart**: Displays individual scavenger hunt tasks on the home screen using task indices to access specific tasks.
9. **stack.dart**: Facilitates task interaction and completion on the primary content area, tracking the current task index for effective task management.

## Detailed Functionality

### main.dart

- Initializes Firebase services and manages user authentication states using Firebase Authentication.
- Routes users to appropriate screens based on their authentication status.

### firebase_option.dart

- Provides platform-specific Firebase configurations and options necessary for Firebase services.
- Ensures correct Firebase configurations for different target platforms.

### authscreen.dart

- Manages user authentication processes, including sign-in and sign-up functionalities.
- Handles form validation, user input fields, and image selection for profile pictures.
- Provides appropriate feedback to users during the authentication process.

### home.dart

- Manages user authentication and authentication state changes.
- Directs users to appropriate screens based on their authentication status.
- Manages user sessions for a seamless authentication experience.

### dummydata.dart

- Provides placeholder data for testing and demonstration purposes.
- Includes a list of scavenger hunt tasks to simulate real-world scenarios within the application.

### task.dart

- Defines the `Task` class to encapsulate task information, including title and description.
- Facilitates structured management and manipulation of task data within the application.

### imageinput.dart

- Allows users to capture images using the device's camera.
- Manages the selected image file for upload and offers functionality for image selection.

### taskwidget.dart

- Displays individual scavenger hunt tasks on the home screen.
- Utilizes task indices to access specific tasks within the list and present them to users.

### stack.dart

- Facilitates task interaction and completion on the primary content area.
- Tracks the current task index to display and manage tasks effectively during scavenger hunts.

## Conclusion

The Scavenger Hunt Flutter App provides users with an immersive platform to partake in scavenger hunts and complete diverse challenges. With its intuitive interface and seamless functionality, users can enjoy an engaging experience while exploring their surroundings and accomplishing tasks within the app.
</body>
