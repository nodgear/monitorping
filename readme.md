
<h1 align="center">MonitorPing</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/nodgear/monitorping?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/nodgear/monitorping?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/nodgear/monitorping?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/nodgear/monitorping?color=56BEB8">

</p>

<!-- Status -->

<h4 align="center">
    MonitorPing 🚀 One more cool useless thing
</h4>

<hr>

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0;
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#wrench-settings">Settings</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/nodgear" target="_blank">Author</a>
</p>

<br>

## :dart: About ##

MonitorPing will check the connection between your computer and the desired IP.
If the ip can't be reached all monitors from said pc will be turned off.

## :sparkles: Features ##

:heavy_check_mark: Can be initialized without a window, or, added to task schedule from windows;\
:heavy_check_mark: Configurable timers and ip;\
:heavy_check_mark: Installer file that will import and move everything for you!;

## :rocket: Technologies ##

The following tools were used in this project:

- [PowerShell](https://docs.microsoft.com/en-us/powershell/)
- [NirCmd](https://www.nirsoft.net/utils/nircmd2.html#using)

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to allow script execution on PowerShell <br>
```ps
set-executionpolicy remotesigned
```


## :wrench: Settings ##

### Setting up MonitorPing
You can install by running the install script.
```ps
./install.ps1
# Now follow the installation instructions
```

## :checkered_flag: Starting ##

Run MonitorPing by either:

Adding it to a task under windows scheduler
or
./start.ps1

To hide go to your config.ini file and add hidden=1 under the [CONFIG] category
like this:
```ini
[CONFIG]
hidden=1
```

## :memo: License ##

This project is under license from GNU GPL 3. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/nodgear" target="_blank">Nodge</a>

&#xa0;

<a href="#top">Back to top</a>
