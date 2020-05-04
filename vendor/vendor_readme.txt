!
!  Menubar vendor directory readme file
!
! 
!
**************************************************************************
Unigraphics V12.0 includes the introduction of two new products:
   - UG/StyleFX provides the ability for Unigraphics alliance partners to 
      integrate their applications into Unigraphics in a manner similar to the
      way in which Unigraphics applications are integrated
   - User Defined Objects the ability for Unigraphics alliance partners to
      introduce their own classes of objects into Unigraphics and provide
      methods for display, selection, etc. for these objects.

This directory structure is intended to provide the default location for
installation of vendor-supplied menu files and shared libraries for 
applications integrated using the UG/StyleFX and User Defined Objects 
products.

*************************************************************************
 PLEASE NOTE: The vendor directory contains three subdirectories that must 
  be used correctly to successfully install vendor-supplied applications.
  The correct usage of each of these subdirectories is discussed below.
  All vendor supplied files should include a vendor or product-specific
  prefix on all file names to make the set of files for a particular
  application easy to identify.

  Refer to the StyleFX and User Defined Object documentation for further
  information.
*************************************************************************

UGII_VENDOR_DIR Environment Variable
------------------------------------
The environment variable, UGII_VENDOR_DIR is set by default to 
UGII_BASE_DIR/ugalliance/vendor.  To locate this directory elsewhere, copy
the vendor directory structure including its three subdirectories to the
desired location and modify UGII_VENDOR_DIR to point to the new directory.

Vendor Sub-Directories
----------------------
The vendor directory structure contains the following subdirectories that
must be used correctly to ensure the successful installation of a 
vendor-supplied application:
  startup - This directory is used for the placment of menu (.men) files
    and shared libraries to be loaded at Unigraphics startup to augment
    Gateway functionality.  For vendors supplying a complete application,
    this directory will typically contain only a menu file that locates
    the vendor's application button on the Unigraphics Application menu.

    The following rules apply to the shared libraries placed in this 
    directory:
      - the shared library MUST have the workstation vendor's standard
        shared library file extension so that all shared ibraries present
        can be implictily loaded.
      - the entry point to these shared libraries must be 'ufsta' whose 
        prototype can be found in 'uf_exit.h'

    Files in this directory are ONLY loaded in interactive Unigraphics sessions.

  application - This directory is used for the placement of menu (.men) 
    files, resource files (.res) and shared libraries, whose loading is
    deferred and done on demand when the user chooses the vendor application 
    from the Unigraphics Application menu. 

    The following rules apply to the shared libraries placed in this 
    directory:
      - the shared library MUST have the workstation vendor's standard
        shared library file extension 
      - the entry point to these shared libraries must be 'ufsta' whose 
        prototype can be found in 'uf_exit.h'

    Files in this directory are ONLY loaded in interactive Unigraphics sessions.

  udo - This directory is used for the placement of shared libraries
        that are automatically loaded by Unigraphics during both 
        external User Function and interactive Unigraphics sessions.

    The following rules apply to the shared libraries placed in this 
    directory:
      - the shared library MUST have the workstation vendor's standard
        shared library file extension 
      - the entry point to these shared libraries must be 'ufsta' whose 
        prototype can be found in 'uf_exit.h'
      - StyleFX shared libraries should NEVER be placed in this directory
        because they will cause external User Function programs not
        to execute properly.









