Ymaps Cordinates Picker
=====================

Works to provide form inputs as coordinates picker.

This gem supports single and multiple pickers.
Gem support ActiveRecord and Mongoid db adapters
After rendering map has autozoom and autocenter.  
Usage
=====

add the following to your `Gemfile`:

```ruby
gem 'ymaps_coordinates_picker', github: 'VeloKoder/ymaps_coordinates_picker'
```

Then, add to your model if you want single picker:

```ruby
set_geopoints :lat, :lng
```
where :lat and :lng are latitude and longitude model fields keys.
If you want multiple picker, add to model
```ruby
set_geopoints :borders
```
where :borders is your geopoints array field, such as:
```ruby
[[:lat1, :lng1], [:lat2, lng2], [:lat3, lng3]]
```
Then, add to your form
```ruby
<%= form.ymaps_coordinates_picker %>
```
If you want full-customized input:
```ruby
<%= form.ymaps_coordinates_picker width: 500, height: 500, locale: 'en_US'%>
```

Configuration
=============

beside the option depicted on the example above it can be configured with the following:

- `width` - custom map width(default is 600)
- `height` - custom map height(default is 400)
- `locale` - map api language(default is en_US)

General configuration options
=============================

You can configure the following default values by overriding these values using:
YmapsCoordinatesPicker.configure method.

  width #= <width>                                                                       
  height #= <height>                                                                      
  language #= <language>
There's a handy generator that generates the default configuration file into config/initializers directory.
Run the following generator command, then edit the generated file.

```ruby
rails g ymaps_coordinates_picker:config
```

VERSION
=======
-0.1.0
    -  Gem started
LICENSE
=======
is licensed under the MIT license.

Copyright (C) 2014 by VeloKoder (Jurij Rudenko)


Inspired from **gmap_coordinates_picker** (https://github.com/amuntasim/gmap_coordinates_picker)


