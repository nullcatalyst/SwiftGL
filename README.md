SwiftGL
=======

This library attempts to make it easy to use OpenGL from within Apple's Swift programming language, while providing a uniform interface for both OSX and iOS development. For an example of this library in action, please head over to the [SwiftGLDemo](https://github.com/sbennett912/SwiftGLDemo) project.

This includes providing a math library designed to look and feel like glsl (and loosely based on the [GLKit](https://developer.apple.com/library/mac/documentation/GLkit/Reference/GLKit_Collection/_index.html) and [GLM](http://glm.g-truc.net) libraries), as well as including object-oriented wrapper classes and convenience functions to make designing applications which use OpenGL3.2+ or OpenGLES2.0+ faster and easier.

In order to build the library for either OSX or iOS, the only change that needed is merely changing the scheme in XCode (found in the top left corner of the screen). Then build and enjoy.
