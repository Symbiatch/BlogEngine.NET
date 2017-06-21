## BlogEngine.NET with PostgreSQL
This repository contains the PostgreSQL port of BlogEngine.NET.
Since BlogEngine.NET internally converts GUIDs into text before handing them over to the database provider some code changes are needed. The changes should be compatible with proper database providers, but I haven't tested them.

Also since the database contains columns named Key, Value and Attribute, some databases need escaping and this seems to be hardcoded into the source code. I've added hardcoded "no need to escape" versions for PostgreSQL.

Currently the code is very lightly tested, so YMMV.

----

This repository provides latest source code for BlogEngine.NET project and since Codeplex is shutting down, we don't release any version on Codeplex anymore.

<br>
<br>

<a href="https://blogengine.io/" target="_blank">
<img src="https://blogengine.io/files/images/github/btn01.png" alt="Download BlogEngine Themes">
</a> &nbsp;
<a href="https://blogengine.io/features/" target="_blank">
<img src="https://blogengine.io/files/images/github/btn02.png" alt="Download BlogEngine Themes">
</a> &nbsp;
<a href="https://blogengine.io/themes/" target="_blank">
<img src="https://blogengine.io/files/images/github/btn03.png" alt="Download BlogEngine Themes">
</a> &nbsp;
<a href="https://blogengine.io/docs/" target="_blank">
<img src="https://blogengine.io/files/images/github/btn04.png" alt="Download BlogEngine Themes">
</a> &nbsp;
<a href="https://blogengine.io/donate/" target="_blank">
<img src="https://blogengine.io/files/images/github/btn05.png" alt="Download BlogEngine Themes">
</a>

<br>
<br>





# Installation

You can setup your BlogEngine with a single click!
Take a look at the perfect [BlogEngine hosting solutions](https://www.a2hosting.com/blogengine-net-hosting).


There are two download options for BlogEngine.NET:

### 1. Web Project
This is an ideal option that you just need to download and copy BlogEngine files on your website and then everything is ready:

Requirements:
  * ASP.NET 4.5 +

Steps:
1. **[Download](https://github.com/rxtur/BlogEngine.NET/releases/download/v3.3.6.0/3360.zip)** and extract zip file on root of your website.
2. Add write permissions to the `App_Data` and `Custom` folder.
3. Installation is done.
4. You can navigate to administration by adding `/admin/` to your website's URL, for example: `http://yourblog.com/admin/`
5. Username: `admin` Password `admin`


### 2. Source Code
This is the developer option. If you are interested is seeing how things work or want to add to the functionality, this is your option.

Environment:
  * Visual Studio 2015 +
  * ASP.NET 4.5 +

Steps:
  1. Clone repository
  2. Open solution in Visual Studio 2015 +
  3. Create a database with use *beUser*
  4. Add the *uuid-ossp* extension
  5. Run the script from setup/PostgreSQL
  6. Build and run solution to load website in the browser
  7. Use Admin/admin to log into website administration
   
![dashboard-3](https://cloud.githubusercontent.com/assets/1932785/11760070/0012f9d8-a052-11e5-84a8-e9097cb85f23.png)
