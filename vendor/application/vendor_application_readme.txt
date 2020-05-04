!
!  Menubar vendor/application directory readme file
!
! 
!
    This directory is used for the placment of menu (.men) files
    files, resource files (.res) and shared libraries, whose loading is
    deferred and done on demand when the user chooses the site-specific
    application from the Unigraphics Application menu. 

    The following rules apply to the shared libraries placed in this 
    directory:
      - the shared library MUST have the workstation vendor's standard
        shared library file extension 
      - the entry point to these shared libraries must be 'ufsta' whose 
        prototype can be found in 'uf_exit.h'

    Files in this directory are ONLY loaded in interactive Unigraphics sessions
    when requested on entry to a Unigraphics application.
    Use the site/startup direcory for menu files and shared libraries that
    are to be loaded automatically at Unigraphics startup.
    Place shared libraries that implement methods for User Defined Objects 
    ONLY in the site/udo directory.



