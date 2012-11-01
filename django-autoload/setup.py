from setuptools import setup, find_packages

DESCRIPTION = 'Ensures loading of specified app modules.'
LONG_DESCRIPTION = None

setup(name='django-autoload',
      version='0.01',
      packages=find_packages(exclude=('tests', 'tests.*',
                                      'base_project', 'base_project.*')),
      author='Thomas Wanschik',
      author_email='twanschik@gmail.com',
      url='http://www.allbuttonspressed.com/',
      description=DESCRIPTION,
      long_description=LONG_DESCRIPTION,
      platforms=['any'],
      classifiers=[
          'Development Status :: 5 - Production/Stable',
          'Environment :: Web Environment',
          'Framework :: Django',
          'Intended Audience :: Developers',
          'Operating System :: OS Independent',
          'Programming Language :: Python',
          'Topic :: Software Development :: Libraries :: Application Frameworks',
          'Topic :: Software Development :: Libraries :: Python Modules',
          'License :: OSI Approved :: BSD License',
      ],
)
