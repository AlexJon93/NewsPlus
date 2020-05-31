# RAD Assign - Alex Jarvis
### s3607170 | Alexander Jarvis

- Level Attempted: 90+
- Heroku link: https://dry-lake-74310.herokuapp.com/

## Timelog

Date | Time 
--|--
12/04/20 | 2:29:54
13/04/20 | 4:17:02
15/04/20 | 4:26:57
18/04/20 | 4:23:53
19/04/20 | 1:24:20
13/05/20 | 0:39:36
16/05/20 | 2:47:04
25/05/20 | 4:40:16
27/05/20 | 6:17:50
28/05/20 | 4:50:23
29/05/20 | 2:55:52
30/05/20 | 4:19:53
31/05/20 | 5:24:14
**Total**    | 48:57:44

## Sources
* Bootstrap3 Docs
* Rails Docs

## Notes

I am receiving the error `An error was encountered when contacting the add-on partner to create sendgrid:starter: Error Provisioning User - User status - banned` when trying to provision for Sendgrid.

I have submitted a ticket to Heroku, but have received no response as yet.

## Last Heroku Build Log
```


-----> Ruby app detected

-----> Installing bundler 2.0.2

-----> Removing BUNDLED WITH version in the Gemfile.lock

-----> Compiling Ruby/Rails

-----> Using Ruby version: ruby-2.6.0

-----> Installing dependencies using bundler 2.0.2

       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment

       The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.

       Using rake 13.0.1

       Using concurrent-ruby 1.1.6

       Using i18n 1.8.2

       Using minitest 5.11.3

       Using thread_safe 0.3.6

       Using tzinfo 1.2.7

       Using activesupport 5.2.4.3

       Using builder 3.2.4

       Using erubi 1.9.0

       Using mini_portile2 2.4.0

       Using nokogiri 1.10.9

       Using rails-dom-testing 2.0.3

       Using crass 1.0.6

       Using loofah 2.5.0

       Using rails-html-sanitizer 1.3.0

       Using actionview 5.2.4.3

       Using rack 2.2.2

       Using rack-test 1.1.0

       Using actionpack 5.2.4.3

       Using nio4r 2.5.2

       Using websocket-extensions 0.1.4

       Using websocket-driver 0.7.2

       Using actioncable 5.2.4.3

       Using globalid 0.4.2

       Using activejob 5.2.4.3

       Using mini_mime 1.0.2

       Using mail 2.7.1

       Using actionmailer 5.2.4.3

       Using activemodel 5.2.4.3

       Using arel 9.0.0

       Using activerecord 5.2.4.3

       Using mimemagic 0.3.5

       Using marcel 0.3.3

       Using activestorage 5.2.4.3

       Using public_suffix 4.0.5

       Using addressable 2.7.0

       Using execjs 2.7.0

       Using autoprefixer-rails 9.7.6

       Using bcrypt 3.1.13

       Using ffi 1.12.2

       Using sassc 2.3.0

       Using bootstrap-sass 3.4.1

       Using bundler 2.0.2

       Using mini_magick 4.10.1

       Using ruby-vips 2.0.17

       Using image_processing 1.11.0

       Using carrierwave 2.1.0

       Using coffee-script-source 1.12.2

       Using coffee-script 2.4.1

       Using method_source 1.0.0

       Using thor 1.0.1

       Using railties 5.2.4.3

       Using coffee-rails 4.2.2

       Using font-awesome-rails 4.7.0.5

       Using jbuilder 2.10.0

       Using jquery-rails 4.4.0

       Using pg 1.2.3

       Using puma 3.12.6

       Using sprockets 3.7.2

       Using sprockets-rails 3.2.1

       Using rails 5.2.4.3

       Using rb-fsevent 0.10.4

       Using rb-inotify 0.10.1

       Using sass-listen 4.0.0

       Using sass 3.7.4

       Using tilt 2.0.10

       Using sass-rails 5.1.0

       Using turbolinks-source 5.2.0

       Using turbolinks 5.2.1

       Using uglifier 4.2.0

       Bundle complete! 29 Gemfile dependencies, 70 gems now installed.

       Gems in the groups development and test were not installed.

       Bundled gems are installed into `./vendor/bundle`

       Bundle completed (1.08s)

       Cleaning up the bundler cache.

-----> Installing node-v10.15.3-linux-x64

-----> Detecting rake tasks

-----> Preparing app for Rails asset pipeline

       Running: rake assets:precompile

       Yarn executable was not detected in the system.

       Download Yarn at https://yarnpkg.com/en/docs/install

       Asset precompilation completed (2.32s)

       Cleaning assets

       Running: rake assets:clean

-----> Detecting rails configuration

###### WARNING:

       You set your `config.active_storage.service` to :local in production.

       If you are uploading files to this app, they will not persist after the app

       is restarted, on one-off dynos, or if the app has multiple dynos.

       Heroku applications have an ephemeral file system. To

       persist uploaded files, please use a service such as S3 and update your Rails

       configuration.

       

       For more information can be found in this article:

         https://devcenter.heroku.com/articles/active-storage-on-heroku

       

###### WARNING:

       We detected that some binary dependencies required to

       use all the preview features of Active Storage are not

       present on this system.

       

       For more information please see:

         https://devcenter.heroku.com/articles/active-storage-on-heroku

       

###### WARNING:

       There is a more recent Ruby version available for you to use:

       

       2.6.6

       

       The latest version will include security and bug fixes, we always recommend

       running the latest version of your minor release.

       

       Please upgrade your Ruby version.

       

       For all available Ruby versions see:

         https://devcenter.heroku.com/articles/ruby-support#supported-runtimes

###### WARNING:

       No Procfile detected, using the default web server.

       We recommend explicitly declaring how to boot your server process via a Procfile.

       https://devcenter.heroku.com/articles/ruby-default-web-server

-----> Discovering process types

       Procfile declares types     -> (none)

       Default types for buildpack -> console, rake, web

-----> Compressing...

       Done: 63M

-----> Launching...

       Released v12

       https://dry-lake-74310.herokuapp.com/ deployed to Heroku
```