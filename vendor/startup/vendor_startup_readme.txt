!
!  Menubar vendor/startup directory readme file
!
! 
!
    This directory is used for the placment of menu (.men) files
    and shared libraries to be loaded at Unigraphics startup to augment
    Gateway functionality.  For a complete application,
    this directory will typically contain only a menu file that locates
    the site-specific application button on the Unigraphics Application menu.

    The following rules apply to the shared libraries placed in this 
    directory:
      - the shared library MUST have the workstation vendor's standard
        shared library file extension so that all shared ibraries present
        can be implictily loaded.
      - the entry point to these shared libraries must be 'ufsta' whose 
        prototype can be found in 'uf_exit.h'

    Files in this directory are ONLY loaded in interactive Unigraphics sessions.
    Use the site/application directory for files whose loading is to be
    deferred until entering a specific application.  Place shared libraries
    that implement methods for User Defined Objects ONLY in the site/udo
    directory.                                                         




