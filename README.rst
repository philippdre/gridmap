GridMap
-----------

.. image:: https://travis-ci.org/EducationalTestingService/gridmap.svg?branch=master
   :alt: Build status
   :target: https://travis-ci.org/EducationalTestingService/gridmap

.. image:: http://img.shields.io/coveralls/EducationalTestingService/gridmap/master.svg
    :target: https://coveralls.io/r/EducationalTestingService/gridmap
    
.. image:: http://img.shields.io/pypi/dm/gridmap.svg
   :target: https://warehouse.python.org/project/gridmap/
   :alt: PyPI downloads

.. image:: http://img.shields.io/pypi/v/gridmap.svg
   :target: https://warehouse.python.org/project/gridmap/
   :alt: Latest version on PyPI

.. image:: http://img.shields.io/pypi/l/gridmap.svg
   :alt: License
   
A package to allow you to easily create jobs on the cluster directly from
Python. You can directly map Python functions onto the cluster without needing
to write any wrapper code yourself.

This is the ETS fork of an older project called `Python Grid <https://github.com/cwidmer/pythongrid>`__. Unlike the older
version, it is Python 2/3 compatible. Another major difference is that you can
change the configuration via environment variables instead of having to modify
a Python file in your ``site-packages`` directory. We've also removed some
cruft and improved the reliability of some of the features.

For some examples of how to use it, check out ``map_reduce.py`` (for a simple
example of how you can map a function onto the cluster) and ``manual.py`` (for
an example of how you can create list of jobs yourself) in the examples folder.

For complete documentation `read the docs <http://gridmap.readthedocs.org>`__.

*NOTE*: You cannot use GridMap on a machine that is not allowed to submit jobs
(e.g., slave nodes).

Requirements
~~~~~~~~~~~~

-  `drmaa <https://github.com/drmaa-python/drmaa-python>`__
-  `psutil <https://github.com/giampaolo/psutil>`__
-  `pyzmq <https://github.com/zeromq/pyzmq>`__
-  Python 2.7+

License
~~~~~~~

-  GPLv3

Changelog
~~~~~~~~~

See `GitHub releases <https://github.com/EducationalTestingService/gridmap/releases>`__.
