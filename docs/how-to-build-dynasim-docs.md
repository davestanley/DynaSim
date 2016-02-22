# How to automatically generate the DynaSim docs

This guide should be everything you know do get up and automating the
documentation generation of DynaSim. The hardest part is the install;
updating the docs once you've changed the comments in the code is
trivial!...which is the whole point.

## Installation

1. If you have a working Python2.7 environment, skip these. If you don't, or you're not sure you do, then do these:
    1. Install Python through [Anaconda](https://www.continuum.io/downloads). 3.5 does not seem to work with the MATLAB Sphinx filter used, I've only gotten 2.7 to work. The Anaconda version shouldn't matter.
        - Anaconda is my favorite of the environment managers for Python, as it trivially encapsulates everything -- you can download it and get up and running in about 3 commands.
        - Anaconda is also the [main Python usage/installation mechanism on the SCC cluster](http://www.bu.edu/tech/support/research/software-and-programming/common-languages/python/python-versions/) so if you only develop on the cluster, this should work.
    2. Create an anaconda environment, e.g. named `sphinx27` here, to use [Sphinx](http://www.sphinx-doc.org/en/stable/), via
    ```
    conda create --name sphinx27 python=2.7
    ```
    3. Enter the environment via
    ```
    source activate sphinx27
    ```
2. Install the packages we'll be using and their dependencies from scratch, via
```
pip install sphinx sphinx-autobuild sphinxcontrib-matlabdomain
```

## Updating documentation
- Once you've made your reStructured Text changes to the "docstrings" immediately after the necessary functions, simply rebuild the documentation by going into the `docs` directory and running `make html`. That's it! Seriously. You can see the central index in `dynasim/docs/_build/html/index.html`.
