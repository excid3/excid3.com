---
title: Python and OpenGL Game Mode on Dual Monitors Tutorial
author: excid3
layout: post
dsq_thread_id:
  - 185469849
categories:
  - Python
tags:
  - dual monitors
  - game
  - mode
  - opengl
  - Python
  - tutorial
---
One project I have been working on lately has to do with Python and OpenGL rendering on a cluster of computers. The pyopengl project has documentation on things, but it’s not much more than API docs. That may be fine for some, but I’m completely new to OpenGL and need some actual tutorials and example code to get myself started.

The first thing I needed to get working properly was rendering to dual monitors. That should be extremely easy right? Yeah, if you can find examples. Let’s step through this example:


    #!/usr/bin/env python

    import sys

    from OpenGL.GL import *
    from OpenGL.GLUT import *


    def main():

        # Initialize OpenGL
        glutInit(sys.argv)
        glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)

        # Configure the display output
        glutGameModeString("2560x1024:24@60")
        glutEnterGameMode()

        # Setup callbacks
        glutKeyboardFunc(keyboard)
        glutDisplayFunc(display)

        # Begin!
        glutMainLoop()


    def keyboard(key, x, y):
        if key == 'q':
            sys.exit(0)


    def display():

        glClear(GL_COLOR_BUFFER_BIT)

        glBegin(GL_LINES)
        glVertex2f(1.0, 1.0)
        glVertex2f(-1.0, -1.0)
        glEnd()

        glutSwapBuffers()

    if __name__ == "__main__":
        main()


Let’s start with the `main()` function. The first two `glutInit` calls setup glut. The first initializes glut with any command line arguments that might have been passed. The second sets up glut to render using a double buffer for smoothness and using RGB for colors. Pretty simple.

Next up we have `glutGameModeString`. You might recognize the format slightly. First you have your resolution, your color bits, and then your monitor refresh rate. Quite straight forward and easy.

Note that GameMode is the only way you can render to dual monitors with `glut`. Typically you see `glutFullScreen` but this will only fullscreen on a single monitor. You could code dual monitor support yourself, but GameMode takes care of it for you.

All we do is configure GameMode, and then enter it. Simple as that. There is one serious catch however. Since GameMode takes control of your screen…it captures your inputs too. There is no escape! Your mouse and keyboard get captured and then you’re stuck.

To combat this, we simply add a keyboard function. When the ‘q’ key is pressed, we exit the program. Using this with `sys.exit` may not be the greatest way to exit, but `glut` does not provide a method of leaving the MainLoop. You might try throwing an exception if need be.

The display function is pretty simple, and you can find lots of examples on how to draw. I won’t go into any detail with the display function since it is going to look vastly different between applications.

That’s the basics for running GameMode on dual monitors. In the future, I’ll likely cover some more topics regarding PyOpenGL and as always, I’m open to suggestions if you would like me to check out a specific topic. ![:D][1]

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
