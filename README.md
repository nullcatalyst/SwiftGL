SwiftGL
=======

This library attempts to make it easy to use OpenGL from within Apple's Swift programming language, while providing a uniform interface for both OSX and iOS development. This includes providing a math library designed to look and feel like glsl (and loosely based on the [GLKit](https://developer.apple.com/library/mac/documentation/GLkit/Reference/GLKit_Collection/_index.html) and [GLM](http://glm.g-truc.net) libraries), as well as including object-oriented wrapper classes and convenience functions to make designing applications which use OpenGL3.2+ or OpenGLES2.0+ faster and easier.

In order to build the library for either OSX or iOS, the only change that needed is merely changing the scheme in XCode (found in the top left corner of the screen). Then build and enjoy.

Also included in this project is the source code for a simple OSX demo, demonstrating the SwiftGL library in use. The code for the OpenGL view and window are based on Apple's [GLEssentials](https://developer.apple.com/library/mac/samplecode/GLEssentials/Introduction/Intro.html) sample code, and as such follows Apple's recommended best practices. This should be fairly easily used as a good starting point for any OSX OpenGL project, games or otherwise.
