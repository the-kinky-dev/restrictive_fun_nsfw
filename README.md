## Welcome to the restrictive_fun ([NSFW](https://en.wikipedia.org/wiki/Not_safe_for_work)) project!

This is the right place for all kinky developers to create restrictive and/or kinky 3d printed toys in [OpenSCAD](https://openscad.org/). Have fun and be nice! :D

## How to use

- [Install OpenSCAD](https://openscad.org/downloads.html)
- [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Clone this repo
  > git clone https://github.com/the-kinky-dev/restrictive_fun_nsfw.git
- rename the file personalDimension.scad.dist to personalDimension.scad
- rename the file moduleConfig.scad.dist to moduleConfig.scad
- Optionally (but please do! We need it for the logo atm): Install UnifrakturMaguntia.ttf on your system
  [Download the font](https://fonts.google.com/specimen/UnifrakturMaguntia) and right click the downloaded file. Choose install font on the pop up menu.
- Edit the file personalDimensions.scad and adapt the values to your tester's size
- You are ready to go!

## I only want stl files!!!!
Just download them [here](https://letmegooglethat.com/?q=download+stl+files)!

Ok, you meant specific files from this project? ;)
Follow the "how to use" list above! Then start OpenSCAD and open the desired file using the file menu. Then press the button with the hourglass symbol, that has a flyover saying "render". After it is finished, visually check the result. If satisfied press the button that says "stl". If you did edit personalDimensions.scad, the stl file should be a perfect fit for you.

## You have a problem?
We are sorry! Please use the project's issues on github. If possible always add the files personalDimensions.scad and moduleConfig.scad that you used! And mention that the files are not yours, but your tester's! You don't want the size of your own sex organ on the internet! If you don't have a tester, invent one!

## Contributing

Pull request are very welcome!

### Formatting

Please use the provided .clang-format file. Don't use it on modulesConfig.scad!!!

### Provide real life dimensions

We would be very interested to get your tester's personalDimensions.scad files to see if the designs work for everyone.
Put the file into the test/data folder and using the following number. Be sure to mention in the pull request that it is your tester's data and not you own! See "You have a problem" above.

### IDEs/Tools
These tools work on all OSs.

For code formatting install clang-format. 

I would recommend using Visual Studio Code with this extension: "OpenSCAD Language Support" with these settings:

- "Fmt Exe Path" - put here the path to the clang-format command
- "Fmt Style" - choose "file"


## License

This project uses the [CC BY_NC_SA license](https://creativecommons.org/licenses/by-nc-sa/4.0/)

If you want to use the designs comercially, contact the.kinky.dev@gmail.com. We can work something out! 
