# RoboGlow - Enhanced Robot Framework Support for Vim

**RoboGlow** is a plugin for Vim that enhances the support for editing and working with Robot Framework files. It's built upon the foundation of the original `robotframework-vim` plugin by [Michael Foukarakis](https://github.com/mfukar/robotframework-vim).

## Acknowledgments

This project is based on the original [robotframework-vim](https://github.com/mfukar/robotframework-vim) plugin by Michael Foukarakis. We extend our gratitude for their contribution to the Vim community.

- This is still under heavy development and currently will work only on Linux
- Scripts have issue currently it will add multiple times keywords
- vimrc need trigger to run check if there is new keywords
## Features

- Improved syntax highlighting for Robot Framework files.
- Added functionality for generating keyword definitions from Python files.
- Added functionality for generating keyword definitions from Robot files.
- ...

## Getting Started
- Use junegunn plug installer to install this
- Add your vimrc file Plug 'Jani-siv/RoboGlow'
- Add your vimrc line let g:RoboGlow = 0 "This option will disable feature what will add new library and resources to highlihter"
- Open vim and write :PlugInstall
...

## Todo / nice to have
- Update view after apply new library. Currently file need close and open again to get added resources and library keywords highlighted
- Opened file keywords need to be added to highlighting. Currently those keywords and testcases are not highlighted.
- Update createRobotKeywords.sh only read section where keywords are.

## Known bugs
- Keywords syntax will ignore case sensitivy. This need to be fixed
- Python includes what have .py file extensions and used dot as directory separator will not be parsed

## Updates
- Refactored one shell script to use functions
- Added to shell script possibility to change syntax by user
- Changed syntax file search to relative path of running script
- Bug fix: From python parsing need take commented function definiton out
- Bug fix: Library filenames without file extensions not included to keyword list
- Bug fix: Library ../../pylib.something.py is not parsed correctly
- Update add functions to use relative path for syntax files (current use has implemented using find and it's slow)

## Contributing

...

## License

This project is licensed under the [MIT License](LICENSE).

---

**RoboGlow** is developed by [Jani Sivonen](https://github.com/Jani-siv). It's an extension of the original `robotframework-vim` plugin by Michael Foukarakis.

